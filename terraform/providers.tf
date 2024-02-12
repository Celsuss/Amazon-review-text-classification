terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
    # docker = {
    #   source = "kreuzwerker/docker"
    # }
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "minikube"
}

# provider "docker" {
#   host = "unix:///var/run/docker.sock"
# }
