#!/bin/sh

kubectl apply -f productpage-pipeline
kubectl apply -f tasks
kubectl apply -f trigger
