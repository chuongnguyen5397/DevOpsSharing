# DevOps Sharing

**WARNING:** The content of this repository is my **personal knowledge**

Please let me know if you find something wrongs and I will fix that
---
## Database Solutions

On-prem RDBMS

* Challenges: Scalability, Operational Simplicity (Sharding, Backups, Recovery, Updates, Encryption), Cost efficiency

The Self-managed RDBMS in AWS

* Hosting an RDBMS in AWS EC2

RDS in AWS

* Managed service to run RDBMS for replacement of on-prem

* Automated maintenance, scaling, redundancy

* Supported engines: MySQL, MariaDB, PostgreSQL, MS SQL Server, Oracle, Aurora

* Advantages

    * Ease of administration

    * Scalability

    * Available and durable

    * High performance

    * Secure

    * Inexpensive

* Disadvantages

    * Lack of control: reduced admistration comes at a cost

    * Version support: Not all editions and verions of software will be supported in AWS RDS

    * Feature support: Not all features of a platform like MS SQL Server will be supported

    * Operational constraints: Features like replication and scaling can vary wildly from non-managed service deployments

    * Different cost model: Use cost tools to estimate expected montly costs

AWS Aurora

* MySQL and PostgreSQL compatible

* Up to 5 times more throughput than MySQL

* High speed distributed storage (~ 64 TB max)

* Often an excellent choice for new DB in AWS

* Simple push button migration from MySQL and PostgreSQL

## DynamoDB and ElastiCache Solutions

DynamoDB 

* Multi-AZ NoSQL data store

* Cross-region replication option

* Eventually consitency model with strongly consistent option; ACID compliance with DynamoDB Transactions

* Planned read/write capacity or on-demand

* Throughput

* NoSQL Workbench for Amazon DynamoDB supported

* Advanced features:

    * Global Tables

        * Push button multiregion, multi-master setup

        * Transactions not supported across regions

        * Requires DynamoDB Streams

        * Capacity must be on-demand or auto scaled

    * DynamoDB Transactions

        * Provide atomicity, consistency, isolation and durability (ACID)

        * Transactional read and write APIs

        * No cost to enable

    * DynamoDB Accelerator (DAX)

        * Microsecond access time for eventually consistency data

        * In memory caching

* DynamoDB Security Best Practices

    * Preventative

        * Encryption at rest

        * Use IAM Roles for authentication

        * Use IAM policies for authorization and IAM policy conditions for access control

        * VPC Endpoints for access

        * Consider client side encryption

    * Detective

        * CloudTrail for key monitoring and control plane monitoring

        * DynamoDB Streams for data monitoring

        * AWS Config for config and compliance monitoring

        * Tag resources

ElastiCache

* Distributed, in-memory caches with Redis and Memcached support

* Redis: Complex data types, Backup and restore, Sorted sets, Publisher/subscriber model

* Memcached: Simplest model possible, large nodes, scale out or in, cache objects

* Deployment Options:

    * Memcached Cluster

    * Redis Single Node

    * Redis Cluster with Cluster Mode Disabled

    * Redis Cluster

* Securing ElastiCache

    * Shared security model

    * Prohibitive model

    * Avoid sharing credentials in URLs to external servers

    * Secure data: MFA, SSL/TLS, CloudTrail for API and user activity logging

    * AWS Macie

## Graph and Document Databases Solutions

Graph Databases

* Data modeling

* Components

    * Node

    * Relationship

Document Databases

* JSON framed objects

* Data access together is stored together

AWS Neptune

* Graph database solutions in AWS, Apache TinkerPop Gremlin and W3C's SPARQL supported

* Fully managed service with robust security

* Architecture

    * Primary DB Instance

    * Neptune replicas

    * Cluster volume

AWS DocumentDB

* Document database solution in AWS, MongoDB Compatible with mongo Shell and MongoDB drives supported

* Architecture

    * Clusters

    * Instances

## S3, EFS and FSx Data Storage Solutions

S3

* Object-based storage

* HTTPS protocol to interact 

* Unlimited objects (5 TB size max for single object)

Glacier

* Archival storage

* Architecture components

    * Vault

    * Archive

    * Job

    * Notification

EFS

* NFS shares for Linux clients

FSx

* NFS shares for Windows clients

    * AWS FSx for Windows File Server

    * AWS FSx for Lustre

## Designing Data Migration Solutions

Data Pipeline

* Take in data, perform processing and compute activies as needed and monitor the pipeline

Database Migration Service

* Take a database, including data and structure, and migrate to AWS Cloud

* Architecture components

    * Replication instances

    * Source and Destination Endpoints

    * Database migration tasks

* Considerations

    * Resource availability on the source, replication server and target 

    * Available network throughput

    * Type, distribution and number of objects of source data

Storage Gateway

* File Gateway: Transmitting files from on-prem to cloud, utilizing both SMB and NFS

* Volume Gateway: enable iSCSI block storage in the cloud to be consumed as volumes for on-prem

* Tape Gateway: Back up to a tape format

AWS Snowball

* Shipping container, with high-speed networking capabilities, to plugin to our network to transfer the data onto the device and go back to AWS

* Snowball Edge: a device sits at the edge of our network, with CPU and memory, GUI, CLI and SDKs, we processed data there and ship back to AWS when finish

* Snowballmobile: high-tech, massive truck goes to our data center and then back to AWS