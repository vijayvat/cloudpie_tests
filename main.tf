provider "azurerm" {
  features {}
  subscription_id = "b276d230-07c3-4d35-9ac8-4f5c89f2c267"
}

resource "azurerm_resource_group" "test" {
  name     = "test-resource-group"
  location = "East US" # Change this to your preferred Azure region
}
