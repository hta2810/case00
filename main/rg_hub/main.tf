module "rg" {
    source = "../../modules/rg"
    resource_group_name = var.resource_group_name
    location = var.location
}

module "hub" {
    source = "../../modules/hub"
    resource_group_name = var.resource_group_name
    location = var.location
    environment = var.environment
    hub-name = "ABC-LELP-HUB"
    hub-vnet-add = "10.0.0.0/16"
    hub-mgnt-subnet-add = "10.0.0.64/27"
}