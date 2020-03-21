  
#!/bin/sh

ep=$(kubectl get svc istio-ingressgateway -n istio-system -o jsonpath="{.status.loadBalancer.ingress[0].hostname}")

echo "dashboard"
echo "http://${ep}"

echo "trigger"
echo "http://${ep}/trigger"
