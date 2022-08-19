resource "azurerm_resource_group" "example" {
  name     = "S2-RG-Project06"
  location = "West Europe"
}

resource "azurerm_mssql_server" "example" {
  name                         = "sqlproject06421433911"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  version                      = "12.0"
  administrator_login          = "admindba"
  administrator_login_password = "ABCabc123.42"

  tags = {
    env = "dev"
  }
}
