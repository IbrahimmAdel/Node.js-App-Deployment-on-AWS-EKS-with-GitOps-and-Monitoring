output "list_clusters" {
  description = "Command to list EKS clusters and verify creation"
  value       = "aws eks list-clusters --region ${var.region}"
}

output "connect_to_cluster" {
  description = "Command to Connect to cluster by setting kubeconfig file"
  value       = "aws eks update-kubeconfig --name ${var.cluster_name} --region ${var.region}"
}

output "ecr_repository_url" {
  description = "Full ECR repository URI"
  value       = "aws_ecr_repository.ecr.repository_url"
}

output "ecr_login_command" {
  description = "AWS CLI command to login to ECR"
  value       = "aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${aws_ecr_repository.ecr.repository_url}"
}

output "build_docker_image_command" {
  description = "Commands to build a Docker image"
  value = "docker build -t ${aws_ecr_repository.ecr.repository_url}:latest ."
}

output "push_docker_image_command" {
  description = "Commands to build and push a Docker image to ECR"
  value = "docker push ${aws_ecr_repository.ecr.repository_url}:latest"
}

output "create_ecr_kubernetes_secret_command" {
  description = "Command to create Kubernetes secret for ECR access"
  value       = "kubectl create secret docker-registry ecr-registry --docker-server=${aws_ecr_repository.ecr.repository_url} --docker-username=AWS --docker-password=$(aws ecr get-login-password --region ${var.region})"
}
