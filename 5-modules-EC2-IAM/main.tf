module "ec2" {
  source  = "./modules/module"
}

module "random_string" {
  source  = "./modules/hello_world_random_string"
}