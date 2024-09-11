variable "security_group_id" {
  description = "Security group ID to associate with the EC2 instance"
}

variable "ami" {
  description = "AMI ID to use for the instance"
}

variable "instance_type" {
  description = "Instance type to use"

}

variable "key_name" {
  description = "Key pair name to use"

}

variable "iam_instance_profile" {
  description = "IAM instance profile to associate with the EC2 instance"
}
variable "iam_instance_profile_name" {
  description = "IAM instance profile name to associate with the EC2 instance"
}
variable "instance_tags" {
  description = "Tags to be applied to the EC2 instance"
  type        = map(string)

}
