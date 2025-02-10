output "cluster_id" {
  description = "Findout Eks cluster ID"
  value = module.eks.cluster_id
}

output "cluster_endpoint" {
  description = "Endpoint for eks Cluster"
  value = module.eks.cluster_endpoint
}
output "cluster_security_group_id" {
  description = "Security group id for EKS cluster"
  value = module.eks.cluster_security_group_id
}
output "region" {
  description = "Region where eks deploy"
  value = var.aws_region
}
output "oidc_provider_arn" {
  description = "OIDC provider"
  value = module.eks.oidc_provider_arn
}