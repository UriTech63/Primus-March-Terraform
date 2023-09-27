
module "babah-server" {
  source = "./modules/ec2"
  subnetId = module.network.subnetId
  sg = module.babah-sg.sg
  }


  module "network" {
    source = "./modules/network"
  }

  module "babah-sg" {
    source = "./modules/securityG"
    vpcId = module.network.vpcId
    sgName = "primus-sg"
    
  }


  module "uriel" {

source = "./modules/securityG"
vpcId = module.network.vpcId
sgName = "uriel"
    
  }








>>>>>>> 90b59ec9bf414699ca52e306874496b190b73c17
