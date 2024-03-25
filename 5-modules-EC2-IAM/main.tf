module "ec2" {
  source  = "./modules/ec2"
  lambda_arn = module.subscription.lambda_function_arn
  instances = var.instances
  sns_topic_arn = module.subscription.sns_topic_arn
}

module "subscription" {
  source = "./modules/subscription-lambda"
}