provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"  # Use the updated kubeconfig file
  }
}

resource "helm_release" "nodejs_app" {
  depends_on = [null_resource.update_kubeconfig]

  name       = "nodejs-app"
  chart      = "./nodejs-helm-chart"
 
  set {
    name  = "image.repository"
    value = var.nodejs_image_repository
  }

  set {
    name  = "image.tag"
    value = var.nodejs_image_tag
  }

  set {
    name  = "replicaCount"
    value = var.nodejs_replica_count
  }

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }

  lifecycle {
    ignore_changes = all
  }  
}

# Helm release for MongoDB
resource "helm_release" "mongodb" {
  name       = "mongodb"
  chart      = "./mongodb-helm-chart"
  namespace  = "default"

  depends_on = [null_resource.update_kubeconfig]  # Wait for kubeconfig to update

  set {
    name  = "image.tag"
    value = var.mongodb_image_tag
  }

  set {
    name  = "replicaCount"
    value = var.mongodb_replica_count
  }

}