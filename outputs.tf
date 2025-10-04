output "network" {
  description = "The created network"
  value       = module.main.network
}

output "network_id" {
  description = "The ID of the VPC being created"
  value       = module.main.network_id
}

output "network_name" {
  description = "The name of the VPC being created"
  value       = module.main.network_name
}

output "network_self_link" {
  description = "The URI of the VPC being created"
  value       = module.main.network_self_link
}

output "project_id" {
  description = "VPC project id"
  value       = module.main.project_id
}

output "subnets" {
  value       = module.main.subnets
  description = "A map with keys of form subnet_region/subnet_name and values being the outputs of the google_compute_subnetwork resources used to create corresponding subnets."
}

output "subnets_names" {
  value       = [for network in module.main.subnets : network.name]
  description = "The names of the subnets being created"
}


output "subnets_ids" {
  value       = [for network in module.main.subnets : network.id]
  description = "The IDs of the subnets being created"
}

output "subnets_ips" {
  value       = [for network in module.main.subnets : network.ip_cidr_range]
  description = "The IPs and CIDRs of the subnets being created"
}

output "subnets_secondary_ranges" {
  value       = [for network in module.main.subnets : network.secondary_ip_range]
  description = "The secondary ranges associated with these subnets"
}