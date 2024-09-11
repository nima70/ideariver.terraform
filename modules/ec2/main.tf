
resource "aws_instance" "ec2" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [var.security_group_id]
  iam_instance_profile   = var.iam_instance_profile_name

  metadata_options {
    http_tokens = "required"
  }
  tags = var.instance_tags

  root_block_device {
    volume_size = 15 # Size in GB
  }
}

