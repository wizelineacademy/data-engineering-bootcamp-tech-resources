# --------------- PROVIDER --------------

provider "aws" {
  alias = "virginia"
  assume_role {
    role_arn = null
  }
  region = "us-east-1"
}

# --------------- MODULES ---------------

module "s3_buckets" {
  source                         = "./modules/s3_buckets"
  project_id                     = var.project_id
  create_raw_data_bucket         = true
  create_lambda_functions_bucket = true
  providers = {
    aws = aws.virginia
  }
}