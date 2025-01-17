output "load_balancer_public_ip" {
  description = "The public IP of the Load Balancer"
  value       = module.lb.load_balancer_public_ip
}

output "load_balancer_domain_name" {
  description = "The domain name of the Load Balancer"
  value       = module.lb.load_balancer_domain_name
}