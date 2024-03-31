variable "vpc_cidr" {
  description= "The VPC range"
  type= string
}

variable "subnet1_cidr" {
  description= "The subnet range"
  type= string
}

variable "subnet2_cidr" {
  description= "The subnet range"
  type= string
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "keypair" {
  description = "AWS keypair for Ec2"
}

variable "bucket_name" {
  description = "S3 bucket name"
}