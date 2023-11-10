variable "vdomparam" {
  description = "VDOM Parameter"
  type        = string
}

variable "address_name" {
  description = "Name for the firewall address"
  type        = string
}

variable "associated_interface" {
  description = "Associated Interface"
  type        = string
}

variable "instance_ip" {
  description = "Private IP of the instance"
  type        = string
}

variable "policy_name" {
  description = "Name for the firewall policy"
  type        = string
}

variable "interface_name" {
  description = "Name of the interface"
  type        = string
}
