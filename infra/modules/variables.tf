// TF_VAR_xx で環境変数を設定すると、Terraform が自動的に変数として認識する

# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "tfc_gcp_audience" {
  type        = string
  default     = ""
  description = "The audience value to use in run identity tokens if the default audience value is not desired."
}

variable "tfc_hostname" {
  type        = string
  default     = "app.terraform.io"
  description = "The hostname of the TFC or TFE instance you'd like to use with GCP"
}

variable "tfc_organization_name" {
  type        = string
  description = "The name of your Terraform Cloud organization"
}

variable "tfc_project_name" {
  type        = string
  default     = "Default Project"
  description = "The project under which a workspace will be created"
}

variable "tfc_workspace_name" {
  type        = string
  default     = "my-gcp-workspace"
  description = "The name of the workspace that you'd like to create and connect to GCP"
}

variable "gcp_project_id" {
  type        = string
  description = "The ID for your GCP project"
}

variable "gcp_service_list" {
  description = "APIs required for the project"
  type        = list(string)
  default = [
    "iam.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "sts.googleapis.com",
    "iamcredentials.googleapis.com"
  ]
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
