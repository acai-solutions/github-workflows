# ---------------------------------------------------------------------------------------------------------------------
# ¦ VARIABLES
# ---------------------------------------------------------------------------------------------------------------------
variable "parameter_name" {
  type        = string
  description = "Name of the SSM Parameter created in the workload account."
  default     = "/acai/sample-terraform-module/demo"
}

variable "sample_input" {
  type        = string
  description = "Arbitrary string echoed into the SSM Parameter value."
  default     = "hello-acai"
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to all resources created by this module."
  default     = {}
}
