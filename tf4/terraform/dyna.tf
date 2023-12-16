resource "aws_dynamodb_table" "crud-table" {
    name ="${var.app_id}-${var.app_env}-db"
    billing_mode = "PROVISIONED"
    read_capacity = 5
    write_capacity = 5
    hash_key = "id"

    attribute {
      name = "id"
      type = "S"
    }
    tags = {
      Project = "demo-terraform"
      Owner = "DevOps Team"
      Environment ="${var.app_env}"
    }
}