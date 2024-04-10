
resource "kubernetes_namespace" "mlflow-namespace" {
  metadata {
    name = "mlflow-ns"
  }
}
