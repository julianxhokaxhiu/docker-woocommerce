#!/bin/bash

set -e

ISSUES_FOUND=0

LEVELS=("CRITICAL" "HIGH" "MEDIUM" "LOW")
for LEVEL in "${LEVELS[@]}"
do
  :
  echo -e ">> Scanning for $LEVEL security issues..."
  if ! trivy --quiet image --exit-code 1 --severity $LEVEL $_RELEASE_NAME:$_RELEASE_TAG; then
    ISSUES_FOUND=1
  fi
  echo -e "\n===============================================================================\n"
done

if [ $ISSUES_FOUND -ne 0 ]; then
  echo "##vso[task.complete result=SucceededWithIssues;]"
fi
