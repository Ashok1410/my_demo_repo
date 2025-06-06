provider "google" {
  credentials = file("gcp-key.json")         # Path to your service account key
  project     = var.project_id
  region      = var.region                   # Required for some services, not BigQuery
}
