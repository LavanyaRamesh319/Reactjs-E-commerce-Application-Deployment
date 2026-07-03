#!/bin/bash

echo "=============================="
echo "Stopping Existing Container..."
echo "=============================="

docker stop build-app || true
docker rm build-app || true

echo "=============================="
echo "Starting New Container..."
echo "=============================="

docker run -d \
--name build-app \
-p 80:80 \
devops-build

echo "Deployment Successful."
