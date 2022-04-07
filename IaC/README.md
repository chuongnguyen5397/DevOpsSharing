# DevOps Sharing

**WARNING:** The content of this repository is my **personal knowledge**

Please let me know if you find something wrongs and I will fix that

---

**Infrastructure as Code (IaC)** is provisioning infrastructure through software to achieve consistent and predictable environments. 

Core concepts:

* Defined in code: Using software and coding to define infrastructure

* Stored in SCM: Using SCM to store repositories of code, its versions and multiple developers can work on it.

* Declarative or imperative:

|`Declarative`|`Imperative`|
|-|-|
|Define the result after running infrastructure code and let software do the rest|Define exact each steps to build infrastructure|
|Easy to install and run simple tasks|Handling extremely complex tasks better|

* Idempotent and consistent: After create resources, we will have state of what we are having right now. If you don’t change anything in the source code and use an idempotent tool to apply, It won’t change anything. Terraform is idempotent tool. 

* Push or pull: Style of deployment 

|`Push`|`pull`|
|-|-|
| Pushing configuration to the target environment|Agents in target environment pull its configuration from central source|

**Benefits:**

* Automated deployment

* Repeatable process

* Multiple consistent environments

* Reusable components

* Documented architecture