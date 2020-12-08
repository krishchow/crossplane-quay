#!/bin/bash
source variables.env

oc crossplane install provider crossplane/provider-helm:master
oc crossplane install provider crossplane/provider-aws:master
oc crossplane install provider crossplane/provider-in-cluster:master 

./scripts/awscreds.sh

sleep 10

oc apply -f ./manifests/providers.yaml
