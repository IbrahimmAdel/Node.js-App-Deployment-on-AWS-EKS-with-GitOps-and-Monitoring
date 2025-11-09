resource "aws_eks_addon" "vpc_cni" {
  cluster_name = aws_eks_cluster.eks.name
  addon_name   = "vpc-cni"
  tags = var.tags
}

resource "aws_eks_addon" "ebs_csi_driver" {
  count = var.enable_ebs_csi ? 1 : 0

  cluster_name = aws_eks_cluster.eks.name
  addon_name   = "aws-ebs-csi-driver"
 
  service_account_role_arn = aws_iam_role.ebs_csi_driver[0].arn

  tags = var.tags
  
  depends_on = [
    aws_eks_node_group.ng,
    aws_iam_role.ebs_csi_driver[0]
  ]
}

resource "aws_eks_addon" "efs_csi_driver" {
  count = var.enable_efs_csi ? 1 : 0

  cluster_name = aws_eks_cluster.eks.name
  addon_name   = "aws-efs-csi-driver"
  
  tags = var.tags
  
  depends_on = [
    aws_eks_node_group.ng,
    aws_iam_role_policy_attachment.efs_csi_policy
  ]
}

resource "aws_eks_addon" "kube_proxy" {
  cluster_name = aws_eks_cluster.eks.name
  addon_name   = "kube-proxy"
  tags = var.tags
}

resource "aws_eks_addon" "coredns" {
  cluster_name = aws_eks_cluster.eks.name
  addon_name   = "coredns"
  tags = var.tags
}

resource "aws_eks_addon" "metrics_server" {
  cluster_name = aws_eks_cluster.eks.name
  addon_name   = "metrics-server"
  tags = var.tags
}

