locals {

  common_tags = {
    Project     = var.project
    Environment = var.env
    Terraform   = "True"
  }

  mysql_db_secret_name ="/${var.project}/${var.env}/mysql-db-credentials"
}
