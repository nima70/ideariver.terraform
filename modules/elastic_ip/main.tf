resource "aws_eip" "elastic_ip" {
  instance = var.instance_id
}
