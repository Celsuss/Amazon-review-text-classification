
# Deployment
resource "kubernetes_deployment" "frontend-deployment" {
  metadata {
    name = "frontend-deployment"
    labels = {
      app = "Frontend"
    }
    namespace = kubernetes_namespace.review-text-classification-namespace.metadata.0.name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "Frontend"
      }
    }

    template {
      metadata {
        labels = {
          app = "Frontend"
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
resource "kubernetes_service" "frontend-service" {
  metadata {
    name      = "frontend-service"
    namespace = kubernetes_namespace.review-text-classification-namespace.metadata.0.name
  }
  spec {
    selector = {
      app = kubernetes_deployment.frontend-deployment.metadata[0].labels.app
    }
    port {
      node_port   = 30201
      port        = 80
      target_port = 80
    }

    type = "NodePort"
  }
}
