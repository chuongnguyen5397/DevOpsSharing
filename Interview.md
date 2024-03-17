## Interview questions

DevOps:

<details>
<summary>What do you take into consideration when choosing a tool/technology?</summary><br><b>

A few ideas to think about:

  * mature/stable vs. cutting edge
  * community size
  * architecture aspects - agent vs. agentless, master vs. masterless, etc.
  * learning curve
</b></details>

<details>
<summary>Can you describe which tool or platform you chose to use in some of the following areas and how?

  * CI/CD
  * Provisioning infrastructure
  * Configuration Management
  * Monitoring & alerting
  * Logging
  * Code review
  * Code coverage
  * Issue Tracking
  * Containers and Containers Orchestration
  * Tests</summary><br><b>

This is a more practical version of the previous question where you might be asked additional specific questions on the technology you chose

  * CI/CD - Jenkins, Circle CI, Travis, Drone, Argo CD, Zuul
  * Provisioning infrastructure - Terraform, CloudFormation
  * Configuration Management - Ansible, Puppet, Chef
  * Monitoring & alerting - Prometheus, Nagios
  * Logging - Logstash, Graylog, Fluentd
  * Code review - Gerrit, Review Board
  * Code coverage - Cobertura, Clover, JaCoCo
  * Issue tracking - Jira, Bugzilla
  * Containers and Containers Orchestration - Docker, Podman, Kubernetes, Nomad
  * Tests - Robot, Serenity, Gauge
</b></details>

<details>
<summary>A team member of yours, suggests to replace the current CI/CD platform used by the organization with a new one. How would you reply?</summary><br><b>

Things to think about:

* What we gain from doing so? Are there new features in the new platform? Does the new platform deals with some of the limitations presented in the current platform?
* What this suggestion is based on? In other words, did he/she tried out the new platform? Was there extensive technical research?
* What does the switch from one platform to another will require from the organization? For example, training users who use the platform? How much time the team has to invest in such move?
</b></details>

<details>
<summary>Describe the workflow of setting up a project that you have worked before</summary><br><b>
</b></details>

CI/CD:

<details>
<summary>Can you describe an example of a CI (and/or CD) process starting the moment a developer submitted a change/PR to a repository?</summary><br><b>

There are many answers for such a question, as CI processes vary, depending on the technologies used and the type of the project to where the change was submitted.
Such processes can include one or more of the following stages:

* Compile 
* Build
* Install
* Configure
* Update
* Test

An example of one possible answer:

A developer submitted a pull request to a project. The PR (pull request) triggered two jobs (or one combined job). One job for running lint test on the change and the second job for building a package which includes the submitted change, and running multiple api/scenario tests using that package. Once all tests passed and the change was approved by a maintainer/core, it's merged/pushed to the repository. If some of the tests failed, the change will not be allowed to merged/pushed to the repository.

A complete different answer or CI process, can describe how a developer pushes code to a repository, a workflow then triggered to build a container image and push it to the registry. Once in the registry, the k8s cluster is applied with the new changes.
</b></details>

<details>
<summary>What CI/CD best practices are you familiar with? Or what do you consider as CI/CD best practice?</summary><br><b>

* Commit and test often.
* Testing/Staging environment should be a clone of production environment.
* Clean up your environments (e.g. your CI/CD pipelines may create a lot of resources. They should also take care of cleaning up everything they create)
* The CI/CD pipelines should provide the same results when executed locally or remotely
* Treat CI/CD as another application in your organization. Not as a glue code.
* On demand environments instead of pre-allocated resources for CI/CD purposes
* Stages/Steps/Tasks of pipelines should be shared between applications or microservices (don't re-invent common tasks like "cloning a project")
</b></details>

<details>
<summary>Asking about the tools candicate has experience</summary><br><b>

</b></details>

Monitoring/Logging:

<details>
<summary>Asking about the tools candicate has experience</summary><br><b>

</b></details>

IaC:

<details>
<summary>What are the advantages in using Terraform or IaC in general?</summary><br><b>

- Full automation: In the past, resource creation, modification and removal were handled manually or by using a set of tooling. With Terraform or other IaC technologies, you manage the full lifecycle in an automated fashion.<br>
- Modular and Reusable: Code that you write for certain purposes can be used and assembled in different ways. You can write code to create resources on a public cloud and it can be shared with other teams who can also use it in their account on the same (or different) cloud><br>
- Improved testing: Concepts like CI can be easily applied on IaC based projects and code snippets. This allow you to test and verify operations beforehand

</b></details>

<details>
<summary>Explain "State Locking"</summary><br><b>
  State locking is a mechanism that blocks an operations against a specific state file from multiple callers so as to avoid conflicting operations from different team members. Once the first caller's operation's lock is released the other team member may go ahead to
  carryout his own operation. Nevertheless Terraform will first check the state file to see if the desired resource already exist and
  if not it goes ahead to create it.

</b></details>

<details>
<summary>What happens if we do the plan after accidentally delete the state file? How to fix that?</summary><br><b>

</b></details>

AWS/Azure/GCP: 

<details>
<summary>What are the advantages of cloud computing? Mention at least 3 advantages</summary><br><b>

* Pay as you go: you are paying only for what you are using. No upfront payments and payment stops when resources are no longer used.
* Scalable: resources are scaled down or up based on demand
* High availability: resources and applications provide seamless experience, even when some services are down
* Disaster recovery 
</b></details>

<details>
<summary>Ask questions about specific clouds' services that candicate has experience with</summary><br><b>

</b></details>

Docker/Kubernetes: 

<details>
<summary>In which scenarios would you use containers and in which you would prefer to use VMs?</summary><br><b>

You should choose VMs when:
  * You need run an application which requires all the resources and functionalities of an OS
  * You need full isolation and security

You should choose containers when:
  * You need a lightweight solution
  * Running multiple versions or instances of a single application
</b></details>

<details>
<summary>What happens if we want to start httpd service inside our image? Can we write "RUN service httpd start?" </summary><br><b>

You can write RUN service httpd start in a Dockerfile, but it will not work. This is because the RUN instruction is used to execute commands during the build process, not when the container is started.

We can use ENTRYPOINT

FROM centos:latest

RUN yum install -y httpd

EXPOSE 80

ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
</b></details>

<details>
<summary>When or why NOT to use Kubernetes?</summary><br><b>

  - If you manage low level infrastructure or baremetals, Kubernetes is probably not what you need or want
  - If you are a small team (like less than 20 engineers) running less than a dozen of containers, Kubernetes might be an overkill (even if you need scale, rolling out updates, etc.). You might still enjoy the benefits of using managed Kubernetes, but you definitely want to think about it carefully before making a decision on whether to adopt it.

</b></details>

<details>
<summary>What are some of Kubernetes features that you used before?</summary><br><b>

  - Self-Healing: Kubernetes uses health checks to monitor containers and run certain actions upon failure or other type of events, like restarting the container
  - Load Balancing: Kubernetes can split and/or balance requests to applications running in the cluster, based on the state of the Pods running the application
  - Operators: Kubernetes packaged applications that can use the API of the cluster to update its state and trigger actions based on events and application state changes
  - Automated Rollout: Gradual updates roll out to applications and support in roll back in case anything goes wrong
  - Scaling: Scaling horizontally (down and up) based on different state parameters and custom defined criteria
  - Secrets: you have a mechanism for storing user names, passwords and service endpoints in a private way, where not everyone using the cluster are able to view it

</b></details>

<details>
<summary>What do you do if I want a specific node for specific team, like GPU node for ML/AI app?</summary><br><b>

  * Use Taint

</b></details>

<details>
<summary>What rollout/deployment strategies are you familiar with?</summary><br><b>

* Blue/Green Deployments: You deploy a new version of your app, while old version still running, and you start redirecting traffic to the new version of the app
* Canary Deployments: You deploy a new version of your app and start redirecting **portion** of your users/traffic to the new version. So you the migration to the new version is much more gradual
</b></details>

<details>
<summary>Explain Blue/Green deployments/rollouts in detail</summary><br><b>

Blue/Green deployment steps:

1. Traffic coming from users through a load balancer to the application which is currently version 1

Users -> Load Balancer -> App Version 1

2. A new application version 2 is deployed (while version 1 still running)

Users -> Load Balancer -> App Version 1
                          App Version 2

3. If version 2 runs properly, traffic switched to it instead of version 1

User -> Load Balancer     App version 1
                       -> App Version 2

4. Whether old version is removed or keep running but without users being redirected to it, is based on team or company decision

Pros:
  * We can rollback/switch quickly to previous version at any point
Cons:
  * In case of an issue with new version, ALL users are affected (instead of small portion/percentage)
</b></details>


## Interview questions for 1st round

CI/CD

* Basic

<details>
<summary>What is continuous integration (CI)? What is continuous delivery (CD)? </summary><br><b>
Continuous integration (CI) is the practice of automating the process of merging all code changes into a central repository, after each change is made. Continuous delivery (CD) is the practice of releasing code changes to production as quickly and safely as possible.

</b></details>

<details>
<summary>What are the benefits of implementing CI/CD? </summary><br><b>
The benefits of implementing CI/CD include faster software releases, improved quality, and reduced risk.

</b></details>

* Intermediate

<details>
<summary>Describe the mandatory stages of a CI/CD pipeline </summary><br><b>
The mandatory stages of a CI/CD pipeline typically include: code checkout, build, deployment.

</b></details>

<details>
<summary>How do you handle build failures in a CI/CD pipeline? </summary><br><b>
Build failures in a CI/CD pipeline can be handled by: notifying the development team, rolling back to the previous working version, and fixing the build issue.

</b></details>

<details>
<summary>What are some of the best practices for securing a CI/CD pipeline? </summary><br><b>
Some of the best practices for securing a CI/CD pipeline include: using access control lists, encrypting sensitive data, and regularly scanning for vulnerabilities.

</b></details>

<details>
<summary>How do you monitor the performance of a CI/CD pipeline? </summary><br><b>
The performance of a CI/CD pipeline can be monitored by tracking metrics such as build time, deployment time, and failure rate.

</b></details>

* Advanced

<details>
<summary>How do you implement canary deployments in a CI/CD pipeline? </summary><br><b>
Canary deployments are a way of releasing new code to a small subset of users before releasing it to the entire production environment. This allows for early detection of problems and can help to reduce downtime.

</b></details>

<details>
<summary>Explain the concept of "blue-green deployments" and how they differ from canary deployments. </summary><br><b>
Blue-green deployments involve creating two identical production environments, one running the current version of the code (blue) and the other running the new version of the code (green). Once the green environment is ready, the traffic is switched to it, and the blue environment is decommissioned. This approach minimizes downtime and risk compared to canary deployments, where new code is introduced gradually to a subset of users.

</b></details>

AWS:

* Basic

<details>
<summary>Explain how you would set up an AWS infrastructure for a web application that needs to handle variable traffic loads. Include aspects like load balancing, autoscaling, and high availability. </summary><br><b>

Setting up an AWS infrastructure for a web application with variable traffic loads requires careful consideration of scalability, load balancing, and high availability.

- Scalability: Utilize autoscaling groups to automatically adjust the number of EC2 instances based on traffic demands.

- Load Balancing: Implement Elastic Load Balancing to distribute incoming traffic across multiple EC2 instances, preventing overload.

- High Availability: Employ multiple Availability Zones, database replication, and failover mechanisms to ensure continuous application uptime.

</b></details>

<details>
<summary>Discuss the different storage options available on AWS, such as S3 (Simple Storage Service), EBS (Elastic Block Store), and Glacier, and how you would choose the appropriate storage solution for different use cases. </summary><br><b>

Choosing the appropriate storage solution on AWS depends on the data access patterns and storage requirements of the application.

S3 (Simple Storage Service): Ideal for storing large amounts of unstructured data, such as images, videos, and documents.

EBS (Elastic Block Store): Provides block-level storage for EC2 instances, suitable for primary storage of applications.

Glacier: Offers low-cost, archival storage for infrequently accessed data with long-term retention requirements.

Consider factors like data access frequency, performance needs, and cost when selecting the appropriate storage solution.

</b></details>

* Intermediate

<details>
<summary>Explain how you would configure and manage network security in an AWS environment using VPCs (Virtual Private Clouds), security groups, and network ACLs (Network Access Control Lists).</summary><br><b>

Configuring and managing network security in an AWS environment involves using VPCs, security groups, and network ACLs to control network traffic.

VPCs: Create isolated network environments called VPCs to separate workloads and resources.

Security Groups: Associate security groups with EC2 instances to control incoming and outgoing traffic based on IP addresses and ports.

Network ACLs: Implement network ACLs at the VPC level to filter traffic between subnets within a VPC.
</b></details>

<details>
<summary>Discuss strategies for monitoring and logging your AWS infrastructure and applications using services like CloudWatch and CloudTrail Logs. </summary><br><b>

- CloudWatch:

Utilize CloudWatch to monitor key metrics of your AWS resources, such as CPU utilization, memory usage, and network traffic. Set alarms to notify you of potential issues or deviations from expected performance levels.

Employ CloudWatch Logs to collect and centralize logs from various sources, including EC2 instances, Lambda functions, and API Gateway endpoints. Analyze logs to identify errors, troubleshoot problems, and track application usage patterns.

- CloudTrail Logs:

Utilize CloudTrail Logs to collect and centralize logs from CloudTrail events. These logs provide detailed information about API calls made to your AWS account, including user IDs, timestamps, request parameters, and response data.

Analyze CloudTrail Logs to gain insights into user activity, identify potential security risks, and comply with auditing and compliance requirements.

</b></details>

<details>
<summary>Explain how you would approach cost optimization in an AWS environment, including identifying cost-saving opportunities and using tools like AWS Cost Explorer and AWS Budgets.</summary><br><b>

Optimizing cloud costs is essential for maximizing the value of your AWS investment. Implement these strategies to identify and reduce unnecessary expenses:

- Identifying Cost-Saving Opportunities:

Analyze AWS Cost Explorer to identify the cost breakdown of your AWS resources and services. This helps you understand where your costs are concentrated and pinpoint areas for potential savings.

Review your EC2 instance usage patterns and identify underutilized or idle instances. Terminate or resize these instances to reduce compute costs.

Evaluate your S3 storage usage and consider migrating infrequently accessed data to Glacier for lower storage costs.

- Using Tools for Cost Optimization:

Leverage AWS Budgets to set spending limits and receive alerts when your costs approach or exceed predefined thresholds. This helps you stay within budget and avoid unexpected overspending.

Utilize AWS Cost and Usage Reports (CUR) to generate detailed reports on your AWS usage and costs. These reports can be analyzed using third-party tools or custom scripts to identify cost optimization opportunities.

Employ AWS Trusted Advisor to receive personalized recommendations for improving cost efficiency, security, and reliability of your AWS environment.

</b></details>

* Advanced

<details>
<summary>Explain how you would design and implement a highly available and fault-tolerant architecture for a mission-critical application on AWS. </summary><br><b>

Ensuring high availability and fault tolerance for mission-critical applications is crucial for business continuity and minimizing downtime. Follow these principles to design and implement a robust architecture on AWS:

- Utilize Multiple Availability Zones (AZs):

Distribute your application components across multiple AZs, which are physically separate data centers within a single AWS Region. This ensures that if one AZ experiences an outage, the application remains available in other AZs.

Employ load balancers like Amazon Elastic Load Balancing (ELB) to distribute incoming traffic across multiple instances in different AZs. This ensures optimal performance and responsiveness during peak traffic periods.

- Implement Autoscaling:

Utilize autoscaling groups to automatically add or remove EC2 instances based on real-time traffic patterns. This ensures that you have the necessary resources to handle spikes in demand and avoid performance bottlenecks.

Configure autoscaling policies based on metrics like CPU utilization, memory usage, or application response times. This ensures that your infrastructure scales up or down dynamically to meet changing demands.

- Employ Data Replication:

Implement data replication mechanisms like Amazon DynamoDB Global Tables or Amazon Aurora Multi-Master to ensure data redundancy and consistency across multiple AZs. This protects against data loss or corruption in case of an AZ outage.

Utilize services like Amazon S3 for storing application data. S3 provides high durability and availability, ensuring that your data remains accessible even if one AZ becomes unavailable.

- Implement Fault Tolerance:

Design your application to be fault-tolerant, handling failures gracefully and recovering quickly. Implement retry logic, error handling mechanisms, and circuit breakers to prevent cascading failures.

Utilize services like Amazon Simple Notification Service (SNS) to receive alerts about application errors or infrastructure issues. This allows you to proactively address problems and minimize downtime.

- Thorough Testing and Monitoring:

Conduct rigorous testing to ensure your application functions as expected in a highly available and fault-tolerant environment. Simulate various failure scenarios and verify that the application recovers gracefully.

Continuously monitor application performance, resource utilization, and error logs. Use services like CloudWatch to set alarms and receive notifications in case of performance deviations or potential issues.

</b></details>

<details>
<summary>Discuss strategies for disaster recovery and business continuity planning in an AWS environment. </summary><br><b>

Disaster recovery and business continuity planning are essential for mitigating the impact of large-scale disruptions, such as natural disasters or cyberattacks. Implement these strategies to safeguard your AWS environment and ensure business continuity:

- Establish a Disaster Recovery Plan:

Create a comprehensive disaster recovery plan that outlines the steps to be taken in the event of a major outage or disaster. Define roles and responsibilities, communication protocols, and recovery procedures.

Regularly review and update your disaster recovery plan to ensure it aligns with the evolving needs of your business and applications. Conduct regular disaster recovery drills to test its effectiveness.

- Utilize AWS Disaster Recovery Services:

Leverage AWS services like AWS Disaster Recovery (DR) to replicate your AWS resources and data to different AWS Regions. This ensures that you have a secondary environment ready to failover to in case of a regional outage.

Employ AWS Backup to create and maintain backups of your critical data, ensuring that you can restore it in case of data loss or corruption. Utilize services like AWS Glacier for long-term data archiving and disaster recovery purposes.

- Implement Change Management Practices:

Establish strict change management practices to minimize the risk of introducing errors or disruptions during infrastructure or application changes. Employ tools like AWS Change Manager to automate change approvals and rollbacks.

Conduct thorough testing and validation of changes before deploying them to production environments. Implement rollback procedures to revert to a stable state in case of unexpected issues.

- Regular Monitoring and Security Audits:

Continuously monitor your AWS environment for security threats, performance issues, and potential outages. Utilize services like CloudWatch, CloudTrail, and CloudTrail Logs to gain insights into your environment.

Conduct regular security audits to identify and address vulnerabilities in your infrastructure, applications, and data. Employ security best practices and follow industry standards for secure cloud deployments.

</b></details>

Kubernetes

<details>
<summary>When or why NOT to use Kubernetes?</summary><br><b>

  - If you manage low level infrastructure or baremetals, Kubernetes is probably not what you need or want
  - If you are a small team (like less than 20 engineers) running less than a dozen of containers, Kubernetes might be an overkill (even if you need scale, rolling out updates, etc.). You might still enjoy the benefits of using managed Kubernetes, but you definitely want to think about it carefully before making a decision on whether to adopt it.

</b></details>

<details>
<summary>Explain liveness probes</summary><br><b>

Liveness probes is a useful mechanism used for restarting the container when a certain check/probe, the user has defined, fails.<br>
For example, the user can define that the command `cat /app/status` will run every X seconds and the moment this command fails, the container will be restarted.

Readiness probes used by Kubelet to know when a container is ready to start running, accepting traffic.<br>
For example, a readiness probe can be to connect port 8080 on a container. Once Kubelet manages to connect it, the Pod is marked as ready

You can read more about it in [kubernetes.io](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes)
</b></details>

<details>
<summary>Provide some actual examples of how labels are used</summary><br><b>

[Kubernetes.io](https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/): "Labels are key/value pairs that are attached to objects, such as pods. Labels are intended to be used to specify identifying attributes of objects that are meaningful and relevant to users, but do not directly imply semantics to the core system. Labels can be used to organize and to select subsets of objects. Labels can be attached to objects at creation time and subsequently added and modified at any time. Each object can have a set of key/value labels defined. Each Key must be unique for a given object."

* Can be used by the scheduler to place certain Pods (with certain labels) on specific nodes
* Used by replicasets to track pods which have to be scaled

</b></details>

<details>
<summary>There are two containers inside a Pod called "some-pod". What will happen if you run <code>kubectl -f logs some-pod</code></summary><br><b>

It won't work because there are two containers inside the Pod and you need to specify one of them with `kubectl logs POD_NAME -c CONTAINER_NAME`
</b></details>

<details>
<summary>What Service types are there? What is the default Service type</summary><br><b>

* ClusterIP (Default)
* NodePort
* LoadBalancer
* ExternalName

More on this topic [here](https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types)
</b></details>

Terraform

<details>
<summary>Demonstrate how to define locals</summary><br><b>

```
locals {
  x = 2
  y = "o"
  z = 2.2
}
```
</b></details>

<details>
<summary>Demonstrate how to use a local</summary><br><b>

if we defined something like this

```
locals {
  x = 2
}
```

then to use it, you have to use something like this: `local.x`
</b></details>

### Data Sources

<details>
<summary>Explain data sources in Terraform</summary><br><b>

* Data sources used to get data from providers or in general from external resources to Terraform (e.g. public clouds like AWS, GCP, Azure).
* Data sources used for reading. They are not modifying or creating anything
* Many providers expose multiple data sources

</b></details>

<details>
<summary>Demonstrate how to use data sources</summary><br><b>

```
data "aws_vpc" "default {
  default = true
}
```

</b></details>

<details>
<summary>How to get data out of a data source?</summary><br><b>

The general syntax is `data.<PROVIDER_AND_TYPE>.<NAME>.<ATTRIBUTE>`

So if you defined the following data source

```
data "aws_vpc" "default {
  default = true
}
```

You can retrieve the ID attribute this way: `data.aws_vpc.default.id` 
</b></details>

<details>
<summary>Explain "Remote State". When would you use it and how?</summary><br><b>
  Terraform generates a `terraform.tfstate` json file that describes components/service provisioned on the specified provider. Remote
  State stores this file in a remote storage media to enable collaboration amongst team.

</b></details>

<details>
<summary>Explain "State Locking"</summary><br><b>
  State locking is a mechanism that blocks an operations against a specific state file from multiple callers so as to avoid conflicting operations from different team members. Once the first caller's operation's lock is released the other team member may go ahead to
  carryout his own operation. Nevertheless Terraform will first check the state file to see if the desired resource already exist and
  if not it goes ahead to create it.

</b></details>

<details>
<summary>What structure layout do you use for your projects?</summary><br><b>

There is no right or wrong answer, just what you personally adopted or your team, and being able to explain why.

One common approach is to have a separate directory for each environment.

```
terraform_project/
  staging/
  production/
```

Each environment has its own backend (as you don't want to use the same authentication and access controls for all environments)

Going further, under each environment you'll separate between comoponents, applications and services


```
terraform_project/
  staging/
    applications/
      some-app-service-1/
      some-app-service-2/
    databases/
      mongo/
      postgres/
    networking/
```
</b></details>

<details>
<summary>What files do you have you have in your Terraform projects?</summary><br><b>

Again, no right or wrong answer. Just your personal experience.

main.tf
providers.tf
outputs.tf
variables.tf
dependencies.tf

Each one of these files can be divided to smaller parts if needed (no reason to maintain VERY long files)

</b></details>

Monitoring

<details>
<summary>Ask about candidates' experience in 3 fields: </summary><br><b>

Monitoring: Prometheus - Grafana,...

Logging: Loki - Grafana, ELK, EFK, Splunk,...

Advanced monitoring: Tracing, APM, Alerts,...

</b></details>