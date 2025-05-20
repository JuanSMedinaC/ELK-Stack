#!/bin/bash

NAMESPACE="observability"

# Deployments
kubectl delete deployment elasticsearch -n $NAMESPACE
kubectl delete deployment kibana -n $NAMESPACE
kubectl delete deployment logstash -n $NAMESPACE

# Services
kubectl delete service elasticsearch -n $NAMESPACE
kubectl delete service kibana -n $NAMESPACE
kubectl delete service logstash -n $NAMESPACE

# ConfigMaps
kubectl delete configmap logstash-config -n $NAMESPACE

