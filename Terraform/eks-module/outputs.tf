output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.vpc.id
}

output "private_subnet_ids" {
  description = "IDs of the created private subnets"
  value       = aws_subnet.private[*].id
}

output "vpc_endpoints_info" {
  description = "Information about VPC endpoints"
  value       = var.enable_vpc_endpoints ? "VPC endpoints enabled for ECR" : "VPC endpoints disabled"
}

output "cluster_id" {
  description = "EKS cluster ID"
  value       = aws_eks_cluster.eks.id
}

output "cluster_name" {
  description = "EKS cluster name"
  value       = aws_eks_cluster.eks.name
}

output "cluster_arn" {
  description = "EKS cluster ARN"
  value       = aws_eks_cluster.eks.arn
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = aws_eks_cluster.eks.endpoint
}

output "cluster_certificate_authority_data" {
  description = "Base64 encoded certificate data required to communicate with the cluster"
  value       = aws_eks_cluster.eks.certificate_authority[0].data
  sensitive   = true
}

output "node_groups" {
  description = "Map of node group outputs including status and information"
  value       = { for k, v in aws_eks_node_group.ng : k => {
    id         = v.id
    arn        = v.arn
    status     = v.status
    node_group_name = v.node_group_name
    resources  = v.resources
  }}
}

output "node_group_names" {
  description = "List of all node group names"
  value       = [for ng in aws_eks_node_group.ng : ng.node_group_name]
}

output "cluster_iam_role_arn" {
  description = "IAM role ARN for EKS cluster"
  value       = aws_iam_role.eks_cluster_role.arn
}

output "nodegroup_iam_role_arn" {
  description = "IAM role ARN for EKS node groups"
  value       = aws_iam_role.eks_nodegroup_role.arn
}

output "configure_kubectl" {
  description = "Command to configure kubectl with the new cluster"
  value       = "aws eks update-kubeconfig --name ${aws_eks_cluster.eks.name} --region ${var.region}"
}

output "cluster_version" {
  description = "Kubernetes version of the cluster"
  value       = aws_eks_cluster.eks.version
}

output "nodegroup_role_arn" {
  value = aws_iam_role.eks_nodegroup_role.arn
}

output "ebs_csi_status" {
  description = "Status of EBS CSI driver installation"
  value       = var.enable_ebs_csi ? "Enabled" : "Disabled"
}

output "efs_csi_status" {
  description = "Status of EFS CSI driver installation"
  value       = var.enable_efs_csi ? "Enabled" : "Disabled"
}

output "aws_lb_controller_role_arn" {
  description = "ARN of the AWS Load Balancer Controller IAM role"
  value       = aws_iam_role.aws_lb_controller.arn
}
