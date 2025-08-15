# terraform-modules-hostted-zone

This Terraform module creates and manages AWS Route 53 Hosted Zones. It supports both public and private hosted zones.

*   **Public Hosted Zones:** Created when the `private` variable is set to `false` (default).
*   **Private Hosted Zones:** Created when the `private` variable is set to `true`. These zones can be associated with one or more VPCs by providing their IDs.

The module provides outputs for the hosted zone name, ID, name servers, associated VPC ID (if private), and a flag indicating if the zone is internal.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53_zone.hosted-zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |
| [aws_route53_zone.hosted-zone-internal](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | Optional: Allows deleting the zone even if it has records | `bool` | `false` | no |
| <a name="input_private"></a> [private](#input\_private) | Optional: DNS zone is private or not (public) | `bool` | `false` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | Optional: VPC ID for the DNS zone | `list(string)` | `[]` | no |
| <a name="input_zone_name"></a> [zone\_name](#input\_zone\_name) | Hosted Zone Name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_associated_vpc_id"></a> [associated\_vpc\_id](#output\_associated\_vpc\_id) | Associated VPC ID, when internal DNS is used |
| <a name="output_internal"></a> [internal](#output\_internal) | Variable indicating if the zone is internal or not |
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | Hosted Zone ID |
| <a name="output_zone_name"></a> [zone\_name](#output\_zone\_name) | Hosted Zone Name |
| <a name="output_zone_name_servers"></a> [zone\_name\_servers](#output\_zone\_name\_servers) | Hosted Zone Name Servers, usefull for DNS delegation |
<!-- END_TF_DOCS -->