
# Helm chart
# https://github.com/PrefectHQ/prefect-helm/tree/main/charts/prefect-worker
# resource "helm_release" "prefect_worker" {
#   name       = "prefect-worker"
#   namespace  = kubernetes_namespace.review-text-classification-namespace.metadata.0.name
#   repository = "https://prefecthq.github.io/prefect-helm"
#   chart      = "prefect-worker"

#   set {
#     name  = "worker.config.workpool"
#     value = "default-agent-pool"
#   }
#   set {
#     name  = "worker.serverAPIConfig.apiUrl"
#     value = prefect-server.review-text-classification-ns.svc.cluster.local
#   }
# }
