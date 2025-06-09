resource "google_dataflow_job" "big_data_job" {
  name              = "dataflow-job" # df job name
  template_gcs_path = "gs://dataflow-templates/latest/GCS_Text_to_BigQuery"
  temp_gcs_location = "gs://copper-eye-461406-a8-bq-data-d69becfc/Temp"
  
  parameters = {
    inputFilePattern                   = "gs://copper-eye-461406-a8-bq-data-d69becfc/name_list.csv"
    outputTable                        = "${var.project_id}:${var.dataset_id}.name_list"
    bigQueryLoadingTemporaryDirectory = "gs://copper-eye-461406-a8-bq-data-d69becfc/dataflow/bq_temp"
    JSONPath                          = "gs://copper-eye-461406-a8-bq-data-d69becfc/schema.json"
  }

  on_delete = "cancel" # or "drain"
  region = var.region

  depends_on = [google_project_iam_member.dataflow_permissions]

  lifecycle {
  ignore_changes = [state]
}

}
