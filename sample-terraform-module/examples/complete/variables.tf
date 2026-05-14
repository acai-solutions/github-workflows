# ---------------------------------------------------------------------------------------------------------------------
# ¦ VARIABLES
# ---------------------------------------------------------------------------------------------------------------------
# Values for these variables come from <TEST_BED>_TESTBED_TFVARS, written
# to <terratest_path>/testbed.tfvar by the workflow and applied to all
# plan / apply / destroy invocations via TF_CLI_ARGS_*.

variable "account_ids" {
  type = object({
    org_mgmt      = string
    core_logging  = string
    core_security = string
    core_backup   = string
    workload      = string
  })
  description = "Account IDs of the ACAI core accounts."
}

variable "aws_region" {
  type        = string
  description = "AWS region used by all providers."
  default     = "eu-central-1"
}

variable "aws_partition" {
  type        = string
  description = "AWS partition (aws, aws-cn, aws-us-gov)."
  default     = "aws"
}

variable "iam_role_name" {
  type        = string
  description = "IAM role assumed in each member account."
  default     = "OrganizationAccountAccessRole"
}

variable "environment" {
  type        = string
  description = "Environment label injected into resource names."
  default     = "test"
}
