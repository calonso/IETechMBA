# Data warehouse lab
In this lab we'll have the opportunity to get hands on experience with a data warehouse. [AWS Redshift](https://aws.amazon.com/redshift) using the Uber 
example we've been discussing during classes.

## Infrastructure

As in other labs we'll use an [AWS Cloudformation](https://aws.amazon.com/cloudformation/) template that I've already built for you. It can be found in this very same directory. Deploy it.

## Insert data

Now let's run some queries on our new data warehouse.

1. Click 'Services' and then 'Redshift' to open [the Redshift console](https://console.aws.amazon.com/redshiftv2/home)
1. Select 'Clusters' on the left menu. Select the cluster name. Have a quick look at the information at hand.
1. Click the 'Query cluster' orange button on top right.
1. Click the 'Connect to database' orange button now.
1. Select 'Create a new connection' and fill in the rest of the fields
  1. Select Temporary credentials
  1. Leave the 'Cluster' value untouched
  1. Insert `uber_dw` as the database name
  1. Insert `root` as the database user.
  1. Click 'Connect'.
1. Now, on the query editor, copy and paste the SQL sentences in `uber.sql` file in this very same directory.
1. Run
1. Select the 'public' schema on the Select schema dropbox on the left. You should see the tables we've just designed in class.

## Query data

1. Use the following to see how many trips has each client hired
   ```sql
   SELECT client_id, COUNT(*) AS trips
   FROM trip_facts
   GROUP BY client_id
   ```
1. Use the following to see how many trips, per month, have happened
   ```sql
   SELECT DATE_PART('year', start_time) AS year, DATE_PART('month', start_time) AS month, COUNT(*) AS trips 
   FROM trip_facts
   GROUP BY 2, 1
   ```

## Activity

1. What is this query giving us?
   ```sql
   SELECT driver_id, COUNT(*) AS trips
   FROM trip_facts
   GROUP BY driver_id
   ```
1. How can we add the driver name? Tip: Make sure you have the information first, then aggregate.

## Tear down

Remember to destroy the CloudFormation stack once finished.
