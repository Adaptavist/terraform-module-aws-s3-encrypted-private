Feature: S3 bucket tests

  Scenario: Bucket is created and has a encryption enabled
    Given I have aws_s3_bucket defined
    Then it must contain server_side_encryption_configuration
    And it must contain rule
    And it must contain apply_server_side_encryption_by_default

  Scenario: Public access is disabled - public acl
    Given I have aws_s3_bucket_public_access_block defined
    Then it must contain block_public_acls
    And its value must be true

  Scenario: Public access is disabled - public policy
    Given I have aws_s3_bucket_public_access_block defined
    Then it must contain block_public_policy
    And its value must be true

  Scenario: Public access is disabled - ignore public acl
    Given I have aws_s3_bucket_public_access_block defined
    Then it must contain ignore_public_acls
    And its value must be true

  Scenario: Public access is disabled - restrict public buckets
    Given I have aws_s3_bucket_public_access_block defined
    Then it must contain restrict_public_buckets
    And its value must be true

  Scenario: IAM policies are defined
    Given I have aws_iam_policy_document defined
    Then it must contain statement
    And its value must match the ".*test-bucket.*" regex