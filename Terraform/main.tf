terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0"
    }
  }
}

provider "aws" {
  region = var.region
}

provider "helm" {
  kubernetes {
    host                   = module.eks_cluster.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks_cluster.cluster_certificate_authority_data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      args = [
        "eks",
        "get-token",
        "--cluster-name",
        module.eks_cluster.cluster_name,
        "--region",
        var.region
      ]
    }
  }
}

module "eks_cluster" {
  source = "./eks-module"

  region                = var.region 
  vpc_cidr              = var.vpc_cidr                  
  availability_zones    = var.availability_zones         
  enable_public_access  = var.enable_public_access
  enable_private_access = var.enable_private_access
  cluster_name          = var.cluster_name
  cluster_version       = var.cluster_version
  node_groups           = var.node_groups
  tags                  = var.tags
  enable_ebs_csi        = var.enable_ebs_csi
  enable_efs_csi        = var.enable_efs_csi
  enable_vpc_endpoints  = var.enable_vpc_endpoints
}
