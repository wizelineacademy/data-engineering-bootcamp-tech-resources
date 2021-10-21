
# ------------------ Service Accounts --------------------------------- #
# module "service_accounts" {
#   source                         = "../../modules/service_accounts/global"
#   env                            = var.env
#   reporting_service_account_name = "cloud-storage-stream"
# }

# ------------------- Storage Buckets --------------------------------- #
module "buckets" {
  source     = "./modules/cloud_storage"
  env        = var.env
  project_id = var.project_id
}

# ------------------- Cloud Functions --------------------------------- #
module "cloud_functions" {
  source                             = "./modules/cloud_functions"
  env                                = var.env
  project_id                         = var.project_id
  raw_data_bucket_name               = module.buckets.raw_data_bucket_name
  cloud_functions_bucket_name        = module.buckets.cloud_functions_bucket_name
  cloud_functions_data_ingestion_zip = module.buckets.cloud_functions_data_ingestion_zip
}

# ------------------- Cloud Scheduler --------------------------------- #
module "cloud_scheduler" {
  source                             = "./modules/cloud_scheduler"
  env                                = var.env
  project_id                         = var.project_id
  cloud_functions_data_ingestion_zip = module.buckets.cloud_functions_data_ingestion_zip
}

# ------------------- BigQuery transfer, dataset, tables -------------- #
# module "bigquery" {
#   source     = "../../modules/bigquery/global"
#   project_id = var.project_id
# }