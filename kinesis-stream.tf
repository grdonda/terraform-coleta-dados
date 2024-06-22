# criação do recurso kinesis data stream
resource "aws_kinesis_stream" "kinesis_mensuracao_dados" {
  name             = var.kinesis_stream_name
  shard_count      = var.kinesis_stream_shard_count
  retention_period = var.kinesis_stream_retention_period

  stream_mode_details {
    stream_mode = var.kinesis_stream_mode
  }
}