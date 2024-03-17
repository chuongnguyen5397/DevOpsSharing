# DevOps Sharing

**WARNING:** The content of this repository is my **personal knowledge**

Please let me know if you find something wrongs and I will fix that

---

## AWS to Azure services comparison

https://learn.microsoft.com/en-us/azure/architecture/aws-professional/services

## Azure Regions

https://infrastructuremap.microsoft.com/

## Azure Services

### Resource Group

Container to hold related resources

Manage the lifecycle of resources in resource group

### Azure Virtual Network

Define own network in Azure

Virtual Machines are hosted in the Virtual Network

Consist of multiple subnets

### Azure Virtual Machine

Infrastructure as a service

Gets deployed to a Virtual Network

Gets assigned a Network Interface, which gets assigned a private IP or public IP if need

Can have multiple disks

Virtual Machine Scale Sets

* Allow to scale in or out for infrastructure based on demand

* Can be used for Azure Web Apps as well

### Azure Marketplace

One-stop shop for deploying custom-based cloud software

### Network Security Groups

Used to control traffic into subnet or Virtual Machine

Consists of rules for inbound and outbound traffic, within Virtual Network is automatically allowed, need to explicitly allow traffic from the Internet

Rules:

* Each rule has a source and destination. This can be either an IP address, CIDR block, service tag or application security group

* Can define the port numbers, protocol and action

### Azure Load Balancer

A load balancer that works at Layer 4

Provide high availability for applications, allow to distribute traffic to backend Virtual Machines

Fully managed service

Type: 

* Internal Load Balancer: Only balance traffic from within Virtual Network

* Public Load Balancer: Be used to load balance internet traffic to Virtual Machines

Pricing Tiers:

* Basic: Target is a Virtual Machine, an availability set or a scale set

* Standard: Multiple Virtual Machines

Health Probe: This is used to check whether a backend virtual machine is healthy or not

* Protocol

* Port Number

* Interval

Load balancing rules: Defines how to route traffic when it arrives on the load balancer

Session Persistence: Enable sticky session

### Azure Application Gateway

A load balancer that works at Layer 7, can add Web Application Firewall as a feature

Fully managed service

URL based routing

### Azure Storage Account

Cloud service that provides secure storage for application and services

Azure Storage Account types:

* Standard general-purpose v2

* Premium block blobs

* Premium file shares

* Premium page blobs

### Azure Storage Services

Data types:

* Blobs-format

* Files-SMB protocol

* Queues-messages

* Tasks

* Tables-Nosql

### Azure Web App

Platform as a service: Service for hosting web applications