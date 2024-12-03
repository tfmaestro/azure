environment = "prod"
firewall_rules = {
  "allow-vpn" = {
    start_ip_address = "<TWÓJ_IP>"
    end_ip_address   = "<TWÓJ_IP>"
  }
  "allow-server-public" = {
    start_ip_address = "<PUBLICZNE_IP_VM>"
    end_ip_address   = "<PUBLICZNE_IP_VM>"
  }
  "allow-server-private" = {
    start_ip_address = "<PRYWATNE_IP_VM>"
    end_ip_address   = "<PRYWATNE_IP_VM>"
  }
}