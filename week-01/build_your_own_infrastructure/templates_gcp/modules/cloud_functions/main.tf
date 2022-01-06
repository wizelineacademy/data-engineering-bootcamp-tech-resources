resource "google_cloudfunctions_function" "upload_function" {
  name                  = "upload_function"
  description           = "Downloads and uploads random json pokemon file from PokeAPI"
  runtime               = "python39"
  available_memory_mb   = 256
  source_archive_bucket = var.cloud_functions_bucket_name
  source_archive_object = var.cloud_functions_upload_zip
  trigger_http          = true
  timeout               = 60
  entry_point           = "download_and_upload"
  environment_variables = {
    BUCKET_NAME = var.raw_data_bucket_name

  }
}

# # IAM entry for a single user to invoke the function
resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.upload_function.project
  region         = google_cloudfunctions_function.upload_function.region
  cloud_function = google_cloudfunctions_function.upload_function.name

  role   = "roles/cloudfunctions.invoker"
  member = "user:${var.user_email}"
}