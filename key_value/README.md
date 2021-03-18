# DynamoDB Lab
In this lab we'll have the opportunity to get basic hands on experience with a NoSQL KeyValue database. [AWS DynamoDB](https://aws.amazon.com/dynamodb) using the Uber example we've been discussing so far

## Infrastructure
As in other labs we'll use an [AWS Cloudformation](https://aws.amazon.com/cloudformation/) template that I've already built for you. To deploy it:

1. Sign in to [your AWS console](https://aws.amazon.com/console/)
1. Click 'Services' and then 'CloudFormation' to open the CloudFormation service.
1. Now, let's create a new stack (a named container for all the resources we need).
    1. Click 'Create stack' and then select 'With new resources (standard)' option
    1. Select 'Template is ready' and 'Upload a template file'
    1. Now click 'Choose file' and select the `infrastructure.yaml` file in this very same directory.
    1. Click Next orange button
    1. Enter a stack name of your choice (e.g: 'DynamoDBLabStack'). Click Next again
    1. Nothing to do in this 'Configure stack options' screen. Just click 'Next'
    1. Nothing to do in this 'Review' screen. Just scroll to the bottom and click 'Create stack'
    1. Creation process should finish successfully after ~2 minutes. Take a look at the `infrastructure.json` file and what you see on screen (click the refresh button often) to understand what is being created.
1. We've created a database table called 'Drivers'. Now let's add some items.
    1. Click 'Services' and then 'DynamoDB' to open the DynamoDB console.
    1. Click 'Tables' on the left menu and you should see the newly created Drivers table along with some more information like the Partition key being used
    1. Click the table name to get into the table's menu and find the 'Items' tab.
    1. Click the 'Create item' button and add a couple values. (If you open the Text view you can directly paste something like this:)
       ```json
       {
         "name": "Harry Potter",
         "car": "Ford"
       }
       ```
       also
       ```json
        {
         "name": "Rafael Nadal",
         "car": "Kia",
         "profession": "Tennis player"
       }
       ```
1. Let's now run some queries:
    1. Starting from the same 'Items' tab.
    1. Select the 'Query' value from the drop box (Scan and Query are the only two options)
    1. Insert a name on the input text field and click Start search
    1. Add some filters for other fields
1. Now select the 'Scan' option. Add filters for different fields and run the queries.
1. Now reflect. We said that only key based queries were possible for KV stores and we have just ran queries based on other fields. How comes?