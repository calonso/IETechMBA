# Datalake lab
In this lab we'll have the opportunity to get hands on experience with a datalake. [AWS S3](https://aws.amazon.com/s3/) using the Uber example we've been discussing during classes.

## Infrastructure

As in other labs we'll use an [AWS Cloudformation](https://aws.amazon.com/cloudformation/) template that I've already built for you. It can be found in this very same directory. Deploy it.

## Insert data

Now let's add data to our new datalake. As we've just seen, datalakes normally store data in compressed files in a distributed filesystem such as S3 in our case. Adding data to our datalake means dropping compressed files in an S3 bucket we've just created and using some form of cataloguing.

We've just created an S3 bucket and an [AWS Glue](https://aws.amazon.com/glue) table as our catalog. AWS Glue is one of the cataloguing solutions AWS offers. We'll practice here with a very flexible data cataloguing strategy, but as you probably are guessing, it is not necessarily the best for other use cases. Data cataloguing, as discussed, is something complex that needs to be designed carefully and that is outside the scope of this course.

1. Go to the [S3 service console](https://s3.console.aws.amazon.com/s3/home) and find a bucket called `ie-tech-mba-XXXXXXXX-bucket`. Open it. It should be empty
1. Now create the following directory structure:
   ```
   year=2021/month=01/day=01/hour=01
   year=2021/month=01/day=02/hour=01
   year=2021/month=01/day=02/hour=02
   ```
1. Distribute the gzip files in this very same directory accordingly.

## Querying data

1. Open the [AWS Glue console](https://console.aws.amazon.com/glue/home), open the `events` table and take a look at the definition we've created. This table will be our data catalog today. Out cataloguing approach consists of a metadata envelope (type, event, arrival_date) and the event's specific data (name, client, brand, model, ...) that will have value or be empty depending on the event type. Remember we mentioned this is a very flexible cataloguing approach but it has, of course, shortcomings.
1. Now open the [AWS Athena console](https://console.aws.amazon.com/athena/home). Athena is the querying tool we'll use in this lab
1. Click the link in the notice about setting the output bucket for queries and select the `athena-output-XXXXXXX-bucket` bucket.
1. Select `uber` database and let's run some queries!
1. Use the following to load all data in the catalog
  1. Click on the three vertical buttons next to the `events(Partitioned)` you'll see on the left
  1. And select `Load partitions`
  1. Verify a `MSCK REPAIR TABLE events;` has run and the output prints:
    ```
    ...
    Repair: Added partition to metastore events: ...
    ```
1. Use the following to see how a `Driver` related event looks
  ```sql
  SELECT * FROM events WHERE type = 'Driver' LIMIT 2;
  ```    
1. Use the following to get all available events
  ```sql
  SELECT DISTINCT(event) FROM events;
  ```
1. Use the following to see all events related with `Ford` brand cars
  ```sql
  SELECT * FROM events WHERE data.brand = 'Ford';
  ```

## Activity
* Reflect: What shortcomings can the cataloguing approach used here have?
* Can you tell the story of Arwen in the platform?

