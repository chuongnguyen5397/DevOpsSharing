# DevOps Sharing

## Training Plan

### Day 1: DevOps Fundamentals

What is DevOps?

DevOps is the combination of cultural philosophies, practices, and tools that increases an organization’s ability to deliver applications and services at high velocity: evolving and improving products at a faster pace than organizations using traditional software development and infrastructure management processes. This speed enables organizations to better serve their customers and compete more effectively in the market.

Ex: Plan - Build - Test - Release - Monitor. DevOps is the "-" to help process faster.

DevOps = Develop Operation

DevOps = Develop Optimization

Ref: https://aws.amazon.com/devops/what-is-devops/?nc1=h_ls

What do DevOps Engineers do?

- Automation Process: Apply CI/CD process to do things automatically (CI/CD for application, Cronjob to notify people when we have downtime)

- Optimization: Cost Optimization (Infrastructure, License,...), Performance Optimization (Apply modern technologies like GitOps, Security Scanning,...), Process Optimization (Apply modern technologies like IaC, Configuration Management, Monitoring System,... )

How to be a DevOps Engineer?

- Knowledge: Networking, System, Programming Coding,...

- Mindset: Searching Skill (Google, StackOverFlow, AI,...), Responsibility

### Day 2: Networking

Most of the topics are covered in below reference: 

- TCP/IP, OSI Model, IP Address Scheme, Subnet masks, Sockets - Port Numbers, DNS - DNS Server, Routing, IPv6,...

Ref: https://www.penguintutor.com/linux/basic-network-reference

- Know about Network components: Router, Switch, NAT, SSL Handshake, TCP/UDP protocol, TTL, DHCP, Private/Public IP address, MAC address

- Know about Network flow: Inbound/Outbound traffic, Bandwidth, Latency,...

- Know about Network security: NACL, Firewall,...

- Practice tools: Cisco Packet Tracer, GNS3,...

- Related Certifications: CCNA, CCNP,...

How do DevOps engineers use networking knowledge in their work?

- Designing and deploying scalable and reliable networks: DevOps engineers need to understand how to design and deploy networks that can handle large volumes of traffic and that are resilient to failures. This includes understanding network protocols, routing, switching, and security.

- Automating network tasks: DevOps engineers often use their networking knowledge to automate network tasks, such as provisioning new servers, configuring firewalls, and load balancing traffic. This helps to make networks more efficient and reliable.

- Troubleshoot network problems: DevOps engineers need to be able to troubleshoot network problems when they occur. This requires a good understanding of how networks work and how to identify and resolve common network issues.

Example: user -> Edge CDN -> ALB -> Application Server -> Database

### Day 3: System Administrator

System Administrator (SysAdmin) skills are in high demand for DevOps Engineers, as DevOps is a culture and set of practices that combines software development (Dev) and IT operations (Ops) to shorten the systems development life cycle and provide continuous delivery with high software quality.

Key SysAdmin skills for DevOps Engineers include:

- Linux and Windows administration: DevOps Engineers need to be able to manage and troubleshoot Linux and Windows servers, as well as be familiar with cloud computing platforms such as AWS, Azure, and GCP. 

- System Networking: DevOps Engineers need to have a good understanding of networking fundamentals, such as TCP/IP, DNS, and routing.

- Scripting: DevOps Engineers need to be able to write scripts to automate tasks, such as provisioning and configuring servers, deploying applications, and monitoring systems. 
Example: Shell Script, Python Script,...

- Configuration management: DevOps Engineers need to be able to use configuration management tools such as Ansible, Chef, or Puppet to manage the configuration of their systems and applications. (Ansible, Chef, Salt,...)

- Monitoring and logging: DevOps Engineers need to be able to set up and manage monitoring and logging systems to track the performance and health of their systems and applications. (CPU, Memory, Disk, network, stdout, stderr,...)

In addition to these technical skills, DevOps Engineers also need to be able to collaborate effectively with developers and other teams in the organization. They also need to be able to think critically and solve problems quickly.

Here are some specific examples of how SysAdmin skills are used in DevOps:

- Provisioning and configuring servers: DevOps Engineers use SysAdmin skills to provision and configure servers for new applications, as well as to scale and maintain existing servers. (Configuration Management: Ansible + Terraform)

- Deploying applications: DevOps Engineers use SysAdmin skills to deploy applications to servers, using tools such as Ansible or Chef. (CI/CD (Jenkins, GitlabCI, Github Actions,...), GitOps, Container, Kubernetes,...)

- Monitoring systems and applications: DevOps Engineers use SysAdmin skills to set up and manage monitoring and logging systems to track the performance and health of their systems and applications. (Prometheus + Grafana, ELK, EFK,...)

- Troubleshooting problems: DevOps Engineers use SysAdmin skills to troubleshoot problems with systems and applications.

- Automating tasks: DevOps Engineers use SysAdmin skills to automate tasks, such as provisioning and configuring servers, deploying applications, and monitoring systems. (CronJob, Batch,...)

Certification: LPIC 1 & 2, MCSA,...

Ref: https://medium.com/devopscurry/a-complete-guide-to-transition-from-a-sysadmin-to-devops-role-8ffab440d253

### Day 4: Programming

Requirement knowledge in Programming field for DevOps Engineers include:

- Software Development Life Cycle (SDLC)

Planning: Define the requirements for the software. --> Design: Design the software architecture and user interface. --> Development: Write the code for the software --> Testing: Test the software for functionality and bugs. --> Deployment: Deploy the software to production. --> Maintenance: Maintain the software and fix bugs. --> Planning ... 

- Know how to build and deploy an application

Example in Java:

Building and deploying a Java application involves a series of steps that transform the source code into a deployable artifact that can be run on a target environment. The specific steps will vary depending on the type of application and the target environment, but the general process typically involves the following stages:

1. Source Code Preparation:

Ensure the source code is well-structured and organized according to best practices.
Follow coding guidelines and conventions for consistency and maintainability.
Validate the code for syntax errors, logical flaws, and potential bugs.

2. Compilation:

Translate the source code into executable bytecode using the Java compiler.
Compile Java files into .class files, which are the bytecode instructions understood by the Java Virtual Machine (JVM).
Compile any associated resources, such as property files, images, or static content.

3. Packaging:

Package the compiled classes and resources into a distributable format.
For stand-alone applications, use a JAR (Java Archive) file, which is a compressed file containing class files and metadata.
For web applications, package the JAR into a WAR (Web Application Archive) file, which includes the JAR and additional web application files.

4. Deployment:

Copy the packaged artifact (JAR or WAR file) to the target deployment environment.
For web applications, deploy the WAR file to a web server or application container, such as Tomcat or Wildfly.
For stand-alone applications, execute the JAR file to launch the application.

5. Configuration:

Configure the application environment by setting appropriate properties or environment variables.
Configure any dependencies or external services required by the application.
Adjust any logging or security settings as needed.

Practice: 

Java: https://code.visualstudio.com/docs/java/java-webapp

Python: https://code.visualstudio.com/docs/python/tutorial-django

Node: https://code.visualstudio.com/docs/nodejs/nodejs-tutorial

- Continuous Integration (CI) / Continuous Delivery (CD)

CI is a practice of automating the process of merging all code changes from all developers into a central repository several times a day. This allows for early detection of bugs and ensures that the code is always in a deployable state.

CD is a practice of automating the process of releasing software to production. This allows for faster and more frequent releases, which can help to improve customer satisfaction and reduce time to market.

Automation is the use of software to perform tasks that are typically done manually. This can help to improve efficiency, reduce errors, and free up time for more valuable work.

CI/CD Tools: Jenkins, Gitlab CI, Github Actions,...

### Day 5: What is Deployment?

Requirement: Docker + npm + node

Reference: https://code.visualstudio.com/docs/nodejs/nodejs-tutorial

Target: A runnable Container Image