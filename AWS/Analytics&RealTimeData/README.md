# DevOps Sharing

**WARNING:** The content of this repository is my **personal knowledge**

Please let me know if you find something wrongs and I will fix that
---
## Streaming Data Solutions

Kinesis Data Streams

* Can collect and process large streams of data records in real time

* Accessible via VPC or public internet

* Ability to scale to keep up wotj data being produced

* Allow ingestion of large amounts of data and provides durable storage

* Groups of Data Records form Data Streams that get distributed into Shards

Kinesis Data Firehose

* Fully managed service for real-time data delivery

* Outputs to data services like S3, Amazon Redshift, ElasticSearch and Splunk

* Can output raw data or transform data before delivery

Kinesis Data Analytics

* Real-time process and analysis of streams using SQL

* Time-series analytics, real-time dashboard and real-time metrics

* Outputs to Data Firehose, Lambda and Data Streams

Kinesis Video Streams

* Stream live video from devices to AWS, includes real time streaming

* Capture data from millions of sources

* Send non-video-time-serialized data

* Can durably store media data for specific period

## Analyzing Big Data Solutions

Amazon EMR

* Managed cluslter platform for running big data frameworks (Apache Hadoop & Apache Spark)

* Process and analyze vast amounts of data

* Transform and move data in and out of AWS datastores

Amazon Redshift

* Fully managed, petabyte-scale data warehouse service

* Collection of compute resources know as nodes, that are organized into groups called clusters

* Each cluster runs Amazon Redshift engine and contains one or more databases

ElasticSearch

* Managed service for running ElasticSearch, open-source search and analytics engine

* Scales easily with a single API call

* Detection and recovery of failed nodes

Amazon Quicksight

* Managed business analytics service that build visualizations, perform ad hoc analysis and get busisness insights

* Automatically discover AWS data sources or configure ourselves

* Uses SPICE (Super-Fast Parallel In-memory Calculation Engine)for responsive performance and massive scaling abilities

## Application Integration Services

SQS

* Secure, durable and hosted queue service

* Allows for integration and decoupling for microservices

* Support Standard and FIFO

* No requirement of message brokers

SNS

* Coordinates and manages delivery and sending of messages to subscribers through resources called topics

* Two types of clients known as subscribers (consumers) and publishers (producers)

* Subscribers consume messages and notifications that are published via a supported protocol like HTTP/S or email

Step Functions

* Coordinate distributed applications using visual workflows

* Each component performs a discrete function of task

* Reliable coordination and step through of your applications

* Automatic triggering, step tracking and retries after errors

## AWS IoT

AWS IoT Services

* Secure, bi-directional communication between Internet devices and AWS

* Collect and store telemetry data from multiple devices for analysis

* Enable users to control IoT devices from their personal phones, tablets, and smart home devices