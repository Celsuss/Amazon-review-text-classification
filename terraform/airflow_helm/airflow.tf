
# https://github.com/airflow-helm/charts/tree/main/charts/airflow
resource "helm_release" "airflow" {
  name      = "airflow"
  namespace = kubernetes_namespace.airflow-namespace.metadata.0.name

  repository = "https://airflow.apache.org/"
  chart      = "airflow"
  # version    = "2.7"

  values = [
    templatefile("${path.module}/airflow-helm-values.yaml", {
      # airflow_version                = "2.7.0"
      # dags_repo                      = "https://github.com/Celsuss/Amazon-review-text-classification"
      # dags_repo_branch               = "main"
      # dns_name                       = "airflow.host.com"
      # webserverSecretKeySecretName = kubernetes_secret.airflow-webserver-secret.metadata[0].name
      # github_credentials_secret_name = kubernetes_secret.github-credentials.metadata[0].name
    })
  ]

  # set {
  #   name  = "web.service.nodePort.http"
  #   value = "30007"
  # }

  # # Reomve this if using load balancer
  # set {
  #   name  = "web.service.type"
  #   value = "NodePort"
  # }
}
