variable "zone_name" {
  type        = string
  description = "Hosted Zone Name"
}

variable "force_destroy" {
  type        = bool
  description = "Optional: Allows deleting the zone even if it has records"
  default     = false
}

variable "vpc_id" {
  type        = list(string)
  description = "Optional: VPC ID for the DNS zone"
  default     = []
}

variable "private" {
  type        = bool
  description = "Optional: DNS zone is private or not (public)"
  default     = false
}