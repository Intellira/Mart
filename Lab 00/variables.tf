variable "project" {
  description = "Google Cloud Project ID"
  type = string
}

variable "region" {
  description = "Google Cloud Region"
  type = string
}

variable "storage_name" {
  description = "Google Cloud Storage Bucket"
  type = string
}

variable "storage_class" {
  description = "Google Cloud Storage Class"
  default = "STANDARD"
  type = string
}