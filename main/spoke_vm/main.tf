module "spoke" {
    source = "../../modules/spoke"
    resource_group_name = "case00"
    location = var.location
    environment = var.environment
    hub-name = "ABC-LELP-HUB"
}

module "vm" {
    source = "../../modules/vm"
    resource_group_name = "case00"
    location = var.location
    environment = var.environment
    vm-name = "spoke-admin"
    subnet-id = module.spoke.spoke-mgnt-subnet-id
}