# ---------------------------------------------------------------------------------------------------------------------
# ¦ VERSIONS
# ---------------------------------------------------------------------------------------------------------------------
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = ">= 6.0"
      configuration_aliases = [aws.org_mgmt, aws.workload]
    }
  }
}


# ---------------------------------------------------------------------------------------------------------------------
# ¦ DATA
# ---------------------------------------------------------------------------------------------------------------------
data "aws_caller_identity" "org_mgmt" {
  provider = aws.org_mgmt
}

data "aws_caller_identity" "workload" {
  provider = aws.workload
}


# ---------------------------------------------------------------------------------------------------------------------
# ¦ RESOURCES
# ---------------------------------------------------------------------------------------------------------------------
# Minimal, side-effect-free demo resource so `terraform apply` succeeds in
# the example without provisioning real infrastructure. Replace with the
# actual resources of your module.
resource "aws_ssm_parameter" "sample" {
  provider = aws.workload

  name  = var.parameter_name
  type  = "String"
  value = jsonencode({
    org_mgmt_account_id = data.aws_caller_identity.org_mgmt.account_id
    workload_account_id = data.aws_caller_identity.workload.account_id
    sample_input        = var.sample_input
  })

  tags = var.tags
}
