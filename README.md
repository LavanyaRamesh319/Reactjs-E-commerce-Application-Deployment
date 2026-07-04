# AWS DevOps CI/CD Build & Deployment Project

## Project Overview

This project demonstrates a complete DevOps CI/CD pipeline using Jenkins, Docker, Docker Hub, AWS EC2, Prometheus, Grafana, cAdvisor, Node Exporter, and Uptime Kuma.

The application is automatically built, containerized, pushed to Docker Hub, and deployed based on the Git branch.

---

# Architecture

GitHub Repository
        │
        ▼
Jenkins Pipeline
        │
        ├── Build Docker Image
        ├── Docker Login
        ├── Push Image to Docker Hub
        └── Deploy Container
                │
                ▼
          AWS EC2 Instance
                │
                ▼
         Docker Container (Nginx App)

Monitoring Stack

Prometheus
Node Exporter
cAdvisor
Grafana
Uptime Kuma
Email Notifications

---

# Technologies Used

- AWS EC2
- Jenkins
- Docker
- Docker Hub
- Git
- GitHub
- Nginx
- Prometheus
- Grafana
- cAdvisor
- Node Exporter
- Uptime Kuma

---

# Project Features

✔ GitHub Integration

✔ Jenkins CI/CD Pipeline

✔ Docker Image Build

✔ Docker Hub Push

✔ Automatic Deployment

✔ Branch Based Deployment

- Development Branch → build-dev image

- Main Branch → build-prod image

✔ Prometheus Monitoring

✔ Docker Container Monitoring

✔ EC2 Monitoring

✔ Grafana Dashboard

✔ Uptime Monitoring

✔ Email Alerts when Application Goes Down

---

# Repository Structure

```
.
├── Dockerfile
├── Jenkinsfile
├── docker-compose.yml
├── build.sh
├── deploy.sh
├── monitoring
│   ├── docker-compose.yml
│   └── prometheus.yml
├── build
└── README.md
```

---

# Jenkins Pipeline Stages

1. Checkout Source Code

2. Detect Branch

3. Build Docker Image

4. Docker Login

5. Push Image to Docker Hub

6. Deploy Docker Container

---

# Docker Images

Development Image

```
lavanyadevops1/build-dev:latest
```

Production Image

```
lavanyadevops1/build-prod:latest
```

---

# CI/CD Workflow

Developer Push

↓

GitHub

↓

Webhook Trigger

↓

Jenkins Pipeline

↓

Docker Build

↓

Docker Hub

↓

AWS EC2 Deployment

↓

Application Live

---

# Monitoring

## Prometheus

Collects metrics from:

- Node Exporter
- cAdvisor

---

## Node Exporter

Monitors:

- CPU Usage
- Memory Usage
- Disk Usage
- Network Usage

---

## cAdvisor

Monitors:

- Docker Containers
- CPU Usage
- Memory Usage
- Filesystem Usage
- Container Health

---

## Grafana

Dashboard used:

- Node Exporter Full (ID: 1860)

Displays:

- CPU
- Memory
- Disk
- Network
- System Load

---

## Uptime Kuma

Monitors:

- Application Availability

Notification:

- Email Alert when application goes DOWN

---

# Deployment Steps

## Clone Repository

```bash
git clone https://github.com/yourusername/devops-build.git

cd devops-build
```

---

## Build Docker Image

```bash
docker build -t build-app .
```

---

## Run Container

```bash
docker run -d \
--name build-app \
-p 80:80 \
build-app
```

---

# Monitoring Setup

Start Monitoring Stack

```bash
cd monitoring

docker compose up -d
```

Services

Prometheus

```
http://SERVER-IP:9090
```

Grafana

```
http://SERVER-IP:3000
```

Default Login

```
Username : admin

Password : admin
```

cAdvisor

```
http://SERVER-IP:8081
```

Node Exporter

```
http://SERVER-IP:9100/metrics
```

---

# AWS Security Group

Inbound Rules

| Port | Purpose |
|-------|----------|
|22|SSH|
|80|Application|
|3000|Grafana|
|8081|cAdvisor|
|9090|Prometheus|
|9100|Node Exporter|

---

# Jenkins Credentials

Docker Hub Credentials

```
Credential ID

dockerhub-creds
```

---

# Future Enhancements

- Kubernetes Deployment
- Helm Charts
- SonarQube Integration
- Trivy Image Scanning
- Terraform Infrastructure
- AWS EKS Deployment

---

# Screenshots

- Jenkins Pipeline
- Docker Hub Images
- AWS EC2 Console
- Running Application
- Prometheus Targets
- Grafana Dashboard
- Uptime Kuma Dashboard
- Email Notification

---

