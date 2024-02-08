
resource "kubernetes_namespace" "review-text-classification-namespace" {
  metadata {
    name = "review-text-classification-namespace"
  }
}

resource "kubernetes_deployment" "review-text-classification-deployment" {
  metadata {
    name = "review-text-classification-deployment"
    labels = {
      test = "MyExampleApp"
    }
    namespace = "review-text-classification-namespace"
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        test = "MyExampleApp"
      }
    }

    template {
      metadata {
        labels = {
          test = "MyExampleApp"
        }
      }

      spec {
        container {
          image = "nginx:1.21.6"
          name  = "example"
        }
      }
    }
  }
}
