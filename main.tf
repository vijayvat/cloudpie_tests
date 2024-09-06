# main.tf

# Terraform block specifying the required providers (none needed here)
terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "3.1.0"
    }
  }
}

# Create a simple null resource
resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "echo 'Hello from Terraform!'"
  }
}

# Output to display after the resource is created
output "test_output" {
  value = "Terraform null resource executed successfully!"
}
