# criação de tabela no glue
resource "aws_glue_catalog_table" "glue_table_mensuracao" {
  name          = var.glue_table_name
  database_name = aws_glue_catalog_database.glue_database_mensuracao.name

  table_type = "EXTERNAL_TABLE"

  parameters = {
    EXTERNAL              = "TRUE"
    "parquet.compression" = var.firehose_extended_s3_compression_format
  }

  storage_descriptor {
    location      = "s3://${var.s3_bucket_name_firehose_glue}/"
    input_format  = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat"
    output_format = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat"

    ser_de_info {
      serialization_library = "org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe"
    }

    columns {
      name = "username"
      type = "string"
    }

    columns {
      name = "password"
      type = "string"
    }
  }

  partition_keys {
    name = "year"
    type = "int"
  }

  partition_keys {
    name = "month"
    type = "int"
  }

  partition_keys {
    name = "day"
    type = "int"
  }

  depends_on = [
    aws_glue_catalog_database.glue_database_mensuracao
  ]
}