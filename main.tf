provider "azurerm"{
    features {}
}

resource "azurerm_resource_group" "resource_group" {
    name = "terraform-weatherapplication"
    location = "eastus"
}

resource "azurerm_storage_account "storage_account" {
    name = "storageforweatherapplication"
    resource_group_name = azurerm_resource_group.resource_group.name
    location = "azurerm_resource_group.resource_group.location

    account_tier = "Standard"
    account_replication_type = "LRS"
    account_kind = "StorageV2"
    enable_https_traffic_only = true
    allow_blob_public_access = true

    static_website {
        index_document = "index.cshtml"
    }
}

resource "azurerm_storage_blob" "initial" {
    name = "index.cshtml"
    storage_account_name = "azurerm_storage_account.storage_account.name
    storage_container_name = "$web"
    type = "Block"
    content_type = "text/html"

}