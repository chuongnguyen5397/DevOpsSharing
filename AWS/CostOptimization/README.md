# DevOps Sharing

**WARNING:** The content of this repository is my **personal knowledge**

Please let me know if you find something wrongs and I will fix that
---
Common mistakes:

* EC2 Instance Type: Be familiar with different instance types and make sure we are using these appropriate instance type for our compute workload

* EC2 Instance Size: The price is multiplied when we increase the size. Be sure right size instance for workload and gather metrics to determine size

    * Dedicated host is for specific use cases

* EC2 Volumes and Snapshots: Choosing the right storage for our disk performance needs can impact cost, especially if we have lot of EC2

    * It is always charged even when the EC2 instance is stopped.

    * Snapshots is also be charged, so we need a strategy to keep track of and delete volumes and snapshots.

* Zombie Instances: They are instances in our account but no one has ownership or knows what they're doing

    * Utilizing a combination of proper IAM permissions, tagging and multi-account management to avoid them

    * Setting up a clear lifecycle for resources and adding in some automated enforcement

    * Turn off or scale down some services during off-peak times. 40 vs 168 hours/week will reduce 75% our bills

* S3 Storage Class: depends on how frequently access and how fast we need to retrieve objects we need

    * In example, cost for 100TB for 1 month, it will be $2,304 for Standard, $1,280 for IA, $409 for Glacier and $101 for Glacier Deep Archive

Tools provided:

* Savings Plans

    * Similar to Reserved instances discount: into 1-3 year commitment with a full, partial or no upfront payment

    * We commit a certain compute spend per hour

    * Automatically apply to any instance family, instance size, tenancy, OS, region, Fargate and Lambda resources

* AWS Cost Explorer

    * It is a dashboard to graph, visualize and analyze our spend

    * Where we setup Savings Plans

* AWS Budgets

    * It allows us to configure custom budgets and alerts based on budget

* AWS Trusted Advisor

    * It provides cost optimization suggestions as part of a support plan

AWS Organizations Cost Benefits

* Cost visibility with single payer account

* Saving Plans and Reserved Instances apply to entire organization

* Volume discounts based on the combined usage in organization

* Simplify reports

* Control Costs by limiting services with SCPs

* Regular creation and cleanup of sandbox accounts

AWS Well-Architected Framework: Cost Optimization

* Adopt a consumption model - pay for what consume when need it

* Measure overall effciency - measure business output of system and cost to deliver it

* Stop spending money on data center operations - let AWS handle it

* Analyze and attribute expenditure - IT costs for revenue streams

* Use managed services to reduce cost of ownership - lower cost per unit

Best Practice Areas for Cost Optimization

* Expenditure awareness

    * Setting up accounts with AWS Organizations and utilizing tagging to overlay business and organizational information onto billing and usage data

    * Utilizing reports can give proper visibility to stakeholders and help them to understand the differrences between cloud and on-prem operations

    * Actively defining the lifecycle for resources and regular cleanup ensures you don't have services adding to our bill that we're not aware of.

* Cost-effective resources

    * Right-size: understand the different purchasing options for the services you are using

    * Managed services: Avoid undifferentiated heavy lifting - focus on valuep proposition

    * Optimize data transfer: By using proper geographic selection

* Matching supply and demand: 3 main strategies

    * Demand-based: Programmatically vary the amount of resources dynamically based on demand.

    * Buffer-based: Use queues or streams to smooth out the demand on consumers and handle less time-sensitive loads with fewer resources

    * Time-based: adjust resources based on predictable demand time of day

* Optimizing Over Time: 

    * Ongoing effort to measure, monitor and improve
 
        * Established goals and metrics

        * Gather insight with tools

        * Analyze data

        * Report and validate

    * Keep up on new features that affect our services and how we purchase those services

## Reserved Instances and Spots

### Reserved Instances is an agreement with AWS.

* Attributes: Instance type, Region, Tenancy, Platform

* Commitment Term: 1 or 3 years - Longer term = larger discount

* Payment: All upfront, Partial upfront, No upfront

Reserved Instances isn't tied to a specific EC2 Instance, it is automatically attached to running instances that matches the contract. And we will be charged for our reserved instances even we use them or not

Additional Options for Reserved Instances

* Scheduled: It allow us to choose a reservation that recurs on a daily basis start time and duration. It is only available for certain instance types

* Standard vs Convertible: Standard reserved instances allow us to modify instance size during the term, while convertible allow us to change to another convertible reserved instance and change things like instance family, type,...

* Regional vs Zonal

Reserved EC2 Instances can help us in 2 main ways:

* Price: Lower cost than on-demand instances

* Guaranteed Capacity:: No more errors about **InsufficientInstanceCapacity** 

AWS Services with Reservation Models:

* EC2, RDS, Redshift, ElastiCache, DynamoDB

### EC2 Spots are used EC2 machines that are available to use at a reduced cost

It can be interrupted at any time by AWS

It is best for stateless, fault-tolerant workloads

Spot Instance Use Cases: Build up large worker pools for things like

* Big data analytics

* Containerized workloads

* CI/CD pipelines

* Web services