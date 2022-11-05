module "networking" {
  source         = "./modules/networking"      
  namespace      = var.namespace
  vpc_name       = var.vpc_name
  vpc_cidr       = var.vpc_cidr 
  pubroutid       = var.pubroutid
  cluster_name = var.cluster_name
  utilities_subnet = module.networking.utilities_subnet
  pub_subnet = module.networking.pub_subnet
  env            = var.env  
  region = var.region              
}

module "kubernetes" {
  source = "./modules/eks"
  namespace      = var.namespace
  vpc_cidr       = var.vpc_cidr
  ami       = var.ami
  vpc                    = module.networking.vpc
  cluster_name = var.cluster_name
  master_instance_type = var.master_instance_type
  instance_type = var.instance_type
  nodes_max_size = var.nodes_max_size
  nodes_min_size = var.nodes_min_size
  pub_subnet             = module.networking.pub_subnet
  priv_subnet            = module.networking.priv_subnet
  utilities_subnet            = module.networking.utilities_subnet
  private_subnet01_netnum = var.private_subnet01_netnum
  public_subnet01_netnum = var.public_subnet01_netnum
  worker_instance_type = var.worker_instance_type
  aws_key_pair = var.aws_key_pair
}

//utilitysubnet = module.networking.aws_subnet.utility