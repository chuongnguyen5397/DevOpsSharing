# DevOps Sharing

**WARNING:** The content of this repository is my **personal knowledge**

Please let me know if you find something wrongs and I will fix that

---

Since all the communication between components flows through the service mesh, Istio can collect telemetry about all the service calls, forward data to back end to bring up different types of visualization.

That will give us insight into the health of application, status of rollouts, performance problems and debug failures.

Istio uses a plugin model for Observability, and the telemetry is classified into different types:

* Metrics: can be sent to Prometheus, use Grafana for UI

* TraceSpans: can be sent to Zipkin, use Zipkin UI or Jaeger

  * Require multiple additional header, but can be easily implemented with OpenTelemetry

* LogEntries: can be sent to ElasticSearch, use with Kibana and Fluentd

When back ends have telemetry data, we can visulize it through different front ends since Istio has support for all the leading visualization software, most of which are open source projects: Kiali, Grafana, Jaeger, Kibana