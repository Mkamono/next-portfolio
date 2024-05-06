// 参考:https://engineering.nifty.co.jp/blog/16522
// TF_VAR_xx で環境変数を設定すると、Terraform が自動的に変数として認識する

variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "terraform_service_account" {
  type = string
}

variable "repo_name" {
  type = string
}

variable "github_actions_pool_id" {
  type = string
}

variable "github_actions_pool_provider_id" {
  type = string
}
