# ------------------- Cloud Storage ----------------------------------- #

module "buckets" {
  source     = "./modules/cloud_storage"
  user_name  = var.user_name
  project_id = var.project_id
}

# ------------------- Cloud Functions --------------------------------- #
module "cloud_functions" {
  source                      = "./modules/cloud_functions"
  project_id                  = var.project_id
  user_name                   = var.user_name
  user_email                  = var.user_email
  raw_data_bucket_name        = module.buckets.raw_data_bucket_name
  cloud_functions_bucket_name = module.buckets.cloud_functions_bucket_name
  cloud_functions_upload_zip  = module.buckets.cloud_functions_upload_zip
}