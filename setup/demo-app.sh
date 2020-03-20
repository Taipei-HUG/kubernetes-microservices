
#!/bin/sh
sudo cp -r ~/.kube /root/
sudo cp -r ~/.aws /root/
AccountID=$(aws sts get-caller-identity | jq .Account | tr -d '"')
Registry=${AccountID}.dkr.ecr.us-west-2.amazonaws.com
aws ecr create-repository --repository-name k8s-m-bookinfo-productpage
aws ecr create-repository --repository-name k8s-m-bookinfo-ratings
aws ecr create-repository --repository-name k8s-m-bookinfo-details
skaffold config set default-repo ${Registry}
$(aws ecr get-login --no-include-email)
