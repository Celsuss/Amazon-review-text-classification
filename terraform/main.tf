
resource "kubernetes_namespace" "review-text-classification-namespace" {
  metadata {
    name = "review-text-classification-ns"
  }
}

resource "kubernetes_deployment" "review-text-classification-deployment" {
  metadata {
    name = "review-text-classification-deployment"
    labels = {
      test = "reviewTextApp"
    }
    namespace = "review-text-classification-ns"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        test = "reviewTextApp"
      }
    }

    template {
      metadata {
        labels = {
          test = "reviewTextApp"
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
