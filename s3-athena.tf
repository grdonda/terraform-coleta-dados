resource "aws_s3_bucket" "s3_bucket_name_athena" {
  bucket = var.s3_bucket_name_athena

  force_destroy = true

  lifecycle {
    prevent_destroy = false
    ignore_changes  = [bucket]
  }

  #depends_on = [null_resource.s3_bucket_name_athena_empty_bucket_on_destroy]
}

# resource "null_resource" "s3_bucket_name_athena_empty_bucket_on_destroy" {
#   triggers = {
#     bucket_name_athena = aws_s3_bucket.s3_bucket_name_athena.bucket
#   }

#   provisioner "local-exec" {
#     command = "aws s3 rm s3://${aws_s3_bucket.s3_bucket_name_athena.bucket} --recursive"
#   }

#   depends_on = [aws_s3_bucket.s3_bucket_name_athena]
# }
