# resource "aws_iam_role" "kinesis_data_stream_role" {
#   name               = "kinesis-data-stream-role"
#   assume_role_policy = jsonencode()

# }

# resource "aws_iam_policy" "kinesis_data_stream_policy" {
#   name        = "kinesis-data-stream-policy"
#   description = "Policy for accessing Kinesis Data Streams"
#   policy      = jsonencode()
# }

# resource "aws_iam_role_policy_attachment" "kinesis_data_stream_attach" {
#   role       = aws_iam_role.kinesis_data_stream_role.name
#   policy_arn = aws_iam_policy.kinesis_data_stream_policy.arn
# }
