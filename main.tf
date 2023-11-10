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
  action              = var.action
  inspection_mode     = "flow"
  logtraffic          = var.logtraffic
  name                = var.policy_name
  schedule            = "always"
  ssl_ssh_profile     = var.ssl_ssh_profile
  status              = "enable"
  utm_status          = "enable"
  nat                 = var.nat 
  
  dstintf {
      name = var.interface_name
  }

  dynamic "service" {
    for_each = var.services
    content {
      name = service.value
    }
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
