output "www_record" {
  value = aws_route53_record.www.name
}
output "zone_id" {
  value = var.zone_id
}
