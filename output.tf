output "zone_name" {
  value       = local.hosted_zone_name
  description = "Hosted Zone Name"
}

output "zone_id" {
  value       = local.hosted_zone_id
  description = "Hosted Zone ID"
}

output "zone_name_servers" {
  value       = local.hosted_zone_name_servers
  description = "Hosted Zone Name Servers, usefull for DNS delegation"
}

output "associated_vpc_id" {
  value       = var.vpc_id
  description = "Associated VPC ID, when internal DNS is used"
}

output "internal" {
  value       = var.private
  description = "Variable indicating if the zone is internal or not"
}