name          = "prod"
location      = "westus"
environment   = "prod"
address_space = ["10.0.0.0/16"]
private_subnets = {
  "prod-private-subnet-01" = {
    address_prefix = "10.0.9.0/24"
  }
  "prod-private-subnet-02" = {
    address_prefix = "10.0.10.0/24"
  }
}

public_subnets = {
  "prod-public-subnet-01" = {
    address_prefix = "10.0.11.0/24"
  }
  "prod-public-subnet-02" = {
    address_prefix = "10.0.12.0/24"
  }
}

public_database_subnets = {
  "prod-database-public-subnet-01" = {
    address_prefix = "10.0.13.0/24"
  }
}
