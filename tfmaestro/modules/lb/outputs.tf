output "load_balancer_public_ip" {
  description = "The public IP of the Load Balancer"
  value       = azurerm_public_ip.prod_lb_public_ip.ip_address
}

output "load_balancer_domain_name" {
  description = "The domain name of the Load Balancer"
  value       = azurerm_public_ip.prod_lb_public_ip.fqdn
}
