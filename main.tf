provider "azurerm" {
  features {}
  skip_provider_registration = true
  use_cli = false
  use_msi = false
  use_oidc = false  # Explicitly disable OIDC
  subscription_id = "b276d230-07c3-4d35-9ac8-4f5c89f2c267"
}

resource "azurerm_resource_group" "test" {
  name     = "test-resource-group"
  location = "East US" # Change this to your preferred Azure region
}
