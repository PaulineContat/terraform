import boto3

def handler(event, context):
   client = boto3.client('sns')
   account_id = boto3.client('sts').get_caller_identity().get('Account')
   region = boto3.session.Session().region_name
   
   try:
      response = client.publish(TopicArn='arn:aws:sns:' + region +':' + account_id + ':creation_ec2_topic', Message="EC2 has been created")
      print("Message published")
   except:
      print(f"Failed to publish message: {e}")
      
   return(response)