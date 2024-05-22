output "vpc_id" {
  description = "The ID of the VPC."
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "The public subnets."
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "The private subnets."
  value       = module.vpc.private_subnets
}

output "iam_user_name" {
  description = "The IAM user name."
  value       = module.iam_user.name
}

output "iam_user_arn" {
  description = "The ARN of the IAM user."
  value       = module.iam_user.user_arn
}
