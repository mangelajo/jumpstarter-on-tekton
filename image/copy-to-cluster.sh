#!/bin/sh

set +x

oc apply -f dummy.yaml
oc wait --for=condition=ready pod/dummy
oc rsync ./files/ dummy:/mnt/ --delete=true --strategy=tar
oc delete pod dummy
