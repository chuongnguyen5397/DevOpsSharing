# DevOps Sharing

**WARNING:** The content of this repository is my **personal knowledge**

Please let me know if you find something wrongs and I will fix that

---

Istio is a **Service Mesh**. It's the type of architecture that's an evolution from containers and orchestration. A service mesh connects all the components of your application and let's us simplify our app development and configuration. 

* Service mesh is like the communication layer between software components in a distributed system. It's actually an architectural pattern.

* Service mesh manages network traffic, deals with temporary faults and security, lets us control all in a central place

* In Kubernetes, service mesh is an application that runs alongside our application components. It doesn't interact with our components unless register component with the mesh.

* When that happen, service mesh will inject a network proxy into the component and all traffic from our component will go through the proxy and it will appli rules that we set up in service mesh.

* It we own all the parts of the system, we can register them all with the service mesh so that all of them have proxies applied, so that we can control all communication between those components via service mesh.

* Some service mesh: Istio, Linkerd, Consul connect, Maesh,...

## What is Istio?

* Istio is an open source project. It was originally a collaboration from Lyft with Google and IBM.

* Istio is platform-agnostic. You can use it with Consul or VMs, but it integrates really nicely with Kubernetes platform.

### Istio features:

* Traffic management

  * Discovery and Routing
  
    * Because all the traffic goes through the mesh, it can discover endpoints and take control of routing.

  * Load balancing 
  
    * The network proxy in each components decide where to send traffic

  * Failure handling 
  
    * The proxy is monitoring all the traffic so if there's a failure, it can automatically retry or advanced things.

* Security

  * Encryption

    * When we register our components with the service mesh, Istio creates certificates for each of them so each components has a known identity. 

    * We can configure traffic between our components to have mutual TLS, which means that the server component has a certificate for encryption and the client component has a certificate to verify who it is.
 
  * Authentication

    * Identity is managed by Istio, so each component certificate reliably identifies who it is, so that's how we authenticate between components

  * Authorization:

    * We can add rules to say which components can call other components, or which don't.

    * We can even extend that to end users

* Observability

  * Visualization

    * Because of the traffic goes through the mesh, Istio can watch everything and record it so that we can know what's happening. 

  * Tracing 

    * We can see which components are called and how long each of them takes

  * Monitoring

    * We can see what our service is doing and how it works.

### Install Istio

You can follow this guide to install Istio into your cluster: https://istio.io/latest/docs/setup/getting-started/

### Istio Architecture

When we register our services with Istio, either through automatic registration with namespace label or manually, they will have a proxy running as a sidecar in the same pod. At that time, all communication is going through the proxy components and that's transparent to application containers.

Istio is heavily optimized, so all things like configuration data or TLS certs are cached. Example is this blog from [Shopify](https://medium.com/@michael_87395/benchmarking-istio-linkerd-cpu-c36287e32781)

**Be aware** When implementing Istio, the cost for CPU and memory to run Control Plane of Istio will be as big as your cluster.

[References](https://istio.io/latest/about/service-mesh/)

* Istio Control Plane

  * Pilot

    * The component takes all the configuration we save in Istio, and pushes it to the proxies, so the proxies all have the latest config for the mesh

  * Mixer

    * Mixer is the runtime component.

    * Every call that goes throught the proxy will goes to Mixer.

    * Mixer applies policies and collects telemetry.

    * Mixer can use a lot of CPU because it will be called with every single network call

  * Citadel

    * The component deals with security certificates. It generates certificates for any new services that join the mesh and delivers certificates to the proxies in need.
