# DevOps Sharing

**WARNING:** The content of this repository is my **personal knowledge**

Please let me know if you find something wrongs and I will fix that
---
## Fundamentals of EC2

EC2 instance types

* General Purpose: Similar CPU, RAM, network

* Compute Optimized: Higher CPU performance for high-performance processors like scientific modelling, ad serving, video encoding,...

* Memory Optimized: Fast performance for workloads that process large data sets in memory such as high-performance database, distributed in-memory caches and real-time big data analytics

* Accelerated Computing: Hardware accelerators like GPUs and FPGAs. Suited for machine and deep learning, advanced analytics, server-side graphics workloads and genomics 

* Storage Optimized: High I/O to very large local data sets. NoSQL databases, in-memory databases, data warehousing, distributed file systems and log processing

Storage options and features:

* EBS: SSD-based volume (General purpose, Provisioned IOPs) or HDD-base volume (Throughput optimized, Cold HDD)

* EFS: Managed NFS file system

    * Throughput: Bursting vs Provision

    * I/O: General purpose vs Max I/O

* Instance Store: Temporary, ephemeral block-level storage physically attached to host computer

EC2 Price

* Payment type: On-demand, Savings plans (commitment to per-hour spend), reserved instances (commitment to resources), spot instances (very low rate, interruptible), dedicated hosts (single tenancy)

* Instance type & size: Resources = cost

* Storage: EBS, EFS, Instance store. Charged until delete it

* Network traffic: Inbound, intra-region, outbound data

## AMIs and EBS Snapshots

AMI: Amazon Machine AMI 

* AMI provides information required to launch instance.

* It includes permissions who can use AMIs, the installed OS, software, configurations and data

* AMI saves us from doing setup every time for multiple instances with same config -> easier automation and setup

* AMI will have one or more EBS snapshots or root volume template and block device mapping

* Where to get AMIs: AWS provided, AWS Marketplace or our own AMIs.

    * Some AMIs have an additional cost to use

EBS Snapshot Use cases

* Create AMI from EBS backed instance or any EBS snapshot

* Incremental backup

* Sharing data

* Encryption

## Placement Groups and Instance Profiles

Placement Groups: Allow us to specify diffrent placement strategies to control how instances are allocated to underlying resources without additional charge

* Cluster strategy

    * Place instances close together in singe AZ -> Low latency, high throughput

    * Only certain instance types, best with enhanced networking

    * Recommmened to use same instance type for group and best is using a single launch request to launch the number of instances we need

    * May experience insufficient capacity error when we try to add addiontinal instances or mix instance type

* Partition strategy

    * Define groups call partitions so when we launch an instance, we have to specify which partition it belongs to

    * We can have multiple instances in the same partition, and a partition placement group can have paritions in multiple AZs in the same region

    * Each partition has its own set of racks with each racks has independent network and power sources

    * Work well with large distributed, replicated workloads like HDFS, HBase, Cassandra,... or any topology aware applications

* Spread strategy

    * Individual instances in distinct racks with independent netowrk and power sources

    * Recommended for applications that have a small number of critical instances

Instance Profiles

* Instance profile allows EC2 instance to assume role on startup without storing credentials

## Beanstalk

Allow more time for developing code rather than managing infrastructure

Allow push button deployments for an application

* Provide code and options

* EB provisions infrastructure to run, load balance, auto scale, monitor the application

* Uses EC2, S3, SNS, ELB, Auto scaling

* No additional charge - we only pay for what we use

## Serverless Applications with Lambda

What is serverless application?

* No server management

* Flexible scaling

* High availability

* No idle capacity

## Containers on AWS

Single Container Applications: EC2 instance or Elastic Beanstalk

Multicontainer Orchestration: How container is launched, Resources required, How many running containers, Machine placement, Container dependencies, Underlying infrastructure management

Elastic Container Registry: Fully managed Docker container registry

Elastic Container Service

Elastic Kubernetes Service