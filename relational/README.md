# Relational lab
In this lab we'll have the opportunity to get hands on experience with a relational database. [AWS Aurora](https://aws.amazon.com/rds/aurora/) using the Uber 
example we've been discussing during classes.

## Infrastructure

First thing we need to do is to create the infrastructure for the lab. An AWS Aurora cluster in this instance. 
To create we'll use [AWS Cloudformation](https://aws.amazon.com/cloudformation/). AWS' *infrastructure as code* solution. 
I have created all the definition for you, all you need this time is to create the infrastructure that I've defined for you in your personal or student AWS account.

1. Sign in to [your AWS console](https://aws.amazon.com/console/)
1. Navigate to [Clouformation console](https://console.aws.amazon.com/cloudformation/home)
1. Now, let's create a new stack (a named container for all the resources we need).
   1. Click 'Create stack' and then select 'With new resources (standard)' option
   1. Select 'Template is ready' and 'Upload a template file'
   1. Now click 'Choose file' and select the `infrastructure.yaml` file in this very same directory.
   1. Click Next orange button
   1. Enter a stack name of your choice (e.g: 'RelationalLabStack'). Click Next again
   1. Nothing to do in this 'Configure stack options' screen. Just click 'Next'
   1. Nothing to do in this 'Review' screen. Just scroll to the bottom and click 'Create stack'
   1. Creation process should finish successfully after ~5 minutes. Take a look at the `infrastructure.yaml` file and what you see on screen (click the refresh button often) to understand what is being created.
1. Now let's run some queries on our new database.    
   1. Click 'Services' and then 'RDS' to open the RDS (Relational Database Service) console.
   1. Click the 'Databases' menu on the left hand. Then you should see the newly created `techmbatestcluster` cluster. Play around a little bit to understand what's at hand.
   1. Click the 'Query Editor' menu on the left hand. We now need to specify the cluster and credentials.
      1. Database instance or cluster: `techmbatestcluster`
      1. Database username: `Add new database credentials`
      1. Enter database username: `root`
      1. Enter database password: `rootAtTechmba`
      1. Click outside the text area (so that the `Connect to Database` button gets activated)
      1. Click `Connect to Database` button.
   1. Now copy all the contents of the `uber.sql` file in this very same directory and paste them on the query editor, replacing anything that may be there.
   1. Review that all sentences executed successfully (there may be more than one page)
1. Let's explore the data!
   1. Use the following to see which tables have been loaded.
      ```sql
        USE Uber;
        SHOW TABLES;
      ```
   1. Use the following to see clients' table structure. (change `clients` to any other table you with to explore)
      ```sql
        USE Uber;
        DESCRIBE clients;
      ```
   1. Use the following to peek at the data.
      ```sql
        USE Uber;
        SELECT brand, model, color FROM cars;
      ```
    1. Use the following to see how many trips happened in total.
      ```sql
        USE Uber;
        SELECT COUNT(*) FROM trips;
      ```

## Activity:

Can you tell which is the user that took the most trips? Tip: See [MySQL `COUNT()` aggregation](https://dev.mysql.com/doc/refman/8.0/en/aggregate-functions.html#function_count), specifically where it refers to aggregating (or grouping) over windows.

## Challenge:

Can you tell which is the `MAX`imum `COUNT` of shifts a driver has ever drove? Tip: See [MySQL `ORDER`](https://dev.mysql.com/doc/refman/8.0/en/sorting-rows.html) and [`LIMIT`](https://www.mysqltutorial.org/mysql-limit.aspx) clauses.