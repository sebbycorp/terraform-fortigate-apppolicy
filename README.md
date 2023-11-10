# Terraform Secure App Policy for Fortigate using GWLB

To create a reusable Terraform module for your application teams, you'll want to encapsulate the common infrastructure elements in a way that allows for flexibility and ease of use. The module should accept input variables so that each team can customize aspects like names, interfaces, and IP addresses as needed.

Let's structure the module as follows:

Module Directory Structure: This includes all the necessary files for the module.
Module Input Variables: These allow users to pass in specific values to the module.
Module Resources: The resources that will be created by the module.
Module Outputs: Outputs that can be used by other Terraform configurations.


Usage Example
Application teams can use this module in their own Terraform configurations like so:

```
module "fortios_firewall_config" {
  source                = "./modules/fortios_firewall"
  vdomparam             = "FG-traffic"
  address_name          = "app_team_address"
  action                = "accept"
  associated_interface  = "awsgeneve"
  instance_ip           = aws_instance.app_team_instance.private_ip
  policy_name           = "app_team_policy"
  interface_name        = "awsgeneve"
  services              = ["HTTPS", "SSH"] #default is all
  nat                   = "disable" # default is disable
  logtraffic            = "all" # all disabled or no
  ssl_ssh_profile       = "no-inspection" # default certificate-inspection
}

resource "aws_instance" "app_team_instance" {
  # AWS instance configuration
}

```

In this example, the module is referenced locally. You might want to host your module in a Git repository or a Terraform module registry for easier sharing and versioning.

Note: Ensure that your module and its usage comply with your organizational standards and practices. The provided example is a starting point and might need adjustments based on your specific requirements and the capabilities of the FortiOS Terraform provider.