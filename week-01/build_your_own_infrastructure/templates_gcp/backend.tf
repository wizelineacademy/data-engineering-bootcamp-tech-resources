# ------------------- Remote Backend Configuration --------------------------- #
terraform {
  backend "gcs" {
    bucket = "wz-de-academy-dan-terraform-bucket"
    prefix = "state"
  }
}