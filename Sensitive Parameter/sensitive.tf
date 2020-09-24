locals {
  db_password = {
    ankit = "mypassword"
  }
}

output "db_password" {
  value     = local.db_password
  sensitive = true
}
