output "az_output" {
  value      = jsondecode(data.null_data_source.file.outputs["data"])["id"]
  depends_on = [null_resource.devops_project_create]
}
