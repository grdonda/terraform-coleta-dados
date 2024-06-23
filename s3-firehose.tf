resource "aws_s3_bucket" "s3_bucket_name_firehose_glue" {
  bucket = var.s3_bucket_name_firehose_glue

  force_destroy = true

  lifecycle {
    prevent_destroy = false
    ignore_changes  = [bucket]
  }

  #depends_on = [null_resource.s3_bucket_name_firehose_glue_empty_bucket_on_destroy]
}

# resource "null_resource" "s3_bucket_name_firehose_glue_empty_bucket_on_destroy" {
#   triggers = {
#     bucket_name_firehose_glue = aws_s3_bucket.s3_bucket_name_firehose_glue.bucket
#   }

#   provisioner "local-exec" {
#     command = "aws s3 rm s3://${aws_s3_bucket.s3_bucket_name_firehose_glue.bucket} --recursive"
#   }

#   depends_on = [aws_s3_bucket.s3_bucket_name_firehose_glue]
# }