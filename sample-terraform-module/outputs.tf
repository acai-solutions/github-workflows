# ---------------------------------------------------------------------------------------------------------------------
# ¦ OUTPUTS
# ---------------------------------------------------------------------------------------------------------------------
output "parameter_arn" {
  description = "ARN of the SSM Parameter created by this module."
  value       = aws_ssm_parameter.sample.arn
}

output "parameter_name" {
  description = "Name of the SSM Parameter created by this module."
  value       = aws_ssm_parameter.sample.name
}

output "workload_account_id" {
  description = "Account ID detected via the aws.workload provider."
  value       = data.aws_caller_identity.workload.account_id
}
