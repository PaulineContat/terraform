output "lambda_function_arn" {
  value = aws_lambda_function.lambda_function.arn
}

output "sns_topic_arn" {
  description = "The ARN of the SNS topic"
  value       = aws_sns_topic.creation_ec2_topic.arn
}

output "sns_topic_subscription_arn" {
  description = "The ARN of the SNS topic subscription"
  value       = aws_sns_topic_subscription.creation_ec2_subscription.arn
}