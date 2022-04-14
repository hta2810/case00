#Virtual Network
resource "azurerm_virtual_network" "hub-vnet" {
  name                      = "${var.hub-name}"
  location                  = var.location
  resource_group_name       = var.resource_group_name
  address_space             = [var.hub-vnet-add]
  # address_space             = ["${var.address_space["address"]}/${var.address_space["prefix"]}"]

  tags = {
      environment = var.environment
  }
}

#Subnet
# resource "azurerm_subnet" "hub-gateway-subnet" {
#     name                    = "${var.hub-name}-dmz-subnet"
#     resource_group_name     = azurerm_virtual_network.hub-vnet.resource_group_name
#     virtual_network_name    = azurerm_virtual_network.hub-vnet.name
#     address_prefixes        = [""]
# }

resource "azurerm_subnet" "hub-mgnt-subnet" {
    name                    = "${var.hub-name}-mgnt-subnet"
    resource_group_name     = azurerm_virtual_network.hub-vnet.resource_group_name
    virtual_network_name    = azurerm_virtual_network.hub-vnet.name
    address_prefixes        = var.hub-mgnt-subnet-add
}

# resource "azurerm_subnet" "hub-dmz" {
#     name                    = "${var.hub-name}-dmz-subnet"
#     resource_group_name     = azurerm_virtual_network.hub-vnet.resource_group_name
#     virtual_network_name    = azurerm_virtual_network.hub-vnet.name
#     address_prefixes        = [""]
# }

#Virtual Network Gateway

# resource "azurerm_public_ip" "hub-vpn-gateway-pip" {
#     name                    = "${var.hub-name}-vpn-gateway-pip"
#     location                = azurerm_virtual_network.hub-vnet.location
#     resource_group_name     = azurerm_virtual_network.hub-vnet.resource_group_name

#     allocation_method       = "Dynamic"
# }

# resource "" "name" {
  
# }



