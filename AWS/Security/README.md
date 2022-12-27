# DevOps Sharing

**WARNING:** The content of this repository is my **personal knowledge**

Please let me know if you find something wrongs and I will fix that
---

## Locking down accounts and users

Securing root user

* Tasks that require root user credentials: https://docs.aws.amazon.com/accounts/latest/reference/root-user-tasks.html

* Lock down root user

    * Instead of using root user for administrative tasks, create an IAM user that has administrative privileges. Create IAM Groups to assign permissions and users to groups

    * Delete root access keys

    * Activate MFA on root account

    * Strong, random generated password

* Limit root with SCPs: Only in AWS Organizations and service control policies enabled

    * Actions not listed in SCP are implicitly denied

    * Lock down root user in member accounts

    * Set guardrails with SCP

Securing access to accounts: IAM Users, Roles, Permissions boundary

* IAM Users

    * Password Policy / MFA

    * Manage Access Keys

    * Least privilege

* IAM Roles

    * Only have permissions granted by role

    * Cross-account access

    * Allow single IAM user access to multiple AWS accounts

    * Allow third-party access to account

    * Require ExternalID to assume role

Sandbox accounts in AWS Organization

## Managing keys and certificates

AWS KMS

* Encryption key requirements: properly formed and unique, Secure and controlled access, available with minimize wait time, durable and compliance

* KMS is managed, regional, multi-tenant service providing centralized control over the lifecycle and permissions of encryption keys

* KMS use Hardware Security Modules (HSM) to generate and store keys

* We can control access to keys, automation rotation. 

* Dynamically scales and 99,999999999% durability

CloudHSM

* Single tenant HSM - direct interaction

* Runs in our own VPC and pay per hour per device

* AWS manages hardware provisioning, patching and backup

* Use cases:

    * Custom key store: Use KMS service with keys on HSM

    * SSL acceleration: Offloading some of the SSL and TLS computation and securing servers' private key in HSM

    * Certificate authority: protect private key and perform signing

    * CloudHSM client

    * Software libraries

AWS ACM

* Centrally manage, provision and deploy SSL/TLS certificates and their renewal process

* Integrated with AWS services with free public certificates

* ACM private certificate authority is a highly available, managed private certificate authority service that manage the lifecycle of our private certificates

## Firewall protection

WAF

* Protect web application from common web exploits with no upfront cost: pay based on number of rules and requests received

* Filter traffic with rules based on request

* We can use managed rules for common threats which are automatically updated

* Works with CloudFront, ALB, API Gateway

* Filtering in WAF:

    * IP address or country

    * Values in request (HTTP headers and body, URI strings, length)

    * SQL Code - SQL injection

    * Scripts - cross-site scripting

* Rule actions:

    * Allow

    * Block

    * Count

AWS Firewall Manager

* Centrally configure and manage WAF rules across multiple accounts and resources

Shield

* Mangaged DDoS protection with standard and advanced

* Standard

    * Included with WAF

    * Defends most common DDoS attacks

* Advanced 

    * Available with subscription

    * Additional protection and analytics

    * 24/7 DDoS response team

GuardDuty

* Intelligent threat detection and continuous monitoring across data sources: CloudTrail, VPC Flow Logs, DNS Logs

* Uses machine learning to establish a baseline for normal account activity and assigns threats a category and severity

    * Reconnaissance: Unsual API activity, port scanning, failed login, port probing

    * Instance compromise: Cryptocurrency mining, backdoor activity, data exfiltration using DNS

    * Account compromise: Attemps to disable CloudTrail, unsual deployment, API calls from known bad IPs

* Can integrate with other services for automatic remediation and prevention

* Free trial, pay based on data volume

## Threat detection