output "ses_domain_identity_arn" {
  value = aws_ses_domain_identity.ideariver.arn
}

output "ses_dkim_tokens" {
  value = aws_ses_domain_dkim.ideariver.dkim_tokens
}
