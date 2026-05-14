# ---------------------------------------------------------------------------------------------------------------------
# ¦ BACKEND
# ---------------------------------------------------------------------------------------------------------------------
# Partial S3 backend. Concrete values (bucket / region / dynamodb_table)
# are injected at runtime via -backend-config from <terratest_path>/backend.json,
# which is written by the workflow from the <TEST_BED>_TESTBED_BACKEND_JSON
# repository variable. The per-test state `key` is set in Go via
# loadBackendConfig(t, stateKey).
terraform {
  backend "s3" {}
}
