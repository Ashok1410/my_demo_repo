output "dataset_id" {
  description = "BigQuery dataset ID"
  value       = google_bigquery_dataset.my_dataset.dataset_id
}

output "bucket_name" {
  value = google_storage_bucket.my_data_bucket.name
}