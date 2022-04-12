# DevOps Sharing

**WARNING:** The content of this repository is my **personal knowledge**

Please let me know if you find something wrongs and I will fix that

---

# Installing and Configuring Kubernetes

## Installation Considerations

Where to install? 

* Cloud

  * IaaS - Virtual Machines: Deploy Kubernetes cluster on top of that. We have to worry about the OS, installing and maintaining Kubernetes itself as software

  * PaaS - Managed Service: Consuming Kubernetes as a service. We lose some flexibility in the versioning and other features.

* On-premises: 

  * Bare Metal

  * Virtual Machines

=> Choose depend on the skill set and the strategy of organization.

Some points need to consider before choose:

* Cluster Networking

* Scalability

* High Availability

* Disaster Recovery 

## Installation Methods

* Desktop

* kubeadm

* Cloud Scenarios

## Installation Requirements

* System Requirements

  * Linux - Ubuntu/RHEL. Windows worker nodes are available

  * 2 CPUs - 2GB RAM in minimum. In production, we will need to calculate the workload

  * Swap Disabled

* Container Runtime

  * Container rumtime need to be **Container Runtime Interface (CRI) compatible**

    * containerd, Docker (Deperecated 1.20), CRI-O,...

* Networking

  * Connectivity between all Nodes

  * Each system has unique hostname and unique MAC address

* Cluster Network Ports 

|`Component`|`Ports(tcp)`| `Used by`| `Description`|
|-|-|-|-|
|API|6443|All|Default port and configurable. Mostly anything in the cluster and anything need to talk to it|
|etcd|2379-2380|API/etcd|API server persists its data in etcd. etcd communicate to each other for redundancy purposes|
|Scheduler|10251|Self|Only on localhost and not exposed to the outside|
|Controller Manager|10252|Self||
|Kubelet|10250|Control Plane|All the control plane components will access to it|
|NodePort|30000-32767|All|Used by NodePort service type|

## Installation Information

Maintained on [Github](https://github.com/kubernetes/kubernetes)

Linux Distribution Repositories: yum and apt

## Installation Steps

* Install and configure a container runtime and Kubernetes packages.

  * containerd, Docker,...: Container Runtime

  * kubelet: Thing to manage the work on invidual nodes in cluster

  * kubeadm: Tool for bootstrapping cluster and getting cluster components up, running and configured

  * kubectl: Primary command-line tool to interact with cluster

* Create our cluster: bootstrap control-plane node and get components up and running

  * Run kubeadm init

* Configure Pod networking environment

  * **Overlay Networking**, sometimes called software-defined networking, provides a single layer 3 network that all Pods can commnunicate on, by tunneling encapsulation of IP packets. It will handle the networking and reachability for all Pods.

  * [References](https://kubernetes.io/docs/concepts/cluster-administration/networking/)

  * Some of the overlay network: 

    * Flannel: Layer 3 virtual network

    * Calico: L3 and policy based traffic management

    * Weave Net: multi-host network

* Join nodes to cluster for worker nodes

  * Container runtime, kubeadm, kubelet, kubectl need to be installed on the node. 

  * kubeadm join: Start the process of joining to a cluster. That node will download cluster information and configuration metadata

  * Node will generate and submit a certificate signing request (CSR) into the API server to generate a certificate for the kubelet

  * The CA automatically signs the CSR, and kubeadm join will download the certificate and store it in /var/lib/kubelet/pki 

  * Then it will generate a kubeconfig file named kubelet.conf lives in /etc/kubernetes on the node. Stored in that file is client certificate and network location of API Server.

  * Required parameters: IP address and port of the API Server, bootstrap token, CA cert hash 

## Kubeadm init and what's running behind

* Pre-flight checks: execute a series of checkto ensure a successful cluster creation: right permissions, enough resources, compatible container runtime,...

* Creates a Certificate Authority: used for both authentication and encryption.

  * Kubeadm creates a self-signed certificate authority and can be a part of an external PKI

  * This CA is used to secure cluster communications

    * API server uses to encrypt the HTTP stream 

  * This CA is used to generate certificates for the authentication of users and cluster components like scheduler, Controller Manager, kubelet,... to authenticate the request of the API Server

    * /etc/kubernetes/pki and will be distributed to each node in cluster

* Generates kubeconfig files

  * Kubeconfig file is configuration file that defines how to connect to our cluster API Server

  * Inside kubeconfig file, we see: 
  
    * Certificates used for client authentication

    * Cluster API Server's network location (IP or DNS)

    * (Optional) CA certificate of the CA that was used to sign the certificate of the API Server

    * Collection of kubeconfig files live in /etc/kubernetes
    
      * admin.conf: Kubernetes cluster administrator account

      * kubelet.conf: It helps the kubelet locate the API server and provide right certificate for authentication.

      * controller-manager.conf

      * scheduler.conf

* Generates static pod manifests

  * Those manifests are for cluster control plane components (etcd, API Server, Controller Manager, Scheduler)

  * Those manifests are in /etc/kubernetes/manifests.

  * kubelet watches this folder and start up the pods described in the folder, and here is control plane pods.

  * Those pods are start before cluster's up and running

* Wait for the control plane pods to start

* Taints the control plane node

* Generates a bootstrap token

* Start Add-On components: DNS and kube-proxy

[Official Documentation](https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm-init/)