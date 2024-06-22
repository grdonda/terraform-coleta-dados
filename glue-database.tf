# criação de uma base de dados no glue
resource "aws_glue_catalog_database" "glue_database_mensuracao" {
  name = var.glue_database_name
}