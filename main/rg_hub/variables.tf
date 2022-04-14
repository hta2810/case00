variable "subscriptionid" {
    type = string
    description = "Subscription ID"
    default = "6b7be168-390d-4660-b734-bbbb7d03690a"
}
variable "location" {
    type = string
    default = "koreacentral"
}
variable "resource_group_name" {
    type = string
    default = "case00"
}
variable "environment" {
    type = string
    default = "hub"
}