# Elasticsearch lab
In this lab we'll have the opportunity to get hands on experience with a full text search engine. [AWS Elasticsearch](https://aws.amazon.com/elasticsearch-service/) using the Uber
example we've been discussing during classes.

## Infrastructure
As in other labs we'll use an [AWS Cloudformation](https://aws.amazon.com/cloudformation/) template but this time we'll be using another example provided by AWS that I think will give us a great experience.

1. Sign in to [your AWS console](https://aws.amazon.com/console/)
1. Now open [https://github.com/aws-samples/amazon-elasticsearch-service-with-cognito](https://github.com/aws-samples/amazon-elasticsearch-service-with-cognito).
1. Scroll down to the `Get started` section and click on the 'Launch Stack' button.
1. This time we're using an already built example from the AWS applications repository (there are hundreds of examples!!). We confirm we want that particular application by clicking the 'Deploy' orange button.
1. On the application settings screen, the only thing we need to configure is a prefix. Use anything, e.g: 'TechMBATest'. And click Deploy.
1. Now go to [the CloudFormation console](https://console.aws.amazon.com/cloudformation/home) to monitor the creation process.
1. Creation process should successfully finish after ~20 minutes. This time we're creating:
    1. Users credentials management with AWS cognito
    1. Kibana 
    1. Elasticsearch
    1. Required infrastructure.
1. Stop here. Let Carlos know you're done. We'll come back later.

## Practice time.
1. The stack creation should have successfully finished now.
1. Go to the 'Access the example dashboard' section of [the AWS tutorial](https://github.com/aws-samples/amazon-elasticsearch-service-with-cognito#access-the-example-dashboard)
1. Follow the steps described there to create a user, grant permissions and visualise a couple datapoints on the dashboard.
1. Now let's setup a few indexes and add some data to it.
   1. Use the following to create an index. We're configuring it with 8 shards and 2 replicas each.
       ```
        PUT /drivers
        {
            "settings": {
                "index": {
                    "number_of_shards": 8,  
                    "number_of_replicas": 2
                }
            }
        }
       ```
   1. If you experience permissions issues you probably haven't added your user to the `es-admins` group in Cognito as [the tutorial](https://github.com/aws-samples/amazon-elasticsearch-service-with-cognito#access-the-example-dashboard) dictates. Log out and log back in otherwise.
   1. Use the following to add some data
        ```
        POST /drivers/_doc
      {
          "name": "Arwen Undomiel",
          "car": {
             "brand": "Ford",
             "model": "Mustang"
          }
      }
        ```
   1. Insert data for both John and Jane Doe (remember)
   1. Use the following to get all drivers
      ```
      GET /drivers/_search
      {
        "query": {
          "match_all": {}
        }
      }
      ```
   1. Identify Arwen's id(`_id`). Let's get its details
      ```
      GET /drivers/_doc/<Arwen's _id>
      ```
   1. Let's test now fuzzy matching
      ```
      GET /drivers/_search
      {
        "query": {
          "fuzzy": {
            "name": {
              "value": "jnae",
              "fuzziness": 2
            }
          }
        }
      }
      ```
   1. Now create a trips index
   1. Insert some data
    ```
     POST /trips/_doc
     {
        "client": "Alice",
        "driver": {
          "name": "Arwen Undomiel",
          "car": {
            "brand": "Ford"
          }
        },
        "date": "2021-01-01"
     }
    ```
   1. Add some more data. Try to use different but close enough dates so visualizations are nicer
1. Let's create a visualization.
   1. In Kibana, go to the Home screen and select Visualize.
   1. We'll need to create an index pattern now as the source for our visualizations.
      1. Type `trips` in the Index pattern name text box
      1. Click Next step
      1. Select the date field as time field
      1. Create index pattern.
   1. Now go back to the Kibana Home and click Visualize. Create new visualization.
   1. Select Vertical bar from the choices
   1. Select the trips* pattern we've just created
   1. Adjust the time range on top right to cover at least one day before the first date of the trips you've entered and at least until one day after your last date.
   1. Add a Bucket on the X-axis.
   1. Select Aggregation Terms
   1. Select driver.name.keyword Field
   1. Click Update on the bottom right and we should see a histogram of the number of trips per driver on that time range!
1. Activity!
   1. We want a pie chart that shows the number of trips per car brand.