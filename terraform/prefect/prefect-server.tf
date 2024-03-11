
# https://github.com/PrefectHQ/prefect-helm/tree/main/charts/prefect-server
resource "helm_release" "prefect_server" {
  name      = "prefect-server"
  namespace = kubernetes_namespace.review-text-classification-namespace.metadata.0.name

  repository = "https://prefecthq.github.io/prefect-helm"
  chart      = "prefect-server"
}
