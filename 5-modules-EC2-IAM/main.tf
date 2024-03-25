module "ec2" {
  source  = "./modules/ec2"
  lambda_arn = module.lambda.lambda_function_arn
}

module "subscription" {
  source = "./modules/subscription-lambda"
}