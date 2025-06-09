resource "google_bigquery_dataset" "my_dataset" {
  dataset_id    = var.dataset_id
  location      = var.location
  friendly_name = "Terraform Demo Dataset"
  description   = "This dataset was created using Terraform"

  labels = {
    environment = "dev"
  }
}

resource "google_bigquery_table" "my_table" {
  dataset_id = var.dataset_id   # Assuming this is already defined
  table_id   = "name_list" # table name

  schema = file("schema.json")  # Define schema separately

  time_partitioning {
    type = "DAY"
  }

  deletion_protection = false
}