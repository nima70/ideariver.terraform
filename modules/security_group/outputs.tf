
output "security_group_id" {
  value = aws_security_group.allow_ssh_and_http.id
}
