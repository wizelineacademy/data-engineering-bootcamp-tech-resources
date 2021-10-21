# ------------------- Remote Backend Configuration --------------------------- #
terraform {
  backend "gcs" {
    bucket = "de-academy-w01_terraform_backend"
    prefix = "state"
  }
}