## criação de roles e policies

# role kinesis

# quem assumir essa ROLE do kinesis pode fazer as ações descritas na policy
# a policy é anexada a role
# a role é anexada ao serviço kinesis
resource "aws_iam_role" "kinesis_data_stream_role" {
  // nome da role
  name = "kinesis-data-stream-role"

  //
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {

          // conta que pode assumir essa role
          //aws = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root",

          // um serviço pode assumir essa role
          Service = "kinesis.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# policy kinesis
# são as ações que a tecnologia pode executar
# a policy é anexada a role

resource "aws_iam_policy" "kinesis_data_stream_policy" {

  // name para a policy
  name = "kinesis-data-stream-policy"

  // descrição da policy
  description = "Policy for accessing Kinesis Data Streams"

  // configuraçao da policy
  policy = jsonencode({

    // id unico da policy
    Id = "DsiPolicyKinesisDataStreams",

    // versão da policy
    Version = "2012-10-17",

    // ações que a policy pode executar
    Statement = [
      // primeiro objeto de definição
      {

        // Sid é um identificador único para a declaração
        Sid = "KinesisDataStreams",

        // efeito da ação - allow (allow permitir)
        Effect = "Allow",

        // ação que a policy pode executar
        Action = [
          "kinesis:PutRecord",
          "kinesis:PutRecords",
        ],

        // recursos que a policy pode acessar
        Resource = ["*"]
      }
    ]
  })
}
/*
resource "aws_kinesis_stream" "kinesis_data_stream_1" {
  name        = "stream-1"
  shard_count = "1"

  stream_mode_details {
    stream_mode = "PROVISIONED"
  }

  depends_on = [ aws_iam_policy.kinesis_data_stream_policy ]
}

resource "aws_kinesis_resource_policy" "kinesis_data_stream_1_policy" {
  resource_arn = aws_kinesis_stream.kinesis_data_stream_1.arn
  policy = aws_iam_policy.kinesis_data_stream_policy.policy
  depends_on = [aws_kinesis_stream.kinesis_data_stream_1]
}*/