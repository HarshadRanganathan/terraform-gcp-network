network_name = "dev-vpc"
stage = "dev" 
project_id = ""

subnets = [
  {
    subnet_name               = "private-us-central1-dev-vpc-subnet-1"
    subnet_ip                 = "10.0.128.0/23"
    subnet_region             = "us-central1"
    subnet_private_access     = true
    subnet_flow_logs          = true
    subnet_flow_logs_interval = "INTERVAL_10_MIN"
    subnet_flow_logs_sampling = 0.2
    subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
    subnet_flow_logs_filter   = "true"
    description               = "Private Subnet"
  },
  {
    subnet_name               = "public-us-central1-dev-vpc-subnet-1"
    subnet_ip                 = "10.0.1.0/24"
    subnet_region             = "us-central1"
    subnet_flow_logs          = true
    subnet_flow_logs_interval = "INTERVAL_10_MIN"
    subnet_flow_logs_sampling = 0.7
    subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
    subnet_flow_logs_filter   = "true"
    description               = "Public Subnet"
  },
  {
    subnet_name               = "gke-nodes-us-central1-dev-vpc-subnet-1"
    subnet_ip                 = "10.0.4.0/22"
    subnet_region             = "us-central1"
    subnet_private_access     = true
    subnet_flow_logs          = true
    subnet_flow_logs_interval = "INTERVAL_10_MIN"
    subnet_flow_logs_sampling = 0.2
    subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
    subnet_flow_logs_filter   = "true"
    description               = "GKE Nodes Subnet"
  }
]

secondary_ranges = {
  "gke-nodes-us-central1-dev-vpc-subnet-1" = [
    {
      range_name    = "gke-services"
      ip_cidr_range = "10.0.20.0/22"
    },
    {
      range_name    = "gke-pods"
      ip_cidr_range = "10.0.32.0/20"
    }
  ]
}

cloud_router_name = "dev-cloud-router"
cloud_router_region = "us-central1"
cloud_router_description = "Cloud Router for dev-vpc"
bgp = {
  asn = 64512
  advertised_groups = ["ALL_SUBNETS"]
}

nats = [
  {
    name = "dev-nat-gw-1"
  }
]