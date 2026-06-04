output "prod_namespace" {
  value = kubernetes_namespace.prod.metadata[0].name
}