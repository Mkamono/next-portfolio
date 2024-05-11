module "service" {
  source                             = "../../modules"
  gcp_project_id                     = var.gcp_project_id
  tfc_organization_name              = var.tfc_organization_name
  tfc_service_account_id             = var.tfc_service_account_id
  workload_identity_pool_id          = var.workload_identity_pool_id
  workload_identity_pool_provider_id = var.workload_identity_pool_provider_id
}
