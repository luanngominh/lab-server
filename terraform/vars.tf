variable "region" {
  type = string
  description = "The region where splunk will run on"
  default = "ap-southeast-1"
}

variable "instance_type" {
  type = string
  description = "Instance type"
}

variable "instance_ami" {
  type = string
  description = "Instance AMI"
}

variable "number_of_instance" {
  type = string
  description = "Number of disk per instance"
}

variable "aws_access_key_id" {
  type = string
  description = "AWS access key"
}

variable "aws_secret_access_key" {
  type = string
  description = "AWS secret key"
}

variable "bucket" {
  type = string
  description = "State bucket is used to save terraform state"
}

variable "dynamo_table" {
  type = string
  description = "Dynamo table for locking"
}
