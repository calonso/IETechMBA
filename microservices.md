In this lab we'll create two microservices, pretty similar to the home frontend and the authentication one and, using dummy code, demo how two real world microservices interact with each other.

1. Log in to the AWS Management Console and navigate to the AWS Lambda service.
1. Click on the "Create function" button to create a new Lambda function.
1. Choose "Author from scratch" as the function creation method.
1. In the "Function name" field, enter "HomeFrontend" and select "Python 3.8" as the runtime.
1. Click on the "Create function" button to create the "HomeFrontend" Lambda.
1. Repeat steps 2-5 to create a second Lambda called "Authentication"
1. In the "Authentication" Lambda, click on the "Function code" section and replace the existing code with the following:
    ```python
    import random

    def authenticate(event, context):
      return random.choice([True, False])
     ```
    This code defines a single function, authenticate, that returns either "True" or "False" randomly.
1. In the "HomeFrontend" Lambda, click on the "Function code" section and replace the existing code with the following:
    ```python
    import boto3

    def homefrontend(event, context):
      client = boto3.client('lambda')
      response = client.invoke(FunctionName='Authentication')
      auth_response = response['Payload'].read()
      if auth_response == b'true':
          return {'statusCode': 200, 'body': 'Hello World'}
      else:
          return {'statusCode': 401, 'body': 'Unauthorized'}
    ````
    This code defines a single function, homefrontend, that invokes the "Authentication" Lambda, reads the response and returns 'Hello World' if the response is True, and 'Unauthorized' if the response is False
1. In the "HomeFrontend" Lambda, navigate to the "Execution role" section.
1. Click on the "Create a new role from one or more templates" button.
1. In the "Role name" field, enter "HomeFrontendLambdaRole".
1. In the "Policy templates" section, select "Simple Microservice permissions"
1. Click on the "Create role" button to create the role.
1. In the "HomeFrontend" Lambda, navigate to the "Designer" section and click on the "+ Add trigger" button.
1. Select "API Gateway" as the trigger.
1. In the "Configure triggers" section, select "Create a new API" and "HTTP API"
1. Click on the "Add" button to add the API Gateway trigger to the "HomeFrontend" Lambda.
1. Deploy the "HomeFrontend" and "Authentication" Lambdas.
1. Navigate to the API Gateway service and find the URL of the deployed API Gateway.
1. Open a web browser and enter the URL of the API Gateway in the address bar and press enter.
1. Observe the response of the request. It should be either "Hello World" or "Unauthorized" depending on the response from the "Authentication" Lambda

