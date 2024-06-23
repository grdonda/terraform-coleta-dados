

# configurando athena para setar o bucket de queries
# resource "aws_athena_workgroup" "athena_workgroup_mensuracao" {
#   name = var.athena_workgroup_name

#   configuration {
#     enforce_workgroup_configuration    = true
#     publish_cloudwatch_metrics_enabled = true

#     result_configuration {
#       output_location = "s3://${aws_s3_bucket.s3_bucket_name_athena.bucket}/"
#     }
#   }

#   state = "ENABLED"
# }


# resource "null_resource" "update_primary_workgroup" {
#   provisioner "local-exec" {
#     command = <<EOT
#       aws athena update-work-group --work-group primary --configuration-updates 'ResultConfigurationUpdates={OutputLocation="s3://${aws_s3_bucket.s3_bucket_name_athena.bucket}/"}'
#     EOT
#   }
#
#   depends_on = [aws_s3_bucket.s3_bucket_name_athena]
# }