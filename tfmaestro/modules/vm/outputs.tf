output "private_ips" {
  description = "The private IP addresses of the created virtual machines"
  value       = { for vm in azurerm_linux_virtual_machine.vm : vm.name => vm.private_ip_address }
}

output "public_ips" {
  description = "The public IP addresses of the created virtual machines"
  value       = { for vm in azurerm_linux_virtual_machine.vm : vm.name => azurerm_public_ip.public_ip[vm.name].ip_address }
}