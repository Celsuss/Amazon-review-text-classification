
# Terraform provider
# https://github.com/PrefectHQ/terraform-provider-prefect/blob/main/docs/resources/work_pool.md
resource "prefect_work_pool" "prefect_work_pool" {
  name   = "k8-work-pool"
  type   = "kubernetes"
  paused = false
}
