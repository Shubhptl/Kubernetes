resource "kubernetes_namespace" "prod" {
  metadata {
    name = "prod"

    labels = {
      istio-injection = "enabled"
    }
  }
}