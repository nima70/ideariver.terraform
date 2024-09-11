provider "aws" {
  region = "us-east-2"

}

locals {
  config = jsondecode(file("${path.module}/terraform.config.json"))
}

module "codeartifact" {
  source                  = "./modules/codeartifact"
  codeartifact_domain     = local.config.codeartifact_domain
  codeartifact_repository = local.config.codeartifact_repository
}

module "ecr" {
  source = "./modules/ecr"

}



module "iam_role" {
  source     = "./modules/iam_role"
  ecr_policy = jsonencode(local.config.ecr_policy)
}

module "security_group" {
  source             = "./modules/security_group"
  allowed_ssh_ips    = local.config.allowed_ssh_ips
  allowed_http_ips   = local.config.allowed_http_ips
  allowed_https_ips  = local.config.allowed_https_ips
  allowed_egress_ips = local.config.allowed_egress_ips

}

module "ec2" {
  source                    = "./modules/ec2"
  security_group_id         = module.security_group.security_group_id
  iam_instance_profile      = module.iam_role.instance_profile_name
  iam_instance_profile_name = module.iam_role.instance_profile_name
  ami                       = local.config.ami_id
  key_name                  = local.config.ec2_key_name
  instance_type             = local.config.ec2_instance_type
  instance_tags             = local.config.ec2_instance_tags
}
module "ebs_volumes" {
  source              = "./modules/ebs_volumes"
  availability_zone   = module.ec2.availability_zone
  instance_id         = module.ec2.instance_id
  volume_device_names = local.config.volume_device_names
  volume_size         = local.config.volume_size
}

module "elastic_ip" {
  source      = "./modules/elastic_ip"
  instance_id = module.ec2.instance_id

}

module "route53" {
  source    = "./modules/route53"
  zone_id   = local.config.route53_zone_id
  public_ip = module.elastic_ip.public_ip
  domain    = local.config.domain
}

module "ses" {
  source           = "./modules/ses"
  region           = local.config.region
  domain           = local.config.domain
  hosted_zone_id   = module.route53.zone_id
  mail_from_domain = local.config.mail_from_domain

}

output "instance_id" {
  value = module.ec2.instance_id

}

output "instance_public_ip" {
  value = module.elastic_ip.public_ip

}

output "domain_name" {
  value = module.codeartifact.domain_name

}

output "repository_name" {
  value = module.codeartifact.repository_name

}
