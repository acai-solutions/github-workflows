# ---------------------------------------------------------------------------------------------------------------------
# ¦ VERSIONS
# ---------------------------------------------------------------------------------------------------------------------
# `required_providers` drives the .terraform.lock.hcl that the workflow
# generates from the matrix entry's `provider_version` map.
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0"
    }
  }
}


# ---------------------------------------------------------------------------------------------------------------------
# ¦ MODULE UNDER TEST
# ---------------------------------------------------------------------------------------------------------------------
module "example_complete" {
  source = "../../"

  parameter_name = "/acai/sample-terraform-module/${var.environment}/demo"
  sample_input   = "hello-from-${var.environment}"
  tags = {
    Environment = var.environment
    ManagedBy   = "terratest"
  }

  providers = {
    aws.org_mgmt = aws.org_mgmt
    aws.workload = aws.workload
  }
}
