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

    def lambda_handler(event, context):
      return random.choice([True, False])
     ```
    This code defines a single function, authenticate, that returns either "True" or "False" randomly.
1. In the "HomeFrontend" Lambda, click on the "Function code" section and replace the existing code with the following:
    ```python
    import boto3

    def lambda_handler(event, context):
      client = boto3.client('lambda')
      response = client.invoke(FunctionName='Authentication')
      auth_response = response['Payload'].read()
      if auth_response == b'true':
          return {'statusCode': 200, 'body': 'Hello World'}
      else:
          return {'statusCode': 401, 'body': 'Unauthorized'}
    ````
    This code defines a single function, homefrontend, that invokes the "Authentication" Lambda, reads the response and returns 'Hello World' if the response is True, and 'Unauthorized' if the response is False
1. In the "HomeFrontend" Lambda, navigate to the Configuration -> Permissions -> Execution role section and click Edit
1. Click on the "Create a new role from one or more templates" button.
1. In the "Role name" field, enter "HomeFrontendLambdaRole" and Save.
2. Click on the "Create role" button to create the role.
3. Navigate now to IAM and find the newly created "HomeFrontendLambdaRole".
4. Select Add Permissions -> Create inline policy
5. Switch to the JSON tab and paste this
    ```json
    {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "lambda:InvokeFunction",
            "Resource": "*"
        }
      ]
    }
    ```
1. Continue, name it something meaningful (`LambdaToInvokeAnotherLambdaPolicy`) and save it.
7. In the "HomeFrontend" Lambda, navigate to the "Designer" section and click on the "+ Add trigger" button.
8. Select "API Gateway" as the trigger.
9. In the "Configure triggers" section, select "Create a new API" and "HTTP API"
10. Click on the "Add" button to add the API Gateway trigger to the "HomeFrontend" Lambda.
11. Deploy the "HomeFrontend" and "Authentication" Lambdas.
12. Navigate to the API Gateway service and find the URL of the deployed API Gateway.
13. Open a web browser and enter the URL of the API Gateway in the address bar and press enter.
14. Observe the response of the request. It should be either "Hello World" or "Unauthorized" depending on the response from the "Authentication" Lambda

