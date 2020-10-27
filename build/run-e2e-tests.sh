#!/bin/bash

#
# Copyright 2019 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

echo "E2E TESTS GO HERE!"

# Download and install kubectl
#curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && chmod +x kubectl && sudo mv kubectl /usr/local/bin/


# Download and install KinD
#GO111MODULE=on go get sigs.k8s.io/kind

# Create a new Kubernetes cluster using KinD
#kind create cluster

# need to find a way to use the Makefile to set these
IMG=$(cat ../COMPONENT_NAME 2> /dev/null)
REGISTRY=quay.io/open-cluster-management

IMAGE_NAME_AND_VERSION=${REGISTRY}/${IMG}
COMPONENT_VERSION=$(cat ../COMPONENT_VERSION 2> /dev/null)

BUILD_IMAGE=${IMAGE_NAME_AND_VERSION}:${COMPONENT_VERSION}${COMPONENT_TAG_EXTENSION}

echo $BUILD_IMAGE

echo $PWD
ls
sed "s|image: .*:latest$|image: $BUILD_IMAGE|" ../deploy/standalone/operator.yaml


# kubectl apply -f ../deploy/standalone

exit 0;
