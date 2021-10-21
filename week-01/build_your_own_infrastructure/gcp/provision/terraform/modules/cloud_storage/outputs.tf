output "raw_data_bucket_name" {
  value = google_storage_bucket.raw_data_bucket.name
}

output "cloud_functions_bucket_name" {
  value = google_storage_bucket.cloud_functions_bucket.name
}

output "cloud_functions_data_ingestion_zip" {
  value = google_storage_bucket_object.data_ingestion_zip.output_name
}