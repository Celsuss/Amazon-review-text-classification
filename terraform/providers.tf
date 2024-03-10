terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
    # https://registry.terraform.io/providers/hashicorp/helm/latest/docs
    helm = {
      source  = "hashicorp/helm"
      version = "2.12.1"
    }
    # https://github.com/PrefectHQ/terraform-provider-prefect/blob/main/docs/guides/getting-started.md
    prefect = {
      source = "prefecthq/prefect"
    }
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "minikube"
}

provider "helm" {
  kubernetes {
    config_path    = "~/.kube/config"
    config_context = "minikube"
  }
}

provider "prefect" {
  # api_key      = var.prefect_api_key
  # account_id   = var.prefect_account_id
  # workspace_id = var.prefect_workspace_id
  endpoint = "http://localhost:4200"
}
