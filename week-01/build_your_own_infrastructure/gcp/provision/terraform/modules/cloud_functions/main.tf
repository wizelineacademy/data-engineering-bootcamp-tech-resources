data "google_iam_policy" "cloud_function_policy" {
  binding {
    role = "roles/cloudfunctions.invoker"

    members = [
      "serviceAccount:${google_service_account.cloud_function_service_account.email}",
    ]
  }

  binding {
    role = "roles/storage.objectAdmin"

    members = [
      "serviceAccount:${google_service_account.cloud_function_service_account.email}",
    ]
  }
}

resource "google_service_account" "cloud_function_service_account" {
  account_id   = "automation"
  display_name = "automation"
  description  = "Service account used for data ingestion automation"
}

resource "google_service_account_iam_policy" "cloud_function_service_account_iam_policy" {
  service_account_id = google_service_account.cloud_function_service_account.name
  policy_data        = data.google_iam_policy.cloud_function_policy.policy_data
}

resource "google_cloudfunctions_function" "data_ingestion_function" {
  name                  = "data_ingestion"
  description           = "downloads and uploads daily cov19_mx data"
  runtime               = "python39"
  available_memory_mb   = 8192
  source_archive_bucket = var.cloud_functions_bucket_name
  source_archive_object = var.cloud_functions_data_ingestion_zip
  trigger_http          = true
  timeout               = 360
  entry_point           = "download_unzip_upload"
  environment_variables = {
    CONTENT_URL = "https://datosabiertos.salud.gob.mx/gobmx/salud/datos_abiertos/datos_abiertos_covid19.zip"
    BUCKET_NAME = var.raw_data_bucket_name
  }
  service_account_email = google_service_account.cloud_function_service_account.email
}

# IAM entry for a single user to invoke the function
resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.data_ingestion_function.project
  region         = google_cloudfunctions_function.data_ingestion_function.region
  cloud_function = google_cloudfunctions_function.data_ingestion_function.name

  role   = "roles/cloudfunctions.invoker"
  member = "serviceAccount:${google_service_account.cloud_function_service_account.email}"
}