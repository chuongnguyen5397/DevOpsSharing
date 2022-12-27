# DevOps Sharing

**WARNING:** The content of this repository is my **personal knowledge**

Please let me know if you find something wrongs and I will fix that
---
## VPC Fundamentals

VPC Overview:

VPC is a logical construct that overlays all of the availability zones. One VPC can have multiple subnets spreading in multiple AZs

* Core Components:

    * Subnets
    
        * The traffic goes between 2 subnets which are in the same AZ is considered intrazone traffic

        * The traffic goes between 2 subnets which are not in the same AZ is considered interzone traffic, and we will get charged for that

    * Route tables

    * Endpoints

    * Gateways: NAT gateways, Internet Gateways, Endpoint Gateways,...

    * Security Groups

    * Network ACLs 

IP Addressing

* One of the most important components in VPC designing. 

* VPC IP address range is /16 to /28

* RFC 1919 preferred: 10.0.0.0/8, 192.168.0.0/16, 172.16.0.0/12

* Five reserved subnet addresses

    * +0: network address

    * +1: VPC router

    * +2: DNS server

    * +3: Reserved

    * +last: broadcast address - AWS doesn't allow us to use broadcast traffic

* Subnets cannot overlap, cannot be altered but can be added. AWS only allow additional CIDR ranges within the same family.

* IPv6 is dual-stack with IPv4 inside VPC. It means every single IPv6 address will have an IPv4 address assigned to it.

    * No public/private IP addresses, No Elastic IPv6 Addresses, No AWS provided DNS hostnames

    * DHCPv6 required on instance and not for S2S VPN, Customer Gateway, NAT or VPC Endpoints

DHCP & DNS

* DHCP is controlled through DHCP option sets and can not bring our own DHCP server to the VPC. 

    * DHCP option sets have those settings: domain-name-servers, domain-name, ntp-servers, netbios-name-servers, netbios-node-type

    * 2 options for DNS: Amazon-hosted and provided services or our own

        * Amazon-provided DNS is less flexible. For external hostname resolution, we can setup Route 53 external zone and Privated hosted zone

            * It has a number of DNS attributes: enableDnsHostnames (for public hostname resolution), enableDnsSupport (for internal hostname resolution)

            * Custom VPC has enableDnsSupport = true and enableDnsHostnames = false

        * Private DNS servers: We can setup inside VPC and it can use any public DNS service

Elastic Network Interfaces

* ENIs are how everything connects into the VPC.

    * ENIs are subnet based: It means that one ENI can not spin more than one subnet, but it can have multiple private IPv4/IPv6 address

    * There is a restriction of one EIP address per private IPv4 cause it's doing a NAT behind

    * One public IPv4 address per ENI

    * ENIs are used by both instances and gateways

    * Performance based on instance type

* EC2 Networking

    * EC2 instances always have an ENI called primary ENI, naming eth0 and cannot be removed unless terminate the instance

    * Secondary ENIs can be attached, generally in different subnet

    * All instance ENIs must be in the same AZ

Network Performance

* Based on instance size, current maximum is 100Gbps

* EBS-Optimized dedicated storage bandwidth: Storage is also using network for storage I/O between instances and EBS, so using this type can prevent that

* 2 levels of network performance: baseline (standard and minimum amount of performance) and burstable (amount of performance can burst up to but won't be sustained)

* Advanced features are available:

    * Enhanced networking adapters: There are Amazon-provided Enhanced Networking Adapter (ENA) and Intel-based ENA.  

    * Network MTU: Jumbo frames - increase packet sizes, maximum MTU is 9001

    * Placement Groups: A way to organize our instances within an AZ or cross multiple AZ. There's 3 different kinds:

        * Cluster: All instances in the same placement group are in the same rack in a Data Center inside an AZ. Note: if something happens to that rack, all of the nodes in that cluster go down

        * Partition: Instances are seperated into multiple partition located in different racks

        * Spread: Each instance in spread placement group is in different rack

## Advanced VPC Configuration

Routing

* Route Tables: A collection of routing rules that a subnet can use to figure out how to move traffic arount and out of the VPC. 

* There can be 1 main route table (Get created when initially create VPC) and 1 or more custom route tables with 3 types (Subnet, Gateway, Local gateway)

    * There is only one route table per subnet, but one route table can be associated with multiple subnets

    * Each subnet has a router at +1 address, where traffic will go to egress from that subnet into the larger VPC

    * Main and custom tables:

        * Implicit or explicit association: subnets that are not explicitly associated with another route table will be implicitly associated with that main route table

        * Main designation can be changed and can leave empty except local route

        * Custom route tables only use explicit association

* Routes: are composed of a those things: 

    * Destination: a particular IP address or a range of IP addresses
    
    * Target: the target for the next hop of traffics if the packet matches its destination or range of destinations.

        * Potential targets: Internet Gateway, Egress only internet gateway, NAT gateway, Outpost local gateway, Transit gateway, Virtual private gateway, instance, Network interface, peering connection

    * IPv4 & IPv6: We can have both in a single route, but both types are supported within a route table

    * Route priority: the more specific route will get the traffic when multiple routes match the traffic

* Local Route

    * Automatically added when we first create route table and it is for all of the CIDR ranges within our VPC, both IPv4 and IPv6 
    
    * It can not be removed and we can not have more specific routes than this route

* Ingress Routing

    * Gateway route table, attach to IGW or VPG. Destination is local or network interface. This network interface could be a virtual network compliance doing traffic inspection or firewall

    * Egress Routing is separate 

Gateways

* Internet Gateway: Attaches to VPC. Public IP addresses and Elastic IP addresses are NAT performed by IGW to the private IP address

* Egress-only Internet Gateway: Session-aware. It only allows traffic to go outside VPC from public resources

* NAT Gateway: It is HA per zone.

    * Bandwidth up to 45Gbps and is not scalable

    * Managed by AWS

    * Port forwarding, Security Group and Bastion are not supported

Public and private subnets

* It depends on the route table: If subnets' route table has a route to let traffic go through Internet, it will be called public subnet.

Private DNS:

* Amazon Provided DNS

* Private hosted zones: It uses Route 53 for their entries and enables us to use a custom domain for VPC

    * It supports the use of multiple VPCs all using the same private hosted zones

    * Cross Account is supported but only in CLI, SDK,...

    * Enable DNS Support and Hostnames in VPC

* Private DNS Servers

    * Need to set enableDnsSupport to false

    * Configure DNS Servers in DHCP Options

## Securing and monitoring VPCs

Security groups

* Basically as a virtual firewall, composed of rules, applied at the instance level

* It governs both inbound and outbound traffic

* Allow only, implicit deny

* Stateful traffic inspection.

* Associated with network interface

* Default security group, which is created when you create VPC, is assigned to any instances or network interfaces that aren't given a security group explicitly

* Security group rules:

    * Inbound and outbound

    * Protocol: TCP, UDP, ICMP,...

    * Port range: All or contiguous range or single port

    * Source (Inbound) and Destination (Outbound): CIDR, IP or security group, prefix list (Destination only, list of AWS services within the region)

Network access control lists

* Traditional access control list, composed of numbered rules, associated with subnets

* It governs both inbound and outbound traffic

* Allow and Deny action

* One NACL per subnet

* Stateless traffic evaluation

* Default NACL, which is created when you create VPC, is assigned to any subnet that aren't given a NACL explicitly

* Catch all deny rule at the bottom, numbered with a star, means denied by default if traffic doesn't match any above rules

* Rule evaluation is in order of rules from smallest to biggest

* NACL rules:

    * Rule # 

    * Protocol: TCP, UDP, ICMP,...

    * Port Range: All or contiguous range or single port

    * Source (Inbound) or Destination (Outbound): CIDR only

    * Action: Allow/Deny

Service and VPC endpoints

* Regional endpoints: publicly available regional endpoinds for all AWS services

* VPC endpoints: Created on the VPC and allow us to access AWS services in a secure manner

    * No IGW, NAT device, VPN

    * No public IP address

    * Traffic does not leave Amazon network

* Gateway or Interface

    * Gateway: S3 and DynamoDB

        * Select the service and VPC using prefix list - Attach an endpoint policy to the endpoint (IAM Policy) - Specify route tables

        * One service per endpoint - One policy per endpoint - One route per service

        * Limitations: Only work with Security groups, not NACL - Only support IPv4 and same region - Cannot be extended outside of VPC (Peering, VPN,...)

    * AWS PrivateLink interface for others

        * Select VPC, Subnets, service - Attach an endpoint policy to the endpoint - Enable private DNS

        * One subnet per AZ - Multiple DNS entries - Use AZ IDs for cross account - Interface endpoint request must be accepted before using

        * Can be extended with S2S VPN and Direct Connect

        * Limitations: One subnet per AZ - Only support IPv4 and same region

VPC flow logs

* VPC flow logs capture traffic flows from VPC, subnet or interface and send to CloudWatch Logs or S3

* Flow is IP traffic in an aggregation interval with default or custom format (S3 only)

* Limitations

    * Cannot change configuration of existing flow log

    * Primary private IPv4 address logged as srcaddr or dstaddr

    * Certain types of traffic are not logged: DHCP, DNS, Windows licensing ...

    * S3 bucket restriction on opt-in regions

    * It doesn't capture the contents

* Traffic Mirroring

    * Copy network traffic from ENIs and send to out-of-band appliances

    * It supports traffic filtering and target to an ENI or NLB

    * Target can be in same VPC, peered VPC or transit gateway connection

## Hybrid Connectivity and VPC peering

VPC Peering

* It is a networking connection between 2 VPCs, works with both IPv4 and IPv6

* It is available for multiple-account and multi-region and traffic stays private on AWS network

* Unsupported scenarios

    * CIDR Overlap

    * Transitive Peering

    * Edge to Edge routing

* Peering Process

    * Request and accept peering connection

    * Update route tables

    * Update security groups to include peer groups

    * Enable DNS resolution support

Hybrid Connectivity

* Virtual private gateway for site-to-site VPN

    * Managed by AWS

    * One per VPC - Multiple availability zones

    * Connect to customer gateway

    * Two tunnels per connection

    * Static or dynamic routing

    * Restricted to resources with an ENI

* EC2 for site-to-site VPN

    * Managed by us

    * Multiple per VPC - Single availability zone

    * Connection is software dependent

    * Multiple tunnels requires load balancing

    * Scripted route table changes

    * Access to anything with a private IP 

* Direct connect

    * A private connection to the AWS Network

    * Consistent network experience: guaranteed bandwidth, low latency and very little jitter

    * Connect to any AWS services or VPC in any region

    * Multiple physical connection options and port speeds

* Transit VPC

    * Private network spanning two or more regions

    * Share connections to DCs and other clouds and cross-account support

* Transit Gateway

    * Regional virtual router

    * Supported connections: VPCs, VPN Connection, Direct Connect gateways, transit gateway peering

    * Cross-account support and managed by AWS
