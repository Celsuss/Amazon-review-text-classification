
# https://github.com/PrefectHQ/prefect-helm/tree/main/charts/prefect-server

resource "helm_release" "prefect_server" {
  # metadata {
  #   name      = "prefect-server"
  #   namespace = kubernetes_namespace.review-text-classification-namespace.metadata.0.name
  # }
  name      = "prefect-server"
  namespace = kubernetes_namespace.review-text-classification-namespace.metadata.0.name

  repository = "https://prefecthq.github.io/prefect-helm"
  chart      = "prefect-server"

  # repository = "https://charts.bitnami.com/bitnami"
  # chart = "nginx-ingress-controller"

  # set {
  #   name  = "service.type"
  #   value = "ClusterIP"
  # }
}
