// região que irei atual
provider "aws" {

  // definição da região
  region = var.aws_region

  // definição do profile
  // o terraform irá buscar as credenciais no arquivo ~/.aws/credentials
  // para poder usar o profile default para executar as operações
  // logo, o profile default deve ter as credenciais corretas e devidas permissoes
  profile = "default"
}