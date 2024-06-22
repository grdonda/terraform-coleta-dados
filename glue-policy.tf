# resource "aws_iam_policy" "glue_policy" {
#   name        = "glue_policy"
#   description = "Policy to allow access to AWS Glue actions."
#
#   policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Effect = "Allow",
#         Action = [
#           "glue:*"
#         ],
#         Resource = [
#           "arn:aws:glue:us-east-1:838940311549:catalog",
#           "arn:aws:glue:us-east-1:838940311549:database/*",
#           "arn:aws:glue:us-east-1:838940311549:table/*/*"
#         ]
#       }
#     ]
#   })
# }
#
# resource "aws_iam_role_policy_attachment" "attach_glue_policy" {
#   role       = aws_iam_role.firehose_role.name
#   policy_arn = aws_iam_policy.glue_policy.arn
# }