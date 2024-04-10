
# https://artifacthub.io/packages/helm/bitnami/mysql
# https://github.com/bitnami/containers/tree/main/bitnami/mysql
resource "helm_release" "mysql" {
  name      = "mysql"
  namespace = kubernetes_namespace.mlflow-namespace.metadata.0.name

  repository = "https://charts.bitnami.com/bitnami"
  chart      = "mysql"
  # version    = "2.7"

  values = [
    templatefile("${path.module}/mysql-helm-values.yaml", {
    })
  ]
}
