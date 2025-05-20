#!/bin/bash

# Deployments
kubectl delete deployment auth-api
kubectl delete deployment frontend
kubectl delete deployment grafana
kubectl delete deployment log-message-processor
kubectl delete deployment prometheus
kubectl delete deployment redis
kubectl delete deployment todos-api
kubectl delete deployment users-api
kubectl delete deployment zipkin

# Services
kubectl delete service auth-api
kubectl delete service frontend
kubectl delete service grafana
kubectl delete service prometheus
kubectl delete service redis
kubectl delete service todos-api
kubectl delete service users-api
kubectl delete service zipkin

# ConfigMaps
kubectl delete configmap app-config
kubectl delete configmap prometheus-config

