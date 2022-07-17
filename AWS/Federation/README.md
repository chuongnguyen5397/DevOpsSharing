# DevOps Sharing

**WARNING:** The content of this repository is my **personal knowledge**

Please let me know if you find something wrongs and I will fix that
---

Federation is the creation of trust relationship between an external entity provider and AWS

* Federated User is different from an IAM User. Federated user exists in external identity provider directory and authenticates with identity provider

* We use Permission Sets to control User access. It is a collection of IAM policies.

* Federated user workflow:

    * Assign users and groups to different AWS accounts, define permission sets for each user or group

    * AWS create roles to match permission sets

    * Users can assume roles based on permission sets

AWS Single Sign-On lets us connect with Active Directory, either AWS-managed or external

* AWS SSO Directory is default identity source

* We can create users and groups in AWS SSO, then assign users and groups access to AWS accounts

* AWS SSO gives us a central location to manage all users and their permitted access.

AWS Security Token Service allows us to request temporary credentials for limited access to AWS resources without creating IAM user

* STS credentials are generated on demand, no long-term access keys

* There is an STS endpoint to interact directly and AWS SDK

* It supports AWS CloudTrail

AWS Cognito allows external users access to AWS services

* It authenticates with third party IDP like Amazon, Facebook, Google,...

* It exchange token from IDP for Cognito Token, then it can get temporary credential from STS

* It also supports unauthenticated profiles

* It can scales to millions of users

Service Control Policies defines the maximum available permissions in an account

* SCP can be used as both a cost and security control measure.

    * Reduce attack surface: Limiting what services are allowed in an account

    * Limit potential charges

* SCP can be attached to an account or OU with child account

* SCP affect all users and roles in attached account, including root user. They do not affect service-linked roles
