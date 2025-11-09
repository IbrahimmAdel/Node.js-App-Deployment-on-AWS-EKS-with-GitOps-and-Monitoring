variable "region" {
  description = "AWS region"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "List of availability zones to use"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "enable_public_access" {
  description = "Enable public access to Kubernetes API"
  type        = bool
  default     = true
}

variable "enable_private_access" {
  description = "Enable private access to Kubernetes API"
  type        = bool
  default     = false
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
}


variable "node_groups" {
  description = "Map of node group configurations for creating multiple node groups"
  type = map(object({
    name           = string
    instance_types = list(string)
    min_size       = number
    max_size       = number
    desired_size   = number
    disk_size      = number
    ami_type       = string
    capacity_type  = string
    labels         = map(string)
    taints = list(object({
      key    = string
      value  = string
      effect = string
    }))
  }))
}

variable "tags" {
  description = "Additional tags for all resources"
  type        = map(string)
  default     = {}
}

variable "enable_ebs_csi" {
  description = "Whether to enable EBS CSI driver for block storage"
  type        = bool
  default     = true
}

variable "enable_efs_csi" {
  description = "Whether to enable EFS CSI driver for shared file storage"
  type        = bool
  default     = false
}

variable "enable_vpc_endpoints" {
  description = "Whether to enable VPC endpoints for ECR for images"
  type        = bool
  default     = true
}

variable "enable_aws_lb_controller" {
  description = "Whether to enable AWS Load Balancer Controller"
  type        = bool
  default     = true
}
