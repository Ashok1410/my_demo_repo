variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "Region for resources (not used for BigQuery but needed by provider)"
  type        = string
  default     = "us-central1"
}

variable "dataset_id" {
  description = "BigQuery dataset ID"
  type        = string
}

variable "location" {
  description = "BigQuery dataset location"
  type        = string
}

variable "iam_user_email" {
  description = "The email of the user to grant access to the dataset"
  type        = string
}
