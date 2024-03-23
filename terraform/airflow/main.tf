
resource "kubernetes_namespace" "airflow-namespace" {
  metadata {
    name = "airflow-ns"
  }
}
