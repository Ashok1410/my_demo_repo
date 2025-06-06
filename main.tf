resource "google_bigquery_dataset" "my_dataset" {
  dataset_id    = var.dataset_id
  location      = var.location
  friendly_name = "Terraform Demo Dataset"
  description   = "This dataset was created using Terraform"

  labels = {
    environment = "dev"
  }
}
