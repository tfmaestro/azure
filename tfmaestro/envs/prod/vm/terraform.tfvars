location                = "westus"
environment             = "prod"
resource_group_location = "westus"
network_name            = "prod-vnet"
vm_config = {
  "tfmaestro-web-app-01" = {
    private_ip          = "10.0.9.2"
    public_ip_name      = "tfmaestro-web-app-01 public IP"
    machine_type        = "Standard_DS1_v2"
    machine_description = "Internal web application instance"
  }
  "tfmaestro-web-app-02" = {
    private_ip          = "10.0.9.3"
    public_ip_name      = "tfmaestro-web-app-02 public IP"
    machine_type        = "Standard_DS1_v2"
    machine_description = "Internal web application instance"
  }
}
