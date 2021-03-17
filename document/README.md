# DocumentDB lab
In this lab we'll have the opportunity to get basic hands on experience with a NoSQL document database. [AWS DocumentDB](https://aws.amazon.com/documentdb/) using the Uber example we've been discussing so far.

## Infrastructure
As in other labs we'll use an [AWS Cloudformation](https://aws.amazon.com/cloudformation/) template that I've already built for you. To deploy it:

1. Sign in to [your AWS console](https://aws.amazon.com/console/)
1. Click 'Services' and then 'CloudFormation' to open the CloudFormation service.
1. Now, let's create a new stack (a named container for all the resources we need).
   1. Click 'Create stack' and then select 'With new resources (standard)' option
   1. Select 'Template is ready' and 'Upload a template file'
   1. Now click 'Choose file' and select the `infrastructure.json` file in this very same directory.
   1. Click Next orange button
   1. Enter a stack name of your choice (e.g: 'DocumentDBLabStack'). Click Next again
   1. Nothing to do in this 'Configure stack options' screen. Just click 'Next'
   1. Nothing to do in this 'Review' screen. Just scroll to the bottom and click 'Create stack'
   1. Creation process should finish successfully after ~8 minutes. Take a look at the `infrastructure.json` file and what you see on screen (click the refresh button often) to understand what is being created.
1. Now, let's connect to our shiny new DocumentDB cluster. We'll do it via an [AWS Cloud9](https://aws.amazon.com/cloud9/) instance we've created in the previous step since that's the easiest way to get quickly started.
   1. Follow steps 4 & 5 from [the DocumentDB QuickStart guide](https://docs.aws.amazon.com/documentdb/latest/developerguide/get-started-guide.html#cloud9-mongoshell)
   1. Now you should be in your Cloud9's terminal and the prompt should show `rs0:PRIMARY>`
1. Let's insert data. I've prepared a couple insert statements in the `insert.txt` file in this very same directory. Copy all the contents and paste them in Cloud9's open terminal. If everything went fine, last lines should show 
   ```
   ....
   { "acknowledged" : true, "insertedIds" : [ 1, 2, 3 ] }
   rs0:PRIMARY> 
   ```
1. Time to run some queries on the data.
   1. Run the following to see all records within the `drivers` collection (table)
      ```sql
      db.drivers.find()
      ```
   1. Use the following to look for Arwen's details
       ```
      db.drivers.find({name:"Arwen Undomiel"})
      ```
   1. Use the following query to find all clients driven by Arwen
      ```
      db.clients.find({"trips.driver.name":"Arwen Undomiel"})
      ```
1. Activity. Can you tell what is this query for?
      ```
      db.clients.count({"trips.car.brand": "Ford"})
      ```