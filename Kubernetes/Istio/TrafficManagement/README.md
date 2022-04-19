# DevOps Sharing

**WARNING:** The content of this repository is my **personal knowledge**

Please let me know if you find something wrongs and I will fix that

---

Deploy Patterns:

* Dark Launch: New version is only available for certain users

  * End-user routing: Different users get different behavior so that our test users can see the new feature while customer use the old version.

  * Validate fault scenarios: Test users can validate if application works correctly or not even if the service doesn't respond as expected.

  * Key to achieve it: Apply rule to HTTP headers

    ```
    apiVersion: networking.istio.io/v1alpha3
    kind: VirtualService
    spec:
      hosts:
      - example               
      http:
      - match: 
        - headers:
            end-user:
              exact: tester
        fault:                  
          delay:                  < Test with network delay
            percent: 100
            fixedDelay: 1.5s
          abort:
            percert: 50           < Test with service fault 
            httpStatus: 503
        route:                    
        - destination: 
            host: example         
            subset: v2            
      - route:
        - destination: 
            host: example        
            subset: v1               

    ``` 

* Blue-Green Deployment: We have 2 verions running in cluster and we can decide which version will handle all traffic.

* Canary Deployment: We have 2 versions running in cluster, and we send only a small amount of traffic to newer verion until we're confident. Then we can do stage rollout gradually increasing the amount of traffic to newer version until 100%.

* Circuit Breaker: If one of our containers fails, Istio will take it out of the load balance pool so no more traffic gets sent to it until it's healthy again.

Istio Components:

* Virtual Service

```
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
spec:
  hosts:
  - example.com               < The host requested by the client
  http:
  - match:
      - headers: 
          cookie:
            regex: "^(.*?;)?(product-page=v2)(;.*)?$"
    route:                    < Routing for HTTP traffic
    - destination: 
        host: example         < Traffic will be routed to one of those pods in example service.
        subset: v2            < The subset defined in the DestinationRule
      weigh: 100
```

* Destination Rule

```
apiVersion: networking.istio.io/v1alpha3
kind: DestinationRule
spec:
  host: example.com           < The host requested by the client
  gateways:
    - example-gateway
  subsets:                    < Available subsets for routing
  - name: v1
    labels: 
      version: v1             < Will only use Pods that have the label version v1
  - name: v2
    labels: 
      version: v2             < Will only use Pods that have the label version v2
    trafficPolicy:
      outlierDetection:
        consecutiveErrors: 2
        interval: 1m
        baseEjectionTime: 5m
        maxEjectionPercent: 100
```

* Gateway 

When run in Kubernetes, subset is a selection of the Pods within a Kubernetes service

Istio will use Kubernetes service to find the IP addresses of all the pods. VirtualService does not route traffic through service 