################################################################################
# Default
################################################################################

variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

################################################################################
# VPC
################################################################################

variable "create_vpc" {
  description = "Controls if VPC should be created (it affects almost all resources)"
  type        = bool
  default     = true
}

variable "cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "0.0.0.0/0"
}

variable "azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = []
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  type        = bool
  default     = false
}

variable "single_nat_gateway" {
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  type        = bool
  default     = false
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = false
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}

################################################################################
# Security Group
################################################################################

variable "create_sg_external" {
  description = "Controls if external security group should be created"
  type        = bool
  default     = true
}

variable "create_sg_internal" {
  description = "Controls if internal security group should be created"
  type        = bool
  default     = true
}

variable "create_sg_bastion" {
  description = "Controls if bastion security group should be created"
  type        = bool
  default     = true
}

################################################################################
# Bastion
################################################################################

variable "create_bastion" {
  description = "Controls if bastion host should be created"
  type        = bool
  default     = true
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t3.micro"
}

variable "create_key" {
  description = "Controls if key pair should be created"
  type        = bool
  default     = true
}

variable "key_pair_name" {
  description = "Name of the key pair to access EC2. Requires when create_key_pair set to false"
  type        = string
  default     = ""
}