provider "azurerm" {
  features {}
  skip_provider_registration = true
  use_cli = false
  use_msi = false
  use_oidc = false  # Explicitly disable OIDC
}

resource "azurerm_resource_group" "test" {
  name     = "test-resource-group"
  location = "East US" # Change this to your preferred Azure region
}
