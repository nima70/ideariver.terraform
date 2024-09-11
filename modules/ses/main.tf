provider "aws" {
  region = var.region
}

resource "aws_ses_domain_identity" "ideariver" {
  domain = var.domain
}

resource "aws_ses_domain_dkim" "ideariver" {
  domain = aws_ses_domain_identity.ideariver.domain
}

resource "aws_ses_domain_mail_from" "ideariver" {
  domain                 = aws_ses_domain_identity.ideariver.domain
  mail_from_domain       = var.mail_from_domain
  behavior_on_mx_failure = "UseDefaultValue"
}

resource "aws_route53_record" "ses_verification_record" {
  zone_id = var.hosted_zone_id
  name    = aws_ses_domain_identity.ideariver.domain
  type    = "TXT"
  ttl     = "600"
  records = [aws_ses_domain_identity.ideariver.verification_token]
}


locals {
  dkim_tokens_map = { for idx, token in aws_ses_domain_dkim.ideariver.dkim_tokens : idx => token }
}

# Create Route 53 CNAME records for SES DKIM
resource "aws_route53_record" "ses_dkim_record" {
  for_each = local.dkim_tokens_map
  zone_id  = var.hosted_zone_id
  name     = "${each.value}._domainkey.${var.domain}"
  type     = "CNAME"
  ttl      = "600"
  records  = ["${each.value}.dkim.amazonses.com"]
}
# Verify Email Address
resource "aws_ses_email_identity" "noreply" {
  email = "noreply@${var.domain}"
}
