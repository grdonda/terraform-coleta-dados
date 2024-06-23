# criação do recurso kinesis firehose
resource "aws_kinesis_firehose_delivery_stream" "firehose_mensuracao_dados" {
  name        = var.firehose_stream_name
  destination = var.firehose_stream_destination

  kinesis_source_configuration {
    kinesis_stream_arn = aws_kinesis_stream.kinesis_mensuracao_dados.arn
    role_arn           = aws_iam_role.firehose_role.arn
  }

  extended_s3_configuration {
    role_arn           = aws_iam_role.firehose_role.arn
    bucket_arn         = aws_s3_bucket.s3_bucket_name_firehose_glue.arn
    buffering_size     = var.firehose_extended_s3_buffering_size
    buffering_interval = var.firehose_extended_s3_buffering_interval
    compression_format = var.firehose_extended_s3_compression_format

    #dynamic_partitioning_configuration {
    #  enabled        = "true"
    #}

    prefix              = "year=!{timestamp:yyyy}/month=!{timestamp:MM}/day=!{timestamp:dd}/hour=!{timestamp:HH}/"
    error_output_prefix = "errors/year=!{timestamp:yyyy}/month=!{timestamp:MM}/day=!{timestamp:dd}/hour=!{timestamp:HH}/!{firehose:error-output-type}/"

    cloudwatch_logging_options {
      enabled         = var.firehose_cloudwatch_logging_enabled
      log_group_name  = var.firehose_cloudwatch_log_group_name
      log_stream_name = var.firehose_cloudwatch_log_stream_name
    }

    data_format_conversion_configuration {
      enabled = var.firehose_extended_s3_data_format_conversion_enabled

      input_format_configuration {
        deserializer {
          open_x_json_ser_de {}
        }
      }

      output_format_configuration {
        serializer {
          parquet_ser_de {}
        }
      }

      schema_configuration {
        role_arn = aws_iam_role.firehose_role.arn

        database_name = aws_glue_catalog_database.glue_database_mensuracao.name
        table_name    = aws_glue_catalog_table.glue_table_mensuracao.name

        region     = var.aws_region
        version_id = var.firehose_extended_s3_schema_configuration_version_id
      }
    }
  }
}