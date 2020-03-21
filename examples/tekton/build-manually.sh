#!/bin/sh

cat <<EOF | kubectl apply -f -
apiVersion: tekton.dev/v1alpha1
kind: PipelineRun
metadata:
  name: productpage-pipeline-build-image
spec:
  pipelineRef:
    name: taipeihug-productpage-build-image-only
  resources:
    - name: git-repo
      resourceRef:
        name: git-repo-kubernetes-microservices
    - name: docker-image
      resourceRef:
        name: taipeihug-istio-productpage
EOF
