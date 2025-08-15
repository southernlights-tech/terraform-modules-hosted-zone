
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

module "private_hosted_zone" {
  source = "../" # Path to the root module

  zone_name   = "private.example.com"
  private     = true
  vpc_id      = ["vpc-0abcdef1234567890"] # Replace with your actual VPC ID
  force_destroy = true
}

output "private_zone_id" {
  value = module.private_hosted_zone.zone_id
}

output "private_zone_name" {
  value = module.private_hosted_zone.zone_name
}
