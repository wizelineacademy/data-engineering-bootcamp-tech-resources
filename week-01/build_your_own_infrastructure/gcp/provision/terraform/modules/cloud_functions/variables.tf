variable "env" {
  description = "Current working environment either dev or prod"
}

variable "project_id" {
  description = "project_id"
}

variable "raw_data_bucket_name" {
  default = null
}

variable "cloud_functions_bucket_name" {
  default = null
}

variable "cloud_functions_data_ingestion_zip" {
  default = null
}