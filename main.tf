provider "azurerm" {
  features = {}
}

resource "azurerm_resource_group" "test" {
  name     = "test-resource-group"
  location = "East US" # Change to your preferred Azure region
}



