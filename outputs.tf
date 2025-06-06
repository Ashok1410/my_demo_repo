output "dataset_id" {
  description = "BigQuery dataset ID"
  value       = google_bigquery_dataset.my_dataset.dataset_id
}
