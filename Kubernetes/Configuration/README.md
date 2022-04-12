# DevOps Sharing

**WARNING:** The content of this repository is my **personal knowledge**

Please let me know if you find something wrongs and I will fix that

---

# kubectl

**kubectl** is the primary CLI tool for controlling workloads in Kubernetes cluster. This is the primary way to interact with API Server

* kubectl performs most of operations in cluster - create, read, update, delete resources

    * apply/create - create resource(s): sending the deployments and the creation of resources to API Server

    * run: start a single or bare Pod when it's not managed by any controller   

    * explain: provide documentaion for API resources

    * delete: delete resources

    * get: list resources

    * describe: display very detailed information about a resource

    * exec: execute a command inside a container on a Pod

    * logs: view stdout logs from a container running inside of a Pod

    * and others in [documentation](https://kubernetes.io/docs/reference/kubectl/#operations)

* kubectl performs operations on resources, the kubernetes API object.

    * [Official Documentation](https://kubernetes.io/docs/reference/kubectl/#resource-types)

* kubectl gets and formats the outputs from our operations.

    * wide: output additional information about Kubernetes object

    * yaml: YAML formatted API object

    * json: JSON formatted API object

    * dry-run: print an object without sending it to the API server

**kubectl** syntax:

* kubectl [operation] [resource] [object name] [flags] 

* [Reference](https://kubernetes.io/docs/reference/kubectl/#syntax)

# Application Deployment

Imperative Configuration

* Executing command one at a time and one by one

Declarative Configuration

* Define our desired state in code as manifests

* Manifests can be written in YAML or JSON and send to API Server with `kubectl apply`

Basic Manifest: 

* apiVersion: The version of API object we are consuming so that API Server can understand what we want

* kind: The kind of object that we want to define

* metadata: The description of this manifest

* spec: This defines the implementation details of the deployment object

## Application Deployment Process

After run `kubectl apply` and pass manifests of objects, for example Deployment, that we want to create, kubectl sends our request into the API Server

The API Server parse that information and store those objects in etcd.

The Controller Manager is watching so it starts up a controller for that deployment, then replica set, then required pods, after that it will write information about the new pods back to etcd.

The Scheduler is watching etcd to check if etcd has any pods haven't assigned to nodes yet. It will find unscheduled Pods and assign them to run on a particular node in cluster

Each Pod object is updated in etcd with the assigned node. Kubelet on all nodes are watching API Server and check if it need to do anything, and if yes, it will send message to the container runtime on that node to start the required containers for the pod up on that node.

If that Pod is a member of a service, kube-proxy will update it