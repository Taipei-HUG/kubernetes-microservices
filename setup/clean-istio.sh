#!/bin/sh

kubectl delete namespace istio-system
kubectl get clusterrole | grep istio | awk '{print $1}' | xargs kubectl delete clusterrole
kubectl get clusterrole | grep kiali | awk '{print $1}' | xargs kubectl delete clusterrole
kubectl get clusterrolebinding | grep istio | awk '{print $1}' | xargs kubectl delete clusterrolebinding
kubectl get clusterrolebinding | grep kiali | awk '{print $1}' | xargs kubectl delete clusterrolebinding
kubectl get crds | grep istio | awk '{print $1}' | xargs kubectl delete crd

kubectl get MutatingWebhookConfiguration | grep istio | awk '{print $1}' | xargs kubectl delete MutatingWebhookConfiguration
