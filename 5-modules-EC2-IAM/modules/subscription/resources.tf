resource "aws_sns_topic" "creation_ec2_topic" {
  name = "ec2-creation-topic"
}

resource "aws_sns_topic_subscription" "creation_ec2_subscription" {
  topic_arn = aws_sns_topic.creation_ec2_topic.arn
  protocol  = "email"
  endpoint  = var.email
}