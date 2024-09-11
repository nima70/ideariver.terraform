# Variable for allowed SSH CIDR blocks
variable "allowed_ssh_ips" {
  description = "List of CIDR blocks allowed to access SSH (port 22)"
  type        = list(string)
}

# Variable for allowed HTTP CIDR blocks
variable "allowed_http_ips" {
  description = "List of CIDR blocks allowed to access HTTP (port 80)"
  type        = list(string)
}

# Variable for allowed HTTPS CIDR blocks
variable "allowed_https_ips" {
  description = "List of CIDR blocks allowed to access HTTPS (port 443)"
  type        = list(string)
  
}

# Variable for allowed Egress CIDR blocks
variable "allowed_egress_ips" {
  description = "List of CIDR blocks allowed for outbound traffic (egress)"
  type        = list(string)
}

# Variable for the security group name prefix
variable "security_group_name_prefix" {
  description = "Prefix for the security group name"
  type        = string
  default     = "allow_ssh_and_http_"
}
