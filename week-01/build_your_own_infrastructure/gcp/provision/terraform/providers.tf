provider "google" {
  credentials = file("credentials/account.json")
  project     = var.project_id
  region      = var.region
  zone        = var.zone
  scopes = [
    "https://www.googleapis.com/auth/drive.readonly",
    "https://www.googleapis.com/auth/compute",
    "https://www.googleapis.com/auth/cloud-platform",
    "https://www.googleapis.com/auth/devstorage.full_control",
  ]
}