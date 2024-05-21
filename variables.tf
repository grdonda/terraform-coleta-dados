# added var region to region us-east-1

variable "region" {
  description = "The AWS region to deploy resources."
  default     = "us-east-1"
  type        = string
}
# 838940311549

variable "profile" {
  description = "The AWS profile to use from ~/.aws/credentials file."
  default     = "default"
  type        = string
}

### role definitions


# ### s3 definitions
# variable "s3_arn" {
#   description = "The ARN of the S3 bucket."
#   type        = string
# }

# variable "s3_bucket_prefix" {
#   description = "The prefix for the S3 bucket."
#   type        = string
# }

# variable "s3_force_destroy" {
#   description = "A boolean flag to enable force destroy of the S3 bucket."
#   type        = bool
#   default     = false
# }

# ### firehose definitions
# variable "firehose_delivey_stream" {
#   description = "The name of the Kinesis Firehose delivery stream."
#   type        = string
# }

# variable "firehose_destination" {
#   description = "The destination for the Kinesis Firehose delivery stream."
#   type        = string
# }
