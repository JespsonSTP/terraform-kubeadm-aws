output "vpc" {
  value = {
    vpc_id = module.vpc.vpc_id
  }
}

output "pub_subnet" {
  value = {                                               
    eks_vpc_pub_subs          = module.vpc.public_subnets      
    //datacentre-VPC_pubsubnets          = ["${module.aws_subnet.datacentre-VPC_pubsubnet.*}"]            
  }                                                    
}
output "priv_subnet" {
  value = {                                               
    eks_vpc_priv_subs         = module.vpc.private_subnets      
    //datacentre-VPC_pubsubnets          = ["${module.aws_subnet.datacentre-VPC_pubsubnet.*}"]            
  }                                                    
}

output "utilities_subnet" {
  value = {                                               
    eks_vpc_utility_subs          = ["${aws_subnet.utility.id}"]       
    //datacentre-VPC_pubsubnets          = ["${module.aws_subnet.datacentre-VPC_pubsubnet.*}"]            
  }                                                    
}
