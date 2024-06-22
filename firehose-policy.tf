resource "aws_iam_policy" "firehose_policy" {
  name = var.firehose_policy_name

  # Permissões para o firehose acessar o kinesis, s3 e glue
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "kinesis:*"
        ]
        Effect   = "Allow"
        Resource = aws_kinesis_stream.kinesis_mensuracao_dados.arn
      },
      {
        Action = [
          "s3:*"
        ]
        Effect = "Allow"
        Resource = [
          aws_s3_bucket.s3_bucket_name_firehose_glue.arn,
          "arn:aws:s3:::${var.s3_bucket_name_firehose_glue}/*",
        ]
      },
      {
        Action = [
          "glue:*"
        ]
        Effect = "Allow"
        Resource = [
          "arn:aws:glue:us-east-1:838940311549:catalog",
          "arn:aws:glue:us-east-1:838940311549:database/*",
          "arn:aws:glue:us-east-1:838940311549:table/*/*"
        ]
      }
    ]
  })
}

# Anexa a policy ao role
resource "aws_iam_role_policy_attachment" "attach_firehose_policy" {
  role       = aws_iam_role.firehose_role.name
  policy_arn = aws_iam_policy.firehose_policy.arn
}

