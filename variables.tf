# AWS data
variable "aws_region" {
  description = "região onde os recursos serão criados"
  type        = string
}

# S3
variable "s3_bucket_name_firehose_glue" {
  description = "nome do bucket s3 para o firehose colocar arquivos para importar no glue"
  type        = string
}

variable "s3_bucket_name_athena" {
  description = "nome do bucket s3 para o athena colocar as queries"
  type        = string
}

# Kinesis data stream
variable "kinesis_stream_name" {
  description = "nome do kinesis data stream"
  type        = string
}

variable "kinesis_stream_shard_count" {
  description = "quantidade de shards do kinesis data stream"
  type        = number
}

variable "kinesis_stream_retention_period" {
  description = "período de retenção dos dados no kinesis data stream"
  type        = number
}

variable "kinesis_stream_mode" {
  description = "modo de stream do kinesis data stream"
  type        = string
}

# Firehose delivery stream
variable "firehose_stream_name" {
  description = "nome do firehose delivery stream"
  type        = string
}

variable "firehose_stream_destination" {
  description = "destino do firehose delivery stream"
  type        = string
}

variable "firehose_policy_name" {
  description = "policy para o firehose"
  type        = string
}

variable "firehose_role_name" {
  description = "role para o firehose"
  type        = string
}

variable "firehose_cloudwatch_logging_enabled" {
  description = "habilita o log do cloudwatch para o firehose"
  type        = bool
}

variable "firehose_cloudwatch_log_group_name" {
  description = "nome do grupo de log do cloudwatch para o firehose"
  type        = string
}

variable "firehose_cloudwatch_log_stream_name" {
  description = "nome do stream de log do cloudwatch para o firehose"
  type        = string
}

variable "firehose_extended_s3_buffering_size" {
  description = "tamanho do buffer para o firehose"
  type        = number
}

variable "firehose_extended_s3_buffering_interval" {
  description = "intervalo do buffer para o firehose"
  type        = number
}

variable "firehose_extended_s3_compression_format" {
  description = "formato de compressão para o firehose"
  type        = string
}

variable "firehose_extended_s3_data_format_conversion_enabled" {
  description = "habilita a conversão de formato de dados para o firehose"
  type        = bool
}

variable "firehose_extended_s3_schema_configuration_version_id" {
  description = "versão do schema para o firehose"
  type        = string
}

# Glue database
variable "glue_database_name" {
  description = "nome da base de dados no glue"
  type        = string
}

variable "glue_table_name" {
  description = "nome da tabela no glue"
  type        = string
}

# Athena
variable "athena_workgroup_name" {
  description = "nome do workgroup no athena"
  type        = string
}
