data "azurerm_virtual_network" "hub-vnet" {
    name = var.hub-name
    resource_group_name = var.resource_group_name
}
# data "azurem_virtual_network_gateway" "hub-vnet-gateway" {
#     name = var.hub-vnet-gateway-name
#     resource_group_name = var.resource_group_name
# }

resource "azurerm_virtual_network" "spoke-vnet" {
  name                      = "${var.spoke-name}"
  location                  = var.location
  resource_group_name       = var.resource_group_name
  address_space             = ["${var.address-space}"]
#   address_space             = ["${var.address_space["address"]}/${var.address_space["prefix"]}"]

  tags = {
      environment = var.environment
  }
}
resource "azurerm_subnet" "spoke-mgmt-subnet" {
    name                 = "${var.spoke-name}-mgmt"
    resource_group_name  = azurerm_resource_group.spoke1-vnet-rg.name
    virtual_network_name = azurerm_virtual_network.spoke1-vnet.name
    address_prefixes        = ["var.spoke-mgmt-subnet-add-prefixes"]
    # address_prefixes     = ["10.1.0.64/27"]
}

resource "azurerm_virtual_network_peering" "spoke1-hub-peer" {
    name                      = "spoke${var.count}-hub-peer"
    resource_group_name       = var.resource_group_name
    virtual_network_name      = azurerm_virtual_network.spoke-vnet.name
    remote_virtual_network_id = data.azurerm_virtual_network.hub-vnet.id

    allow_virtual_network_access = true
    allow_forwarded_traffic = true
    allow_gateway_transit   = false
    use_remote_gateways     = true
    # depends_on = [azurerm_virtual_network.spoke1-vnet, data.azurerm_virtual_network.hub-vnet , data.azurerm_virtual_network_gateway.hub-vnet-gateway]
}

resource "azurerm_virtual_network_peering" "hub-spoke1-peer" {
    name                      = "hub-spoke${var.count}-peer"
    resource_group_name       = azurerm_resource_group.hub-vnet-rg.name
    virtual_network_name      = azurerm_virtual_network.hub-vnet.name
    remote_virtual_network_id = azurerm_virtual_network.spoke1-vnet.id
    allow_virtual_network_access = true
    allow_forwarded_traffic   = true
    allow_gateway_transit     = true
    use_remote_gateways       = false
    # depends_on = [azurerm_virtual_network.spoke1-vnet, data.azurerm_virtual_network.hub-vnet, data.azurerm_virtual_network_gateway.hub-vnet-gateway]
}

