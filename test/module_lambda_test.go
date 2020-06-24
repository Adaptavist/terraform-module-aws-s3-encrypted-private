package test

import (
	"fmt"
	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/credentials/stscreds"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/s3"
	testaws "github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"strings"
	"testing"
)

func TestModuleCreatesBucket(t *testing.T) {
	const region string = "eu-west-1"

	bucketSuffix := fmt.Sprintf("terratest-bucket-%s", strings.ToLower(random.UniqueId()))

	terraformOptions := &terraform.Options{
		TerraformDir: "fixtures/default",

		Vars: map[string]interface{}{
			"region":        region,
			"bucket_suffix": bucketSuffix,
		},

		NoColor: true,
	}

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	bucketName := terraform.Output(t, terraformOptions, "bucket_name")
	testingRoleARN := terraform.Output(t, terraformOptions, "testing_role_arn")
	unauthorisedRoleARN := terraform.Output(t, terraformOptions, "unauthorised_testing_role_arn")
	fmt.Println("Bucket name: " + bucketName)

	assertBucketAndPolicyExist(t, bucketName, region)

	keyName := fmt.Sprintf("test-key-%s", strings.ToLower(random.UniqueId()))
	r := strings.NewReader("TEST")
	params := &s3.PutObjectInput{
		Bucket:               &bucketName,
		Key:                  &keyName,
		Body:                 r,
		ServerSideEncryption: aws.String(s3.ServerSideEncryptionAwsKms),
	}

	unauthorisedSess := session.Must(session.NewSession())
	unauthorisedCredentials := stscreds.NewCredentials(unauthorisedSess, unauthorisedRoleARN)
	s3Client := s3.New(unauthorisedSess, &aws.Config{Credentials: unauthorisedCredentials, Region: aws.String(region)})

	assertUnauthorisedUserFailsBucketWrite(t, s3Client, params)

	sess := session.Must(session.NewSession())
	credentials := stscreds.NewCredentials(sess, testingRoleARN)
	authenticatedS3Client := s3.New(sess, &aws.Config{Credentials: credentials, Region: aws.String(region)})

	fmt.Println("Assumed role: " + testingRoleARN)
	assertAuthorisedUserBucketWrite(t, authenticatedS3Client, params)

	//clean up as test won't be able to delete a bucket that is not empty
	testaws.EmptyS3Bucket(t, region, bucketName)
}

func assertUnauthorisedUserFailsBucketWrite(t *testing.T, s3Client *s3.S3, params *s3.PutObjectInput) {
	var err error
	_, err = s3Client.PutObject(params)
	assert.Error(t, err, "AccessDenied")
	fmt.Println(err)
}

func assertAuthorisedUserBucketWrite(t *testing.T, s3Client *s3.S3, params *s3.PutObjectInput) {
	var err error
	_, err = s3Client.PutObject(params)
	fmt.Println(err)
	assert.Nil(t, err)
}

func assertBucketAndPolicyExist(t *testing.T, bucketName string, region string) {
	fmt.Println("Checking bucket " + bucketName + " and policy have been created...")

	testaws.AssertS3BucketExists(t, region, bucketName)
	testaws.AssertS3BucketPolicyExists(t, region, bucketName)
}
