resource "aws_route53_zone" "hosted-zone" {
  count = var.private == false ? 1 : 0

  name = var.zone_name

  force_destroy = var.force_destroy
}

resource "aws_route53_zone" "hosted-zone-internal" {
  count = var.private == true ? 1 : 0

  name = var.zone_name

  dynamic "vpc" {
    for_each = var.vpc_id
    content {
      vpc_id = vpc.value
    }
  }


  force_destroy = var.force_destroy
}

locals {
  hosted_zone_name = var.private == true ? aws_route53_zone.hosted-zone-internal[0].name : aws_route53_zone.hosted-zone[0].name

  hosted_zone_id = var.private == true ? aws_route53_zone.hosted-zone-internal[0].id : aws_route53_zone.hosted-zone[0].id

  hosted_zone_name_servers = var.private == true ? aws_route53_zone.hosted-zone-internal[0].name_servers : aws_route53_zone.hosted-zone[0].name_servers
}