ingress_rules = [
  {
    source_ranges = [
      "35.235.240.0/20"
    ]
    target_tags = ["ssh-access"]
    allow = [{
      protocol = "tcp"
      ports    = ["22"]
    }]
    priority    = 1000
    description = "Allow SSH access from Google's IAP ranges"
    name        = "allow-ssh-from-iap"
  }
]