variable "user_name" {
  description = "Default user name used as sufix"
}

variable "user_email" {
  description = "Default user email that is able to trigger CF"
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

variable "cloud_functions_upload_zip" {
  default = null
}