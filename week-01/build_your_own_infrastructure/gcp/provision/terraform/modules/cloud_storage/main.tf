resource "google_storage_bucket" "raw_data_bucket" {
  name          = "${var.project_id}_raw_data"
  location      = "US"
  force_destroy = false
  provider      = google
}

resource "google_storage_bucket" "cloud_functions_bucket" {
  name          = "${var.project_id}_cloud_functions"
  location      = "US"
  force_destroy = false
  provider      = google
}

# data_ingestion Cloud Function
data "archive_file" "data_ingestion_zipfile" {
  type        = "zip"
  output_path = "${path.module}/functions/data-ingestion.zip"
  source {
    content  = "${path.module}/functions/data_ingestion/data_ingestion.py"
    filename = "data_ingestion.py"
  }
  source {
    content  = "${path.module}/functions/data_ingestion/requirements.txt"
    filename = "requirements.txt"
  }
}

resource "google_storage_bucket_object" "data_ingestion_zip" {
  name     = "data-ingestion.zip"
  bucket   = google_storage_bucket.cloud_functions_bucket.name
  source   = "${path.module}/functions/data-ingestion.zip"
  provider = google
}