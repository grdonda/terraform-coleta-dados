// terraform block
terraform {

  // required version of terraform
  required_version = ">= 1.8.3"

  // provider obrigatorio
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.53.0"
    }
  }
}