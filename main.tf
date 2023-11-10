resource "fortios_firewall_address" "app_address" {
  vdomparam               = var.vdomparam
  name                    = var.address_name
  associated_interface    = var.associated_interface
  subnet                  = "${var.instance_ip}/32"
  type                    = "subnet"
  visibility              = "enable"
}

resource "fortios_firewall_policy" "app_policy" {
  vdomparam           = var.vdomparam
  action              = "accept"
  inspection_mode     = "flow"
  logtraffic          = "all"
  name                = var.policy_name
  schedule            = "always"
  ssl_ssh_profile     = "no-inspection"
  status              = "enable"
  utm_status          = "enable"
  nat                 = "disable"
  
  dstintf {
      name = var.interface_name
  }

  service {
    name = "ALL"
  }

  dstaddr {
      name = fortios_firewall_address.app_address.name
  }

  srcaddr {
      name = "all"
  }

  srcintf {
      name = var.interface_name
  }
}
