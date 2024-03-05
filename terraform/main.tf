
resource "kubernetes_namespace" "review-text-classification-namespace" {
  metadata {
    name = "review-text-classification-ns"
  }
}
