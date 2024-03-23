import boto3
client = boto3.client('sns')
def handler(event, context):
   account_id = boto3.client('sts').get_caller_identity().get('Account')
   region = boto3.session.Session().region_name
   response = client.publish(TopicArn='arn:aws:sns:' + region +':' + account_id + ':creation_ec2_topic',
                             Message="Une EC2 a été créée")
   print("Message published")
   return(response)