variable "project_id" {
  description = "AWS Project ID"
}

variable "environment" {
  default     = "nonprod"
  description = "Environment [dev,stag,prod]"
}