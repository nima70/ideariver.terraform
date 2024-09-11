variable "availability_zone" {
  description = "The availability zone where the EBS volumes will be created."
  type        = string
}

variable "instance_id" {
  description = "The ID of the instance to which volumes will be attached."
  type        = string
}

variable "volume_size" {
  description = "The size of each volume in GB."
  type        = map(number)

}

variable "volume_device_names" {
  description = "Device names for volume attachments."
  type        = map(string)

}
