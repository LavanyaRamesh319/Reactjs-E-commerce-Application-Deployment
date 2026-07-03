#!/bin/bash

echo "=============================="
echo "Building Docker Image..."
echo "=============================="

docker build -t devops-build .

echo "Docker Build Completed."
