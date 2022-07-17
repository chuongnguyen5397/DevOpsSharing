# DevOps Sharing

**WARNING:** The content of this repository is my **personal knowledge**

Please let me know if you find something wrongs and I will fix that

---

## AWS Identities

IAM User: Person or application with access to resources in AWS account

Existing Users: Federated from directory or identity providers like Amazon, Facebook, Google,... (Cognito)

## Policies for Permission

Components: 

* Principal: Entity that is allowed or denied access

* Action: Type of access that is allowed or denied

* Resoure: Amazon resource the action will act on

* Condition: Defines the conditions under which the access defined is valid

AWS starts with deny for all actions by default

Allow must be present and no specific deny

Everything in request must match up a policy in order to be allowed

## Service-linked Role

A special role that can only be assumed by an AWS service. 

It gives the service permission to call other AWS services