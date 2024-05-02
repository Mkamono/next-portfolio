// 参考:https://qiita.com/bosq/items/afdf3e3ccf20b5c01ec5

resource "google_project_service" "project" {
  project = vars.project_id
  service = "iamcredentials.googleapis.com"
}

resource "google_iam_workload_identity_pool" "github_actions_pool" {
  provider                  = google-beta
  project                   = vars.project_id
  workload_identity_pool_id = vars.github_actions_pool_id
  display_name              = "github-oidc-pool"
  description               = "GitHub Actionsで使用"
}

resource "google_iam_workload_identity_pool_provider" "github_actions" {
  provider                           = google-beta
  project                            = vars.project_id
  workload_identity_pool_id          = google_iam_workload_identity_pool.github_actions_pool.workload_identity_pool_id
  workload_identity_pool_provider_id = vars.github_actions_pool_provider_id
  display_name                       = "github-actions"
  description                        = "GitHub Actionsで使用"
  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.repository" = "assertion.repository"
  }
  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}

data "google_service_account" "terraform_sa" {
  account_id = vars.terraform_sa
}

resource "google_service_account_iam_member" "terraform_sa_workload_identity_user" {
  service_account_id = data.google_service_account.terraform_sa.id
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github_actions_pool.name}/attribute.repository/${vars.repo_name}"
}
