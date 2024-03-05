
# Deployment
resource "kubernetes_deployment" "review-text-classification-frontend-deployment" {
  metadata {
    name = "review-text-classification-frontend-deployment"
    labels = {
      app = "reviewTextFrontend"
    }
    namespace = kubernetes_namespace.review-text-classification-namespace.metadata.0.name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "reviewTextFrontend"
      }
    }

    template {
      metadata {
        labels = {
          app = "reviewTextFrontend"
        }
      }

      spec {
        container {
          image             = "review-text-frontend"
          name              = "review-text-frontend"
          image_pull_policy = "Never"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

# Service
resource "kubernetes_service" "review-text-classification-frontend-service" {
  metadata {
    name      = "review-text-classification-frontend-service"
    namespace = kubernetes_namespace.review-text-classification-namespace.metadata.0.name
  }
  spec {
    selector = {
      app = kubernetes_deployment.review-text-classification-frontend-deployment.metadata[0].labels.app
    }
    port {
      node_port   = 30201
      port        = 80
      target_port = 80
    }

    type = "NodePort"
  }
}
