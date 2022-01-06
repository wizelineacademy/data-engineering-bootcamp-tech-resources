# Creates raw_data_bucket bucket
resource "google_storage_bucket" "raw_data_bucket" {
  name          = "${var.project_id}-${var.user_name}-raw-data-bucket"
  location      = "US"
  force_destroy = false
  labels        = {}
  provider      = google
}

# Creates cloud functions bucket
resource "google_storage_bucket" "cloud_functions_bucket" {
  name          = "${var.project_id}-${var.user_name}-cloud-functions"
  location      = "US"
  force_destroy = false
  labels        = {}
  provider      = google
}

# Create cloud function zip file package
resource "null_resource" "zip_the_cloud_function_folder" {
  triggers = {
    build_number = timestamp()
  }

  provisioner "local-exec" {
    command     = "zip -r9 -j upload.zip upload/*"
    working_dir = path.module
  }
}

# Create cloud stroage object with the zip file package content
resource "google_storage_bucket_object" "upload_zip" {
  name       = "upload.zip"
  bucket     = google_storage_bucket.cloud_functions_bucket.name
  source     = "${path.module}/upload.zip"
  metadata   = {}
  provider   = google
  depends_on = [null_resource.zip_the_cloud_function_folder]
}