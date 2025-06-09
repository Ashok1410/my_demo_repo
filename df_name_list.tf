resource "google_dataflow_job" "big_data_job" {
  name              = "dataflow-job" # df job name
  template_gcs_path = "gs://dataflow-templates/latest/GCS_CSV_to_BigQuery"
  temp_gcs_location = "gs://copper-eye-461406-a8-bq-data-d69becfc/Temp"
  
  parameters = {
    inputFilePattern                   = "gs://copper-eye-461406-a8-bq-data-d69becfc/name_list.csv"
    outputTable                        = "${var.project_id}:${var.dataset_id}.name_list"
    bigQueryLoadingTemporaryDirectory = "gs://copper-eye-461406-a8-bq-data-d69becfc/dataflow/bq_temp"
    schemaJSONPath                          = "gs://copper-eye-461406-a8-bq-data-d69becfc/schema.json"
    csvFormat                          = "Default"
    delimiter                          = ","
    badRecordsOutputTable              = "${var.project_id}:${var.dataset_id}.bad_records"
  }

  on_delete = "cancel" # or "drain"
  region = var.region

  depends_on = [google_bigquery_table.my_table]

  lifecycle {
  ignore_changes = [state]
}

}
