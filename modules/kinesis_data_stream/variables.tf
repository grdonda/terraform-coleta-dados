
### kinesis definitions
variable "kinesis_stream_name" {
  description = "The name of the Kinesis stream."
  type        = string
}

variable "kinesis_stream_shard_count" {
  description = "The number of shards for the Kinesis stream."
  type        = number
  default     = 1
}