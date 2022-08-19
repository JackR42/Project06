# main.tf

provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {}
}

resource "azurerm_resource_group" "example" {
  name     = "S2-RG-Project06421433911"
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
  
resource "azurerm_mssql_database" "example" {
  name                = "dba"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  server_id         = azurerm_mssql_server.example.id
}

resource "azurerm_mssql_firewall_rule" "example1" {
  name                = "FirewallRule1"
  resource_group_name = azurerm_resource_group.example.name
  server_id           = azurerm_mssql_server.example.id
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}
resource "azurerm_mssql_firewall_rule" "example2" {
  name                = "FirewallRule2"
  resource_group_name = azurerm_resource_group.example.name
  server_id           = azurerm_mssql_server.example.id
  start_ip_address    = "94.209.108.55"
  end_ip_address      = "94.209.108.55"
}
