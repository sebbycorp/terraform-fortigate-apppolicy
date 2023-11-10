output "firewall_address_name" {
  value = fortios_firewall_address.app_address.name
}

output "firewall_policy_name" {
  value = fortios_firewall_policy.app_policy.name
}
