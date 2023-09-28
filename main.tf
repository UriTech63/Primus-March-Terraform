/* module "babah-server" {
  source   = "./modules/ec2"
  subnetId = module.network.subnetId
  sg       = module.babah-sg.sg
}


module "network" {
  source = "./modules/network"
  name = "primus"
  sbn-cidr = "10.0.1.0/24"
}

module "babah-sg" {
  source = "./modules/securityG"
  vpcId  = module.network.vpcId
  sgName = "primus-sg"

}


module "uriel" {

  source = "./modules/securityG"
  vpcId  = module.network.vpcId
  sgName = "uriel"

}

module "babah-vpc" {
  source = "./modules/network"
  vpc-cidr = "10.10.0.0/16"
  name = "babah"
  sbn-cidr = "10.10.0.0/24"
}*/

module "test-vpc" {
source = "terraform-aws-modules/vpc/aws"
cidr = "10.20.0.0/16"
name = "test-vpc"
azs = ["us-east-1b", "us-east-1c"]
public_subnets = ["10.20.0.0/24"]
private_subnets = ["10.20.1.0/24"]

}

module "my-s3" {
  source = "terraform-aws-modules/s3-bucket/aws"
  bucket = "my-s3-bucket-com"
 # acl = "private"


  tags = {
     env = "prod"
     owner = "primus"
  }
  
}


module "git-module-vpc" {
  source = "github.com/babah1139/Primus-March-Terraform/modules/network"
  vpc-cidr = "10.30.0.0/16"
  name = "primus-mar-vpc"
  sbn-cidr = "10.30.0.0/24"
  avZone = "us-east-1a"

}


module "git-module-sg" {
  source = "github.com/babah1139/Primus-March-Terraform/modules/security"
 vpcId = module.git-module-vpc.vpcId
 sgName = "vee-sg"

  
}




