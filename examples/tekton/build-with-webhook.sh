#!/bin/sh

ep=$(kubectl get svc istio-ingressgateway  -n istio-system -o jsonpath="{.status.loadBalancer.ingress[0].hostname}")

curl -XPOST -d '{"namespace": "default"}' http://${ep}/trigger
