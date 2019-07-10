resource "null_resource" "devops_project_create" {
  provisioner "local-exec" {
    command = <<-EOT
    az devops project create \
    --name ${var.project_name} \
    --description "${var.project_description}" \
    --org "https://dev.azure.com/${var.organization_name}" \
    --source-control git \
    --visibility private > ${path.module}/devops_project_output.log
    EOT
  }
}

data "null_data_source" "file" {
  inputs = {
    null = "${format(null_resource.devops_project_create.id)}"
    data = file("${path.module}/devops_project_output.log")
  }
}


resource "null_resource" "devops_project_destroy" {
  provisioner "local-exec" {
    when = "destroy"
    command = <<-EOT
    az devops project delete \
    --id  ${jsondecode(data.null_data_source.file.outputs["data"])["id"]} \
    --org https://dev.azure.com/${var.organization_name} \
    --yes && \
    echo 0 > "${path.module}/devops_project_output.log"
    EOT
    }

  }
