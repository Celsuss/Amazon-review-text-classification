
# https://github.com/airflow-helm/charts/tree/main/charts/airflow
resource "helm_release" "airflow" {
  name      = "airflow"
  namespace = kubernetes_namespace.review-text-classification-namespace.metadata.0.name

  repository = "https://airflow.apache.org/"
  chart      = "airflow"
  # version    = "2.7"

  # values = [file("${path.module}/values.yaml")]

  # TODO The following variables needs to be set
  # createUserJob:
  # useHelmHooks: false
  # applyCustomEnv: false
  # migrateDatabaseJob:
  # useHelmHooks: false
  # applyCustomEnv: false
  set {
    name  = "createUserJob.useHelmHooks"
    value = false
  }
  set {
    name  = "createUserJob.applyCustomEnv"
    value = false
  }
  set {
    name  = "migrateDatabaseJob.useHelmHooks"
    value = false
  }
  set {
    name  = "migrateDatabaseJob.applyCustomEnv"
    value = false
  }
}
