variable "tfc_organization_name" {
  type        = string
  description = "The name of your Terraform Cloud organization"
}

variable "gcp_project_id" {
  type        = string
  description = "The ID for your GCP project"
}

variable "workload_identity_pool_id" {
  type        = string
  description = "The ID of the workload identity pool."
}

variable "workload_identity_pool_provider_id" {
  type        = string
  description = "The ID of the workload identity pool provider."
}

variable "tfc_service_account_id" {
  type        = string
  description = "The name of the service account that will be created"
}
