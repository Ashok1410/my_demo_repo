#IAM_assigned_roles
resource "google_bigquery_dataset_iam_member" "editor_role" {
  dataset_id = google_bigquery_dataset.my_dataset.dataset_id
  role       = "roles/bigquery.dataEditor"
  member     = "serviceAccount:${var.iam_user_email}" # could also be group: or serviceAccount:
}

resource "google_storage_bucket_iam_member" "allow_bigquery_to_read_bucket" {
  bucket = google_storage_bucket.my_data_bucket.name
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:${var.iam_user_email}"
  depends_on = [google_storage_bucket.my_data_bucket]
}
