variable "resource_group_name" {
    type = string
}
variable "location" {
    type = string  
}
variable "environment" {
    type = string
}
variable "hub-name" {
    type = string
}
# variable "address_space" {
#     type = map(string)
#     default = {
#         "address" = "10.0.0.0"
#         "prefix" = "16"
#     }
# }

variable "hub-vnet-add" {
    type = string
}
variable "hub-mgnt-subnet-add" {
    type = string
}