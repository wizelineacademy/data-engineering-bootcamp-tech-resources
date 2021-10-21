resource "aws_s3_bucket" "raw_data_bucket" {
  count  = var.create_raw_data_bucket ? 1 : 0
  bucket = "${var.project_id}_raw_data"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket_public_access_block" "raw_data_bucket_access" {
  count                   = var.create_raw_data_bucket ? 1 : 0
  bucket                  = aws_s3_bucket.raw_data_bucket[0].id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket" "lambda_functions_bucket" {
  count  = var.create_lambda_functions_bucket ? 1 : 0
  bucket = "${var.project_id}_lambda_functions"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket_public_access_block" "lambda_functions_bucket_access" {
  count                   = var.create_lambda_functions_bucket ? 1 : 0
  bucket                  = aws_s3_bucket.lambda_functions_bucket[0].id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}