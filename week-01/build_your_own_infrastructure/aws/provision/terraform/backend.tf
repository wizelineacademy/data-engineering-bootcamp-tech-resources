# --------------- BACKEND ---------------

terraform {
  backend "s3" {
    bucket = "wz-de-academy-terraform-backend"
    key    = "terraform/statefile"
    region = "us-east-1"
  }
}