module "compute" {
  source        = "./ec2"
}


output "ec2_public_ip" {
  value = module.compute.ec2_public_ip
  description = "Public IP of the EC2 instance from the EC2 module"
}
