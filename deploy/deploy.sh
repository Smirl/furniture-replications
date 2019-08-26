#!/bin/sh

../helm template ./chart --set version=$VERSION > output.yaml
cat output.yaml
../kubectl apply -f output.yaml
