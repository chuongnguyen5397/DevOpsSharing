# DevOps Sharing

**WARNING:** The content of this repository is my **personal knowledge**

Please let me know if you find something wrongs and I will fix that
---
## Designing Stateless Architectures for Resilience

| Stateless |     | Stateful |
| :---:   | :---: | :---: |
| Do NOT store data |    | Data is stored   |
| Applications service one purpose |    | Stored data state is critical   |
| Requests can be handled by many different services |    | State is tracked meticulously   |
| Allow for quick deployments and recovery |    | The state needs to be shared or the ame server needs to handle related requests   |

AWS Lambda

* Compute service that runs code without managing servers

* On-demand invocations and scaling is automatically handled

* Only pay for what you actually use

* Code is ran on highly-available infrastructure

* Execute code is based on incoming events

## Implementing auto-scaling solutions

Auto scaling and multi-AZ systems

* Auto scaling groups allow us to automatically scale our groups of instances to meet the workload, both in and out

* Launch Configuration and Launch Templates

       * Launch templates (LTs) are newer than launch configurations (LCs) and provide more options to work with, according to [AWS docs](https://docs.aws.amazon.com/autoscaling/ec2/userguide/launch-templates.html). 

Load balancers (ALB, NLB)

VPC considerations

## Using CloudFront and Route53

CloudFront: A global CDN offered by AWS for delivering content faster via regional edge locations

* Signed URLs

* DDoS

Route53

* Routing policies

* Health checks