
resource "kubernetes_namespace" "review-text-classification-namespace" {
  metadata {
    name = "review-text-classification-ns"
  }
}

module "mlflow" {
  source = "./mlflow"
}

module "airflow" {
  source = "./airflow_helm"
}
