variable azurerm_subscription_id {
  type = string
}

variable azurerm_client_id {
  type = string
}
variable azurerm_client_secret {
  type    = string
}
variable azurerm_tenant_id {
  type    = string
}

terraform {
  backend "azurerm" {
    resource_group_name  = "devopsart-non-prod"
    storage_account_name = "tfdevopsart"
    container_name       = "tfstateone"
    key                  = "dev.terraform.tfstate"
    access_key           = "XXXXXXXXXXX"
  }
}

provider "azurerm" {
    subscription_id =  var.azurerm_subscription_id
    client_id       =  var.azurerm_client_id
    client_secret   =  var.azurerm_client_secret
    tenant_id       =  var.azurerm_tenant_id
    features {}
}
resource "azurerm_storage_account" "storageaccount" {
  name                     = "devopsartstrgtest"
  resource_group_name      = "devopsart-non-prod"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
