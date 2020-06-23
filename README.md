# AWS Private And Encrypted Bucket

This module defines a private encrypted S3 bucket. Created resources are: 

- AWS S3 bucket without public access
- AWS S3 bucket policy mandating that all requests are over SSL and that all object stored in the bucket are encrypted
- AWS KMS CMK key used to secure the object in the bucket
- AWS KMS CMK key policy restricting the access to the key
- A set of IAM Policies that allow read-only, write, admin and console access for this bucket

## Variables

| Name                   | Type    | Default | Required | Description                                                                
| -----------------------| ------- | ------- | -------- | -------------------------------------------------------------------------- 
| bucket_suffix          | string  |         | ✓        | A unique suffix that will form part of the bucket name                                      
| bucket_region          | string  |         | ✓        | AWS region the bucket will be deployed to                                       
| kms_user_role_arns     | string  |         |          | List of IAM Role ARNs that will be allowed to use the KMS CMK created for this bucket                   
| kms_admin_role_arns    | string  |         | ✓        | List of IAM Role ARNs that will be allowed to administer the KMS CMK created for this bucket                                                    
| namespace              | string  |         | ✓        | Namespace used for labeling resources                  
| name                   | string  |         | ✓        | Name of the module / resources                         
| stage                  | string  |         | ✓        | What staga are the resources for? staging, production? 
| tags                   | map     |         | ✓        | Map of tags to be applied to all resources             

## Outputs

| Name                         | Description                                                       |
| ---------------------------- | ----------------------------------------------------------------- |
| bucket_arn                   | Bucket ARN                                                        |
| bucket_name                  | Bucket name                                                       |
| kms_key_arn                  | The ARN KMS CMK for this bucket                                   |
| kms_key_alias_arn            | The ARN of the KMS CMK alias for this bucket                      |
| kms_key_alias_name           | The name of the KMS CMK alias for this bucket                     |
| s3_write_policy_arn          | IAM Policy ARN allowing write access                              |
| s3_read_policy_arn           | IAM Policy ARN allowing read access                               |
| s3_admin_policy_arn          | IAM Policy ARN allowing admin access                              |
| s3_console_access_policy_arn | IAM Policy ARN allowing console access                            |

