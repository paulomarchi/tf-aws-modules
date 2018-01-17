variable "aws_profile" {
  description = "Insert your AWS Profile"
}

variable "owner" {
  description = "Insert the Owner for Project"
}

variable "project" {
  description = "Insert the Name of Project"
}

variable "aws_region" {
  description = "The AWS region to create things in."
  type        = "string"
}

variable "vpc_cidr_blocks" {
    description = "Insert CIR Blocks for VPCs"
    type = "list"
}

variable "aws_azs" {
  description = "Run the EC2 Instances in these Availability Zones"
  type        = "list"
}

variable "subnets_cidr_blocks" {
    description = "Insert CIR Blocks for VPCs"
    type = "list"
}
