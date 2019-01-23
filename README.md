# Grafana Helm Chart

This repo contains helm charts to deploy Prometheus and Grafana to your
Kubernetes cluster. The Prometheus helm chart deploys the `node_exporter` and
`kube-state-metrics` to expose cluster metrics. The Grafana helm chart comes
with useful dashboards preconfigured.

## Install

```
cd ~/workspace/charts-grafana
helm install .
```

## Prerequisites

### Configure Helm

The following commands may need to be executed for helm to function correctly.

```
kubectl create serviceaccount --namespace kube-system tiller
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
helm init --service-account tiller
```

## Installation Caveats

### Cluster Size

Prometheus includes a few deployments, such as the prometheus server,
alertmanager, node exporter daemonset, and kube-state-metrics. Grafana
includes a deployment as well. You should consider this when deploying this
chart and sizing your cluster.

### Cluster with Admission Controllers

_PodSecurityPolicy_
Currently the prometheus chart does not have pod security policy defined for
most of its components. Hence, it will not install correctly on any cluster
enforcing `PodSecurityPolicy`.

_SecurityContextDeny_
The grafana deployment uses PodSecurityContext to configure grafana
container user (UID: 472). This means that the grafana deployment will
fail on any cluster with `SecurityContextDeny` enabled.
