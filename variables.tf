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

variable "nat" {
  description = "value for nat"
  type = string
  default = "disable"
}

variable "ssl_ssh_profile" {  
  description = "value for ssl_ssh_profile"
  type = string
  default = "certificate-inspection"
}

variable "services" {
  description = "List of service names"
  type        = list(string)
  default     = ["ALL"]  # Default value, can be overridden
}

variable "logtraffic" {
  description = "value for logtraffic"
  type = string
}

variable "action" {
  description = "value for action"
  type = string
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
