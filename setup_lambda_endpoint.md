# Setting up an AWS Lambda Endpoint
This lab will guide you through the process of setting up an endpoint in AWS Lambda that returns a hardcoded response to an HTTP GET request.

## Prerequisites
1. An AWS account
1. Access to the AWS Management Console

## Steps
1. Log in to the AWS Management Console and navigate to the Lambda service.
1. Click on the “Create function” button.
1. Select “Author from scratch” and enter a name for the function (e.g. “IETechMBATestLambda”). Select “Python 3.8” for the runtime and click on the “Create function” button.
1. In the “Function code” section, replace the existing code with the following:
    ```
    def lambda_handler(event, context):
      return {
          'statusCode': 200,
          'body': 'Hello, World!'
      }
    ```
1. In the Designer section, click on the “Add trigger” button and select “API Gateway” from the list.
1. Select “Create a new API” and set the security to “Open”, then click on the “Add” button.
1. Scroll down to the “API Gateway” section in the designer. Click on the “API Gateway” trigger and set the “HTTP method” to “GET”.
1. Click on the “Save” button to save the changes to the function.
1. In the top right corner of the screen, click on the “Deploy” button.
1. In the “Actions” drop-down menu, click on “Deploy API”.
1. In the “Deployment stage” section, select “prod”, then click on the “Deploy” button.
1. Once the deployment is complete, you will see the URL for the endpoint in the “API Gateway” section.

## Testing the endpoint
You can test the endpoint by sending an HTTP GET request to this URL. The response should be "Hello, World!"

Use a web browser to send an HTTP GET request to the endpoint URL. For example, you can open a web browser, such as Google Chrome or Mozilla Firefox, and enter the endpoint URL in the address bar. This will send an HTTP GET request to the endpoint and you should see the hardcoded response "Hello, World!" in the browser window.

## Activity

How would you modify it to include the date in the response? And to count the number of visits?
