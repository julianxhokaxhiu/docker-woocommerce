#!/bin/bash

set -e

if [[ $_BUILD_BRANCH == "refs/heads/master" ]]; then
  _IS_BUILD_CI="true"
elif [[ $_BUILD_BRANCH =~ ^refs/tags/* ]]; then
  _BUILD_VERSION="$(echo $_BUILD_VERSION | cut -d '.' -f 1-2).0"
  _RELEASE_TAG=$_BUILD_VERSION
  echo "##vso[task.setvariable variable=_RELEASE_TAG;]${_RELEASE_TAG}"
fi

echo "--------------------------------------------------"
echo "RELEASE TAG: $_RELEASE_TAG"
echo "--------------------------------------------------"

echo "##vso[task.setvariable variable=_IS_BUILD_CI;]${_IS_BUILD_CI}"

# Install trivy
_TRIVY_PKG="trivy_${_TRIVY_VERSION}_Linux-64bit.deb"
curl -L -o $_TRIVY_PKG "https://github.com/aquasecurity/trivy/releases/download/v${_TRIVY_VERSION}/${_TRIVY_PKG}"
sudo dpkg -i $_TRIVY_PKG
