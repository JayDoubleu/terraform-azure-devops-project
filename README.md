# terraform-azure-devops-project
Terraform module to create azure devops project

### Usage: 

```hcl

module "azure_devops_project" {
  source              = "./"
  organization_name   = "${module.vars.devops_org_name}"
  project_name        = "${module.vars.devops_project_name}"
  project_description = "${module.vars.devops_project_description}"
}
```
