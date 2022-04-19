# DevOps Sharing

**WARNING:** The content of this repository is my **personal knowledge**

Please let me know if you find something wrongs and I will fix that

---

**Trusted subsystem pattern** is when our components assumes that they are running in a trusted network, so there's no authentication, no authorization, no encryption

Since we are running application on somebody else's servers, we might not need to trust the underlying network. If we implement encryption inside components, the code and operations will be more complicated and tons of certificates to deal.

Istio can upgrade HTTP conversation to HTTPS without changing code or get new certificates. 

Istio can also implement authentication and authorization using Istio managed certificates.

Certificates live in /etc/certs

* Encryption

Using MeshPolicy, Policy and DestinationRule to apply mTLS between services

mTLS is only stop traffic being observed if the network gets compromised, but it doesn't stop if the end user applications get compromised

* Authorization

Using AuthorizationPolicy and service account to apply authorization between services

We can check the SA in **/etc/certs/cert-chain.pem | openssl x509 -text -noout | grep 'Subject Alternative Name' -A 1**

We can secure end-user access to require credentials in the form of JWT. 

Istio Components:

* MeshPolicy

```
apiVersion: authentication.istio.io...
kind: MeshPolicy              < Default policy for all namespaces
metadata:
  name: default               < Required
spec:
  peers:                      < Authentication mechanism for calling service
  - mtls: {}                  < Require mutual TLS
      mode: PERMISSIVE        < Only apply HTTPS if both sides are managed by Istio
```

* Policy

```
apiVersion: authentication.istio.io...
kind: Policy                  < Default policy for specified targets
metadata:
  name: default               
  namespace: default
spec:
  peers:                      
  - mtls: {}                  < Require mutual TLS
  targets:
  - name: example             < Apply to example service
```

```
apiVersion: authentication.istio.io...
kind: Policy                  < Default policy for specified targets
metadata:
  name: default               
  namespace: default
spec:
  targets:
  - name: example                   < Apply to example service
  origins:                          < Authentication for end user
  - jwt:                            < Require JWT
      issuer: "chuongnguyen5397"    < JWT issuer and JWKS server address
      jwksUri: "uri"
  principalBinding: USE_ORIGIN < Tell Istio to use the end user's principal from JWT as the identity for outgoing calls
```

* DestinationRule

```
...
kind: DestinationRule
...
trafficPolicy:
  host: "*.default.svc.cluster.local"     < Any host in the default namespace
  tls:                                    < Use mutual TLS
    mode: ISTIO_MUTIAL                    < With istio-managed client certs
```

* AuthorizationPolicy

```
apiVersion: security.istio.io/v1beta1
kind: AuthorizationPolicy
metadata:
  name: example-authz
  namespace: default                      < Apply to default namespace
spec:
  selector:
    matchLabels:
      app: example                        < Target selector identifies services
                                          < Default Deny; no rules means deny all
  rules:                                  < Rules specify allow permissions
  - from:
    - source:
        principals" [".../sa/name"]       < Allow requests from specified principal
    to:
    - operation:
        methods: ["GET"]                  < To make GET calls to the service
```

```
apiVersion: security.istio.io/v1beta1
kind: AuthorizationPolicy
metadata:
  name: example-authz
  namespace: default                                 < Apply to default namespace
spec:
  selector:
    matchLabels:
      app: example                        
  rules:
  - to:
    - operation:
        methods: ["GET"]                             < To make GET calls to the service
    when:
    - key: request.auth.claim[sub]
      values: "chuong.nguyen5397@gmail.com"          < When the JWT has the specified claim
```