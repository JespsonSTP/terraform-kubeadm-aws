module "networking" {
  source        = "./modules/networking"      
  namespace     = var.namespace                   
}


# module "kubernetes" {
#   source        = "./modules/eks"      
#   namespace     = var.namespace 
#   region
#   vpc_cidr
#   vpc_name
#   private_subnet
#   public_subnet 
#   ami
#   cluster_name =     
#   master_instance_type = 
#   worker_instance_type = 
# CTRL + K + C to apply comment on the selected code.
# }