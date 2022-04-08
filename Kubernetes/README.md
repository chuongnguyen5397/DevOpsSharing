# DevOps Sharing

**WARNING:** The content of this repository is my **personal knowledge**

Please let me know if you find something wrongs and I will fix that

---

## What is Kubernetes?

Kubernetes "is a portable, extensible, open source platform for managing containerized workloads and services, that facilitates both declarative configuration and automation." In conclusion, Kubernetes (k8s) is container orchestrator.

Kubernetes jobs:

* k8s starts and stops container-based applications based on the requirements of the systems administrator or developer.

* k8s manages te workload placement: We define the requirement of deployment in our code, and k8s will do for us

* k8s provides infrastructure abstraction: We don’t need to know which server our containers are in or how traffic come to our containers, k8s will do that for us be default.

* k8s provides desired state: We define what our applications or our services will look like in code, k8s will make sure that our system meets that defined desired state 

Kubernetes key benefits:

* Speed of deployment

* Ability to absorb change quickly

* Ability to recover quickly

* Hide complexity in the cluster

Kubernetes principles:

* Desired state / Declarative configuration: We define what we want in code, and k8s will do that for us

* Controllers / Control Loops: k8s constantly monitoring the running state of the system to make sure that the system is in our desired state. If it is not in desired state, a controller will try to bring the system into the desired state.

* Kubernetes API / API Server: A collection of objects that we can use to build and define the system that we want to deploy in code. Kubernetes’s API is implemented and available via API server. API server is the cental communication hub for information in a k8s cluster. Administrators and developers interact with Kubernetes via API Server to deploy and manage workloads. It’s also where the components of a k8s cluster interact with each other to understand the current state of the system, and to make changes if it is not in the desired state to ensure the desired state.

---

## Kubernetes Cluster Architecture
**Cluster Components**

* Control Plane Node: It implements the major control functions of a cluster. It used to be called the master node.

  * It coordinates cluster operations, monitoring, Pod scheduling and is the primary access point for cluster administration.

  * Control plane node is comprised of several components:

    * API Server 

      * The primary access point for cluster and administrative operations.

      * This is essentially the communication hub of our Kubernetes cluster, the core to all operation

      * API Server itself is stateless.

      * All configuration changes pass through the API Server.

      * It’s a simple interface leveraging a RESTful API.

      * Based on the operation, API Server will validate that operation and persist that object state into the Cluster data store (etcd)

    * etcd

      * etcd is a place to store the state of system.

      * etcd persists the state of Kubernetes objects as key-value pairs

    * Scheduler

      * Scheduler tell Kubernetes which nodes to start Pods on based on the pod’s resource requirements and other attributes.

      * Scheduler watches the API Server for unscheduled Pods, and then schedule those Pods on nodes.

      * When scheduling Pods, the Scheduler will evaluate the resources required by that Pods in terms of things like CPU, memory,… to ensure their availability when placing a Pod on a specific node.

      * Scheduler strictly follow our administrative constraints, like Pod affinity, anti-affinity,…

    * Controller manager

      * Controller manager implements the lifecycle functions of the controllers that execute and monitor the state of Kubernetes objects such as Pods. 

      * Basically, Controller manager keeps things in the desired state.

      * It executes controller loops. Controller loops implement the lifecycle functions of pods, so that they defined the desired state.

      * Controller manager watches the current state of the system and update the API server to ensure its heading towards the desired state.

    * kubectl: It is our primary administrative command line tool for operating our Kubernetes cluster, helping us to interact with the API Server to retrieve information or apply changes to get our system into the desired state. 

* Node: This is where our application Pods actually run. 

  * Node has the responsibilty of starting Pods and containers supporting those Pods.

  * Nodes implement networking, ensuring the network reachability to the pods and services.

  * Each node in the cluster contributes to the compute capacity of the cluster and cluster are composed of multiple nodes based on the scalability requirements of the workload deployed.

  * Nodes can be either virtual or physical machines.

  * In a node, there are several components, and they exist on all nodes, even on control plane node:

    * kubelet 

      * kubelet communicate directly with the API server and monitor the API server for changes. If it receives information about changes in its node, Pods are scheduled. When its node have a scheduled Pod, it will start up the containers needed for that Pod.

      * kubelet is responsible for Pod lifecycle, meaning starting and stopping Pods and its containers, by information from API Server

      * In addition to monitoring the API Server, kubelet also reports on both node and Pod state.

      * kubelet is the component that executes the probe if defined

    * kube-proxy

      * kube-proxy apply node and Pod networking responsibility in iptables in most commonly, and there are other modes.

      * kube-proxy implements the services abstraction. It is responsible for routing traffic to Pods.

      * kube-proxy also do the load-balancing.

      * kube-proxy communicate directly with the API server and monitor the API server for changes. kube-proxy implements networking topology changes, like adding a newly-created Pod’s IP to a service for load balancing, and make that modification on the node. 

    * Container runtime

      * This is the runtime environment for our containers. 

      * Its responsibilities are pulling containers from container registry and providing an execution environment for that container image and the Pod abstraction.

      * Container Runtime in Kubernetes is called the Container Runtime Interface (CRI).

      * Kubernetes supports using containerd, CRI-O,… 

      * Before Kubernetes version 1.20, Docker was the container runtime used. In version 1.20, Docker was deprecated, and will be removed in 1.22 or later.

    * Cluster Add-on Pods

      * They are pods that provide special services to the cluster itself.

        * CoreDNS

        * Ingress controllers

        * Dashboard

**Kubernetes API**

Kubernetes API or API objects is a collection of primitives to represent your system’s state, so things like Pods, Nodes,… 

* These API objects allow us to configure the state of the system in both declarative and imperative ways.

Kubernetes API Server is a RESTful API that runs over HTTP or HTTPS using JSON. 

* This is the only way to interact with k8s cluster.

* It is also the only for Kubernetes to interact with the cluster. All facets have to go through API server to exchange information. 

* When we communicate to the API server and we’re telling it to create things or change objects, our requests' information is serialized and then persisted into the cluster data store. 

Kubernetes API Objects:

* Pods

  * Pod is a construct that represents one or more containers inside of a k8s cluster. 

  * Pod is a single or a collection of containers that we deploy as a single unit, essentially is our container-based application.

  * Actually, it is our application or service that we deployed.

  * From a Kubernetes standpoint, it’s the most basic unit of work, unit of scheduling.

  * When we define a Pod, we can also define resources that it requires inside of the manifest that describes our deployment. Kubernetes will ensure that those resources are available and schedules that Pods onto those resources in our cluster.

  * Ephemeral - no Pod is ever redeployed. It means no state is maintained between two different deployments. Once a Pod goes away, it never ever comes back.

  * Atomicity - it is 100% or 0% available:

    * In a single-container Pod, if the container in a Pod’s up and running dies, that Pod’s no longer available

    * In a multiple-container Pod, if one of those containers dies, the entire Pod becomes unavailable

  * Kubernetes keeps our Pods running using controllers, or more specifically, in **desired state**.

    * Kubernetes tracks the state of Pod - is containers inside of Pod up and running? 

    * Kubernetes tracks the health of Pod - is the application in the Pod running? 

      * Probe

* Controllers

  * Controllers is the things that keep our system in the desired state, like ReplicaSets, Deployments,…

  * Controllers defines the desired state for your cluster and the application deployed in it and ensure that things stay in the desired state.

  * Controllers are exposed as workload resource API objects and used to create and manage Pod-based application deployed in Kubernetes.

  * Controllers continously monitor and respond to the state and health of deployed Pods to ensure the desired state 

  * ReplicaSet
    
    * It define the number of replicas for a paticular Pod .

    * If any Pod in ReplicaSet become unhealthy or unavailable for whatever reason, k8s will delete that Pod and deploy new one

  * Deployment

    * On the creation of deployment, it creates a ReplicaSet based on what’s defined in the deployment.

    * Deployment manages the state of the ReplicaSet.

    * Deployment manages the transition between two ReplicaSet (Deploy new versions of Pod,…) and rollback if needed

  * And more controllers…

* Services

  * Services provide a persistent access point to the applications that we deploy in Pods no matter our Pods are changed by us or Kubernetes itself.

  * Services add persistency to the ephemerality of Pods.

  * Services is the network abstraction for Pod access

  * Kubernetes actually persistently allocates an IP and DNS name for the application services provided by our Pods.

  * Services will be dynamically updated based on Pod lifecycle.

  * Services support the scaling of our application by adding and removing Pods based on the demands.

  * Services also provide a load balancing to distribute traffic across the Pods.

* Storage

  * Kubernetes gives us storage objects so we can have persistent storage in our applications.

  * We have volumes, which was storage backed by physical media that was directly accessible to a pod. Pod and volume are tightly coupled together so we lost some flexibility in administration.

  * We have concept of a persistent volume. It is a Pod independent storage that’s defined by the administrator at the cluster level.

  * When a pod wants access to persistent volume storage, it defines persistent volume claim. 

  * PV and PVC effectively decouples the pod from storage inside cluster

* And other objects, but above are the key players

**Kubernetes Operations**

Pod Operations: 

* Using kubectl to instruct Kubernetes to create for example a deployment. 

* The request goes to API server, and API server will store that information persistently in etcd. 

* Controller manager spins up pods based on the request. 

* The spin up request will be submitted to the scheduler. The scheduler will tell the API server that these pods need to be scheduled on selected nodes and scheduling information is persisted back to etcd. 

* kubelets on the nodes will ask the API server and spin up the pods if needed. 

* Controller manager will monior the state of the replicas

What happens if a node goes down?

That node is no longer reporting state, and the controller manager understands that cluster is not in desired state in the terms of the number of replicas required.

* Controller manager will submit for new pod to be created and scheduled

* Scheduler to find a node to put that pod on to ensure the desired state

Service Operations:

* We expose a deployment which have web application pods with a service

* Users in other applications will access our application pods via service endpoint (IP, DNS,…)

* Requests are load balanced to all pods

* If a pod is unresponsive or unavailable, replicaset controller will remove that pod and deploy a new one

* Service will stop load balancing to the deleted pod and continue routing to remaining pod and to newly created pod when it’s ready

