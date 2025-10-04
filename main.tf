locals {
  updated_nats = [
    for nat in var.nats : merge(nat, {
      nat_ips = google_compute_address.nat_ips[*].self_link
    })
  ]
}

resource "google_compute_address" "nat_ips" {
  count  = var.nat_ip_count
  name   = "${var.stage}-nat-ip-${count.index}"
  region = var.cloud_router_region
  project = var.project_id
}


module "main" {
    source  = "git::https://github.com/HarshadRanganathan/terraform-gcp-module-network?ref=1.0"

    project_id                            = var.project_id
    network_name                          = var.network_name
    routing_mode                          = var.routing_mode
    delete_default_internet_gateway_routes = var.delete_default_internet_gateway_routes
    subnets                               = var.subnets
    secondary_ranges                      = var.secondary_ranges
    ingress_rules                         = var.ingress_rules
    egress_rules                          = var.egress_rules
    cloud_router_name                     = var.cloud_router_name
    cloud_router_region                   = var.cloud_router_region
    cloud_router_description              = var.cloud_router_description
    bgp                                   = var.bgp
    nats                                  = local.updated_nats
}