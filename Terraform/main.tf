locals {
  tags = merge(
    { "Name" = var.name },
    var.tags
  )
}

################################################################################
# VPC
################################################################################

module "vpc" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-vpc.git?ref=v3.18.0"

  name = var.name
  cidr = var.cidr

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets


  enable_nat_gateway = var.enable_nat_gateway  ? true : false
  single_nat_gateway = var.enable_nat_gateway && var.single_nat_gateway ? true : false
  one_nat_gateway_per_az = var.enable_nat_gateway && !var.single_nat_gateway ? true : false
  enable_dns_hostnames   = var.enable_dns_hostnames
  enable_dns_support     = var.enable_dns_support

  tags = local.tags
}

################################################################################
# Security Group
################################################################################

module "internal_sg" {
  source              = "git::https://github.com/terraform-aws-modules/terraform-aws-security-group.git?ref=v4.16.1"

  name                = "${var.name}-internal"
  use_name_prefix     = false
  vpc_id              = module.vpc.vpc_id
  egress_rules        = ["all-all"]
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]
  ingress_rules       = ["all-all"]
  tags                = local.tags
}

module "external_sg" {
  source              = "git::https://github.com/terraform-aws-modules/terraform-aws-security-group.git?ref=v4.16.1"

  name                = "${var.name}-external"
  use_name_prefix     = false
  vpc_id              = module.vpc.vpc_id
  egress_rules        = ["all-all"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "https-443-tcp"]
  tags                = local.tags
}

module "bastion_sg" {
  source              = "git::https://github.com/terraform-aws-modules/terraform-aws-security-group.git?ref=v4.16.1"

  name                = "${var.name}-bastion"
  use_name_prefix     = false
  vpc_id              = module.vpc.vpc_id
  egress_rules        = ["all-all"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp"]
  tags                = local.tags
}

################################################################################
# Bastion
################################################################################

module "bastion" {
  source              = "git::https://github.com/terraform-aws-modules/terraform-aws-ec2-instance.git?ref=v4.2.0"

  name = "${var.name}-bastion"

  ami                         = data.aws_ami.amazon_linux.id
  key_name                    = var.create_key ? module.key_pair.key_pair_name : var.key_pair_name
  instance_type               = var.instance_type
  subnet_id                   = element(module.vpc.public_subnets, 0)
  vpc_security_group_ids      = module.bastion_sg.security_group_id
  associate_public_ip_address = true

  tags = local.tags
}

module "key_pair" {
  source             = "git::https://github.com/terraform-aws-modules/terraform-aws-key-pair.git?ref=v2.0.0"

  key_name           = "${var.name}-key-pair"
  create_private_key = var.create_key ? true : false

  tags = local.tags
}