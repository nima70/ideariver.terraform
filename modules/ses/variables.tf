variable "region" {
  description = "The AWS region to deploy resources"
}

variable "domain" {
  description = "The domain to verify with SES"
}

variable "hosted_zone_id" {
  description = "The Route 53 Hosted Zone ID for the domain"
}

variable "mail_from_domain" {
  description = "The subdomain to use as the MAIL FROM domain"
}
