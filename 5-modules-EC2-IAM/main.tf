module "ec2" {
  source  = "./modules/module1"
  lambda_arn = module.lambda.lambda_function_arn
}

module "lambda" {
  source = "./modules/lambda"
}

module "subscription" {
  source = "./modules/subscription/"
}