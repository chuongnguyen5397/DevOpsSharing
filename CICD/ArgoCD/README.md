# DevOps Sharing

**WARNING:** The content of this repository is my **personal knowledge**

Please let me know if you find something wrongs and I will fix that

---

Prerequisites: 

* Containers

* Kubernetes

* Helm

* Kustomize

* GitOps Core Concept

ArgoCD is one of the core components of the Argo Project. It is a GitOps Operator that provide continuous delivery for Kubernetes.

ArgoCD has Application Controller to continously monitor apps running in K8s to compare the live app state against desired state defined it Git repository

ArgoCD Architecture:

* API Server: a gPRC/REST server that expose API that is consumed by Web UI, CLI and CI/CD systems

* Repository Server: An internal service that maintains a local cache of the Git repo holding the app manifests

* Application Controller: a Kubernetes controller that continuously monitors running apps and compares the current, live state against the desired state in the Git repo

ArgoCD Components:

* argocd-dex-server: ArgoCD uses Dex as its authentication 

* argocd-metrics/argocd-server-metrics: The exporter of ArgoCD for application metrics and API server metrics for Prometheus.

* argocd-redis: This redis cache engine combines with Repository Server to do the caching our repository from our Git.

* argocd-repo-server: This is where our cloned repository live in

* argocd-server: Where runs the ArgoCD API Server
