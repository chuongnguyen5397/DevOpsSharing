module "test" {
  source = "../"

  name = "demo"
  cidr            = "172.16.0.0/16"
  azs             = ["ap-southeast-1b", "ap-southeast-1c"]
  private_subnets = ["172.16.10.0/24", "172.16.11.0/24"]  
  public_subnets  = ["172.16.0.0/24", "172.16.1.0/24"]     
}