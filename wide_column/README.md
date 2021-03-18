# Keyspaces for Cassandra lab
In this lab we'll have the opportunity to get basic hands on experience with a NoSQL KeyValue database. [AWS Keyspaces for Cassandra](https://aws.amazon.com/keyspaces/) using the Uber example we've been discussing so far.

## Infrastructure
As in other labs we'll use an [AWS Cloudformation](https://aws.amazon.com/cloudformation/) template that I've already built for you. To deploy it:

1. Sign in to [your AWS console](https://aws.amazon.com/console/)
1. Click 'Services' and then 'CloudFormation' to open the CloudFormation service.
1. Now, let's create a new stack (a named container for all the resources we need).
    1. Click 'Create stack' and then select 'With new resources (standard)' option
    1. Select 'Template is ready' and 'Upload a template file'
    1. Now click 'Choose file' and select the `infrastructure.yaml` file in this very same directory.
    1. Click Next orange button
    1. Enter a stack name of your choice (e.g: 'CassandraLab'). Click Next again
    1. Nothing to do in this 'Configure stack options' screen. Just click 'Next'
    1. Nothing to do in this 'Review' screen. Just scroll to the bottom and click 'Create stack'
    1. Creation process should finish successfully after ~2 minutes. Take a look at the `infrastructure.json` file and what you see on screen (click the refresh button often) to understand what is being created.
1. We've created a keyspace called `uber` and two tables `drivers` and `trips` respectively. Let's add some data.
    1. Click 'Services' and then 'Keyspaces' to open the Keyspaces console.
    1. Click the 'Keyspaces' menu option on the left hand.
    1. Click on the name to view the tables.
    1. Click the 'CQL editor' menu option on the left hand.
    1. Copy and paste the `INSERT` sentences on the `uber.cql` file on this very same directory. Note: Unfortunately You'll need to run them one at a time.
    1. Now that we have some data, let's run some queries!
1. Use the following to see all trips:
   ```sql
   SELECT * FROM uber.trips;
   ```
1. Use the following to see all of Arwen's trips:
   ```sql
   SELECT * FROM uber.trips WHERE name = 'Arwen Undomiel';
   ```
1. Use the following to see all Arwen's trips on January:
   ```sql
   SELECT * FROM uber.trips WHERE name = 'Arwen Undomiel' AND date >= '2020-01-01' AND date < '2020-02-01';
   ```
1. Activities: 
   1. Click on the 'Dashboard'. Select 1h on the Performance table to see most recent data. Anything noticeable?
   1. Write the required query(es) to get all trips that happened on a `Ford`. Notes: You may want to check [this link](https://docs.datastax.com/en/cql-oss/3.3/cql/cql_reference/cqlCreateTable.html#cqlCreateTable)