# Messages queue lab
In this lab we'll have the opportunity to get hands on experience with a flavor of messages queue. [AWS Kinesis](https://aws.amazon.com/kinesis/).

## Infrastructure

As in other labs we'll use an [AWS Cloudformation](https://aws.amazon.com/cloudformation/) template that I've already built for you. It can be found in this very same directory. Deploy it.

**Note:** This template requires creating some special permissions that we have not needed this far, so once you first click the orange 'Create Stack' button, an error will display on top of the screen reading `Required capabilities [CAPABILITY_NAMED_IAM]`. Scroll to the bottom and you'll see a blue box with a checkbox that you need to check in order to approve such permissions creation. Check it and click 'Create Stack' again. 

Done? Thanks! Now I own your soul! :)

In that infrastructure we've created a Kinesis Firehose delivery stream, which is basically a message queue with some configurable parameters that reads data from a producer and writes it into a sink. In this case we've applied the following configuration
* 60 seconds timeout 
* 1MB size limit
* S3 sink
Can you spot this values in the infrastructure file?

What does this mean? This means that whenever the queue receives data it will group messages together until either 60 seconds are elapsed or the total size of messages is 1MB. Whenever any of this happens, all data will be dumped to S3 following the configured prefix.

## Let's stream some data!

Now that we have our new messages queue ready, let's produce some test data and see how it is processed and dumped to the S3 sink.

1. Open the [Kinesis Data Firehose console](https://console.aws.amazon.com/firehose/home)
1. Open the `ie-tech-mba-stream` stream
1. Open the 'Monitoring' tab. 
  1. Locate the graph titled 'Incoming records per second'
  1. Click the menu (three dots on the top right corner). And select 'View in metrics'
  1. Select '1h' on top right
  1. On the refresh button, select 'Auto refresh' and 10 seconds interval
  1. Now on the graphed metrics, below the graph, deselect e1 aggregation and select m1 (IncomingRecords (per second average))
  1. Now select 30 seconds period instead of the default 5 minutes for both m1 and m2.
  1. Here we should see some value for IncomingRecords as soon as we start sending something to our queue.
1. Back now to the Kinesis tab, unfold the 'Test with demo data' menu. Start sending demo data to it!
1. Now data is being sent, don't touch that screen, otherwise test data streaming will stop
1. Switch to the tab with the IncomingRecords graph taht we configured just before.
1. We should see some values for IncomingRecords.
1. Now open an [S3 console](https://s3.console.aws.amazon.com/s3/home) and look for the `ie-tech-mba-message-queue-sink-XXXX-bucket`. We should have data there!

## Activity:

* The infrastructure also created the Athena infrastructure required to analyze the data. Which is the ticker that has improved the most?
* We've configured 60 seconds or 1MB size limit, whichever happens first, the queue sends a package of data to the sink. What other values could we use? When would you use different ones?
* Athena is allowing us to use SQL to query data in S3!! What great product does this remind you?