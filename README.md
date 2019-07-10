# terraform-azure-devops-project
Terraform module to create azure devops project
Module is using azure cli devops extension. run az devops login before running.

### Usage: 

```hcl

module "azure_devops_project" {
  source              = "./"
  organization_name   = "existing_organization_name"
  project_name        = "project_name_to_create"
  project_description = "project_description"
}
```
