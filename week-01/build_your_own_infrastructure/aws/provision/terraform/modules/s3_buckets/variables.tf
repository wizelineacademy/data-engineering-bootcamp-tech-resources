variable "project_id" {
  description = "AWS Project ID"
}

variable "create_raw_data_bucket" {
  type    = bool
  default = false
}

variable "create_lambda_functions_bucket" {
  type    = bool
  default = false
}