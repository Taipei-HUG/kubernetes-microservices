#!/bin/sh

kubectl delete namespace tekton-pipelines
kubectl get clusterrole | grep tekton | awk '{print $1}' | xargs kubectl delete clusterrole
kubectl get clusterrolebinding | grep tekton | awk '{print $1}' | xargs kubectl delete clusterrolebinding
kubectl get crd | grep tekton | awk '{print $1}' | xargs kubectl delete crd
