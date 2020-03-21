  
#!/bin/sh

ep=$(kubectl get svc istio-ingressgateway  -n istio-system -o jsonpath="{.status.loadBalancer.ingress[0].hostname}")

cookie=$(curl -sL -XPOST http://${ep}/login?username=jason -D - | grep set-cookie | cut -d ';' -f 1 | cut -d ':' -f 2)

watch -n 1 curl -o /dev/null -s -w %{http_code} -b ${cookie} http://${ep}/productpage
