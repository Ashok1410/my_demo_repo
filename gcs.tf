resource "google_storage_bucket" "my_data_bucket" {
  name     = "${var.project_id}-bq-data-d69becfc"  # ensures global uniqueness
  location = "${var.location}"  # or your preferred region like "ASIA-SOUTH1"
  force_destroy = true  # allows Terraform to delete non-empty bucket

  uniform_bucket_level_access = true
}

#resource "random_id" "suffix" {
#  byte_length = 4
#}

