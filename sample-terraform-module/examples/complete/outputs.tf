# ---------------------------------------------------------------------------------------------------------------------
# ¦ ASSERTION OUTPUTS
# ---------------------------------------------------------------------------------------------------------------------
# Express test assertions as boolean Terraform outputs. The Go test reads
# them through outputClean(...) and asserts equality with the string "true".
# Use `test_success` for a single assertion or `test_success1`,
# `test_success2`, ... for multiple.

output "test_success" {
  description = "Single overall pass/fail signal for the example."
  value       = module.example_complete.parameter_arn != null && module.example_complete.workload_account_id != ""
}

output "test_success1" {
  description = "Check that the SSM parameter name carries the expected prefix."
  value       = startswith(module.example_complete.parameter_name, "/acai/sample-terraform-module/")
}
