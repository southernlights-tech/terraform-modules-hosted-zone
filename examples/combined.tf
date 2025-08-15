
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

module "private_hosted_zone_combined" {
  source = "../" # Path to the root module

  zone_name   = "combined.private.example.com"
  private     = true
  vpc_id      = ["vpc-0abcdef1234567890"] # Replace with your actual VPC ID
  force_destroy = true
}

module "public_hosted_zone_combined" {
  source = "../" # Path to the root module

  zone_name   = "combined.public.example.com"
  private     = false
  force_destroy = true
}

output "combined_private_zone_id" {
  value = module.private_hosted_zone_combined.zone_id
}

output "combined_private_zone_name" {
  value = module.private_hosted_zone_combined.zone_name
}

output "combined_public_zone_id" {
  value = module.public_hosted_zone_combined.zone_id
}

output "combined_public_zone_name" {
  value = module.public_hosted_zone_combined.zone_name
}

output "combined_public_zone_name_servers" {
  value = module.public_hosted_zone_combined.zone_name_servers
}
