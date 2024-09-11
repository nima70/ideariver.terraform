resource "aws_ebs_volume" "financial_postgres_data" {
  availability_zone = var.availability_zone
  size              = var.volume_size["financial_postgres_data"]
  type              = "gp2"
  tags = {
    Name = "financial_postgres_data"
  }
}

resource "aws_ebs_volume" "keycloak_postgres_data" {
  availability_zone = var.availability_zone
  size              = var.volume_size["keycloak_postgres_data"]
  type              = "gp2"
  tags = {
    Name = "keycloak_postgres_data"
  }
}

resource "aws_ebs_volume" "influxdb_data" {
  availability_zone = var.availability_zone
  size              = var.volume_size["influxdb_data"]
  type              = "gp2"
  tags = {
    Name = "influxdb_data"
  }
}

resource "aws_ebs_volume" "keycloak_data" {
  availability_zone = var.availability_zone
  size              = var.volume_size["keycloak_data"]
  type              = "gp2"
  tags = {
    Name = "keycloak_data"
  }
}

resource "aws_ebs_volume" "ssl_cert_data" {
  availability_zone = var.availability_zone
  size              = var.volume_size["ssl_cert_data"]
  type              = "gp2"
  tags = {
    Name = "ssl_cert_data"
  }
}

resource "aws_volume_attachment" "financial_postgres_data_attachment" {
  device_name = var.volume_device_names["financial_postgres_data"]
  volume_id   = aws_ebs_volume.financial_postgres_data.id
  instance_id = var.instance_id
}

resource "aws_volume_attachment" "keycloak_postgres_data_attachment" {
  device_name = var.volume_device_names["keycloak_postgres_data"]
  volume_id   = aws_ebs_volume.keycloak_postgres_data.id
  instance_id = var.instance_id
}

resource "aws_volume_attachment" "influxdb_data_attachment" {
  device_name = var.volume_device_names["influxdb_data"]
  volume_id   = aws_ebs_volume.influxdb_data.id
  instance_id = var.instance_id
}

resource "aws_volume_attachment" "keycloak_data_attachment" {
  device_name = var.volume_device_names["keycloak_data"]
  volume_id   = aws_ebs_volume.keycloak_data.id
  instance_id = var.instance_id
}

resource "aws_volume_attachment" "ssl_cert_data_attachment" {
  device_name = var.volume_device_names["ssl_cert_data"]
  volume_id   = aws_ebs_volume.ssl_cert_data.id
  instance_id = var.instance_id
}
