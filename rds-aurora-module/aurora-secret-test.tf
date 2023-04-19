resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_%@"
}

resource "aws_secretsmanager_secret" "secretmasterDB" {
   name = "aurora-accelerator-test-01"
}

resource "aws_secretsmanager_secret_version" "sversion" {
  secret_id = aws_secretsmanager_secret.secretmasterDB.id
  secret_string = <<EOF
   {
    "username": "${var.admin_user}",
    "password": "${random_password.password.result}"
   }
EOF
depends_on    = [aws_secretsmanager_secret.secretmasterDB]
}

data "aws_secretsmanager_secret" "secretmasterDB" {
  arn = aws_secretsmanager_secret.secretmasterDB.arn
}

data "aws_secretsmanager_secret_version" "creds" {
  secret_id = data.aws_secretsmanager_secret.secretmasterDB.arn
}

locals {
  db_creds = jsondecode(data.aws_secretsmanager_secret_version.creds.secret_string)
}
