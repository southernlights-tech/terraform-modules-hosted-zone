
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1" # Or your desired region
}

module "public_hosted_zone" {
  source = "../" # Path to the root module

  zone_name   = "public.example.com"
  private     = false # Default value, can be omitted
  force_destroy = true
}

output "public_zone_id" {
  value = module.public_hosted_zone.zone_id
}

output "public_zone_name" {
  value = module.public_hosted_zone.zone_name
}

output "public_zone_name_servers" {
  value = module.public_hosted_zone.zone_name_servers
}
