package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

// TestExampleComplete is the default ACAI Terratest entry point.
//
// It deploys examples/complete using the HCL engine selected by the
// TERRATEST_TERRAFORM_BINARY env var (terraform or tofu), with the
// backend configuration injected via backend.json and the test-bed
// tfvars injected via TF_CLI_ARGS_* by the GitHub workflow.
func TestExampleComplete(t *testing.T) {
	t.Log("Starting ACAI module Terratest")

	terraformDir := "../../examples/complete"
	stateKey := "terratest/example-complete.tfstate"
	backendConfig := loadBackendConfig(t, stateKey)

	terraformOptions := &terraform.Options{
		TerraformBinary: getHclBinary(),
		TerraformDir:    terraformDir,
		NoColor:         false,
		Lock:            true,
		BackendConfig:   backendConfig,
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	// The example is expected to expose an output named "test_success"
	// that evaluates to the string "true" when the deployment is healthy.
	testSuccessOutput := outputClean(t, terraformOptions, "test_success")
	t.Logf("test_success: %s", testSuccessOutput)

	assert.Equal(t, "true", testSuccessOutput, "The test_success output is not true")
}
