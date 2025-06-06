#IAM_assigned_roles
resource "google_bigquery_dataset_iam_member" "editor_role" {
  dataset_id = google_bigquery_dataset.my_dataset.dataset_id
  role       = "roles/bigquery.dataEditor"
  member     = "serviceAccount:${var.iam_user_email}" # could also be group: or serviceAccount:
}
