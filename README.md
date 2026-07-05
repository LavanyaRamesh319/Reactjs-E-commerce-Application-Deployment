# Application Deployment using Docker, Jenkins, AWS and Monitoring

## Project Overview

This project demonstrates the deployment of a React application using modern DevOps practices. The complete CI/CD pipeline automates application build, containerization, image management, deployment, monitoring, and health notifications.

The application is containerized using Docker and managed through Docker Compose. Jenkins is configured to automate the build, test, and deployment process based on GitHub branch changes. Docker Hub is used as the container registry for storing development and production images. The application is deployed on AWS EC2 and monitored using Prometheus, Grafana, Node Exporter, cAdvisor, and Uptime Kuma.

---

# Objectives

- Deploy the React application on AWS EC2.
- Containerize the application using Docker.
- Manage containers using Docker Compose.
- Automate image build and deployment using Jenkins.
- Store Docker images in Docker Hub.
- Implement branch-based CI/CD using GitHub.
- Monitor application and server health.
- Configure application downtime notifications.

---

# Technology Stack

| Category | Technology |
|-----------|------------|
| Frontend | ReactJS |
| Containerization | Docker |
| Container Management | Docker Compose |
| Version Control | Git & GitHub |
| CI/CD | Jenkins |
| Container Registry | Docker Hub |
| Cloud Platform | AWS EC2 |
| Monitoring | Prometheus |
| Visualization | Grafana |
| Container Monitoring | cAdvisor |
| Server Monitoring | Node Exporter |
| Application Monitoring | Uptime Kuma |

---

# Project Structure

```
devops-build/
│
├── build/
├── Dockerfile
├── docker-compose.yml
├── Jenkinsfile
├── build.sh
├── deploy.sh
├── .gitignore
├── .dockerignore
├── README.md
│
└── monitoring/
    ├── docker-compose.yml
    └── prometheus.yml
```

---

# Application

The project uses the React application provided in the assignment repository. The application is configured to run on **Port 80** using an Nginx web server inside a Docker container. 
<img width="940" height="535" alt="image" src="https://github.com/user-attachments/assets/672e7987-ef35-4a4f-be94-225e3e9193e8" />

---

# Docker

The application is containerized using Docker to ensure consistent deployment across environments.

A multi-stage Dockerfile is used to:

- Install project dependencies
- Build the React application
- Copy the generated build files into a lightweight Nginx image
- Serve the application through Port 80

  <img width="940" height="644" alt="image" src="https://github.com/user-attachments/assets/146fbde0-7a67-4828-836b-74613ea708bb" />


Using Docker provides portability, faster deployment, environment consistency, and simplified application management.

---

# Docker Compose

Docker Compose is used to simplify container deployment.

The Compose configuration manages the application container by defining:

- Container name
- Image configuration
- Port mapping
- Restart policy

This allows the complete application to be deployed using a single configuration file instead of multiple Docker commands.

<img width="940" height="275" alt="image" src="https://github.com/user-attachments/assets/8b78e104-7462-4985-90b2-9ff1b755cf7c" />

<img width="940" height="478" alt="image" src="https://github.com/user-attachments/assets/b781f177-56de-4c38-82e1-eb67228948cb" />

<img width="940" height="357" alt="image" src="https://github.com/user-attachments/assets/e87a2e6b-1d15-44b2-98ae-16580bce167a" />

---

# Bash Scripting

Two shell scripts were created to automate repetitive deployment tasks.

### build.sh

The build script automates the Docker image creation process. Instead of manually executing Docker build commands, the script generates the latest application image that is later used by Jenkins during the CI/CD pipeline.

<img width="731" height="267" alt="image" src="https://github.com/user-attachments/assets/1e5d8eb0-c031-4a15-a997-2bc160d72368" />


### deploy.sh

The deployment script automates container deployment by stopping any existing application container, removing it, and deploying the latest Docker image. This ensures that the application is always deployed with the newest version while minimizing manual intervention.

<img width="657" height="532" alt="image" src="https://github.com/user-attachments/assets/06ba7222-6eaa-40a4-ba7c-0b7e73626663" />

---

# Version Control

Git is used as the version control system for maintaining the project source code.

The project follows a branch-based workflow consisting of:

- Development Branch (dev)
- Production Branch (main)

The complete source code is managed using Git CLI commands as required by the assignment.

To optimize the repository:

- `.gitignore` excludes unnecessary development files.
- `.dockerignore` excludes files that should not be copied into Docker images.

<img width="940" height="525" alt="image" src="https://github.com/user-attachments/assets/84df87ed-7d35-45cd-b1a3-779f21551cc3" />

<img width="940" height="235" alt="image" src="https://github.com/user-attachments/assets/38fdef3c-2c89-4dee-af4d-414361dcec46" />

<img width="940" height="433" alt="image" src="https://github.com/user-attachments/assets/a7125050-b2db-4e53-8cfd-72641d0993b6" />

<img width="940" height="620" alt="image" src="https://github.com/user-attachments/assets/fb3d97b3-2c8b-4111-863b-9988a4614813" />


---

# Docker Hub

Docker Hub acts as the container registry for storing application images.

Two repositories were created:

### Development Repository

```
build-dev
```

This repository stores images automatically generated whenever code is pushed to the **dev** branch.

### Production Repository

```
build-prod
```

This repository stores production-ready images whenever the development branch is merged into the **main** branch.

This approach separates development builds from production releases while maintaining proper version control.

<img width="940" height="242" alt="image" src="https://github.com/user-attachments/assets/84b75091-9fb8-40b1-bc6c-e2159f9d9fb0" />

---

# Jenkins

Jenkins is used to automate the Continuous Integration and Continuous Deployment (CI/CD) pipeline.

The Jenkins pipeline performs the following tasks automatically:

- Clone the latest source code from GitHub
- Detect the active branch
- Build the Docker image
- Authenticate with Docker Hub
- Push Docker images to the appropriate repository
- Deploy the latest application container

The entire workflow is defined using a Declarative Jenkins Pipeline stored inside the project's `Jenkinsfile`.

<img width="940" height="459" alt="image" src="https://github.com/user-attachments/assets/2947b6ac-f551-4e07-9ad8-5d4365971dcb" />

<img width="940" height="471" alt="image" src="https://github.com/user-attachments/assets/ed7a4141-86b6-490e-a10d-2c115f703c28" />

<img width="940" height="489" alt="image" src="https://github.com/user-attachments/assets/46c15c7f-ae97-478d-8923-bae7e98594b2" />

<img width="940" height="928" alt="image" src="https://github.com/user-attachments/assets/41486820-019a-4526-bebd-16fe241c46a5" />

<img width="940" height="898" alt="image" src="https://github.com/user-attachments/assets/46587592-6b57-49fd-8b6e-3261d33bffac" />

---

# GitHub Webhook

GitHub Webhooks are configured to automatically trigger Jenkins whenever changes are pushed to the repository.

<img width="940" height="235" alt="image" src="https://github.com/user-attachments/assets/77dc6742-a6b3-4f1a-bd60-0332c330d7e2" />

Pipeline behavior:

### Development Branch

- Build Docker image
- Push image to Development Docker Hub repository

  <img width="940" height="230" alt="image" src="https://github.com/user-attachments/assets/d14c2cfc-0221-4e49-b289-eac1a734b7bd" />

<img width="940" height="544" alt="image" src="https://github.com/user-attachments/assets/d76097f8-66af-41a0-ac9d-d84c006011c0" />

<img width="940" height="572" alt="image" src="https://github.com/user-attachments/assets/60c38cc1-bb06-46d9-936b-88c82add010f" />

<img width="940" height="839" alt="image" src="https://github.com/user-attachments/assets/afa1ca1f-d2d5-4723-a3a7-e47fd845e981" />

<img width="940" height="707" alt="image" src="https://github.com/user-attachments/assets/d9962ee5-1655-4c5f-b8ff-d2bd9bf7ee6f" />

<img width="940" height="795" alt="image" src="https://github.com/user-attachments/assets/b9cc4634-037a-4ed4-a6a0-d7a65e3742d6" />

<img width="940" height="745" alt="image" src="https://github.com/user-attachments/assets/deb2bd64-41a2-45f4-95a6-0ac0012d72c0" />




### Production Branch

- Build Docker image
- Push image to Production Docker Hub repository

This enables fully automated deployments without requiring manual Jenkins execution.


<img width="940" height="274" alt="image" src="https://github.com/user-attachments/assets/01ea6bf9-847b-40fb-b0f7-f5c28e01e638" />


<img width="940" height="204" alt="image" src="https://github.com/user-attachments/assets/3afd0b02-c25b-4249-b8d1-654e674725ab" />


<img width="940" height="531" alt="image" src="https://github.com/user-attachments/assets/117c77c0-dd2a-456d-b41b-797825505894" />


<img width="940" height="543" alt="image" src="https://github.com/user-attachments/assets/60bdd80e-f53f-4b94-b704-ca1e63abd3a3" />


<img width="940" height="830" alt="image" src="https://github.com/user-attachments/assets/7e0b5da0-12a4-41a0-9139-f486a708a9fd" />


<img width="940" height="697" alt="image" src="https://github.com/user-attachments/assets/921f4e1c-96a9-4f0b-9c52-096dac861df1" />


<img width="940" height="811" alt="image" src="https://github.com/user-attachments/assets/c55704d0-2808-438b-adf4-2bcc6d3cb55b" />


<img width="940" height="753" alt="image" src="https://github.com/user-attachments/assets/7c31ff83-242b-46fc-b9f6-ef9b590fd8a1" />


<img width="940" height="840" alt="image" src="https://github.com/user-attachments/assets/0dc10a3e-2720-45d9-aec9-c04cc900c88d" />


<img width="940" height="213" alt="image" src="https://github.com/user-attachments/assets/1389dafc-7b54-4aef-87ef-04e95df0beaa" />

---

# AWS Deployment

The application is deployed on an AWS EC2 instance.

The deployment server hosts the Docker container that serves the React application through Port 80.

Security Groups were configured to allow:

- HTTP access for application users
- SSH access only from the developer's public IP

This configuration satisfies the assignment requirement of secure server access.


<img width="940" height="199" alt="image" src="https://github.com/user-attachments/assets/106296ca-d8c4-416a-9fcb-73bc091317dd" />

<img width="940" height="611" alt="image" src="https://github.com/user-attachments/assets/9dbb3b1c-4179-4a5f-aaa0-feac33ada701" />

<img width="940" height="847" alt="image" src="https://github.com/user-attachments/assets/c5c5ab28-8d09-4751-b19c-ae9b54db02cf" />

<img width="940" height="355" alt="image" src="https://github.com/user-attachments/assets/d88e3af0-9bf7-4bf9-b0de-499688fb9de9" />

<img width="940" height="413" alt="image" src="https://github.com/user-attachments/assets/32706881-928f-47c1-b0a6-73b1ad617071" />

---

# Monitoring

An open-source monitoring solution was implemented to continuously monitor both the application and the server.

The monitoring stack includes:

## Prometheus

Prometheus collects infrastructure and container metrics from multiple exporters. It continuously scrapes metrics and stores them for analysis.


<img width="940" height="345" alt="image" src="https://github.com/user-attachments/assets/f1815b7d-6261-4251-9b47-d47a89a7b430" />


<img width="940" height="214" alt="image" src="https://github.com/user-attachments/assets/180606e3-52fc-467e-88b6-97f2233ba0fc" />


<img width="940" height="403" alt="image" src="https://github.com/user-attachments/assets/25169e53-a650-4239-b598-a0f93e6afcc4" />

---

## Node Exporter

Node Exporter collects server-level metrics including:

- CPU utilization
- Memory usage
- Disk utilization
- Network statistics
- System load

These metrics are visualized through Grafana dashboards.


<img width="940" height="413" alt="image" src="https://github.com/user-attachments/assets/94b5a7c1-ac02-4ac0-beca-e767b75a9a33" />


<img width="940" height="874" alt="image" src="https://github.com/user-attachments/assets/f96505b1-a0d9-4ac6-aa7f-249fa806c3a9" />


---

## cAdvisor

cAdvisor monitors Docker containers and provides metrics such as:

- Container CPU usage
- Memory consumption
- Container filesystem usage
- Network utilization
- Running container statistics


<img width="940" height="447" alt="image" src="https://github.com/user-attachments/assets/b9b7a671-fa3e-4e8f-a59f-20d85ca4adbb" />

<img width="940" height="510" alt="image" src="https://github.com/user-attachments/assets/27f91a52-5ace-4450-b5af-f2fcc0945fe0" />


<img width="940" height="510" alt="image" src="https://github.com/user-attachments/assets/b6cff5d8-a661-4b7f-ba6e-55ba93ea566b" />

---

## Grafana

Grafana connects to Prometheus and visualizes infrastructure metrics using interactive dashboards.

The imported Node Exporter dashboard provides real-time monitoring for:

- CPU Usage
- Memory Usage
- Disk Usage
- Network Traffic
- System Load


<img width="940" height="410" alt="image" src="https://github.com/user-attachments/assets/d15dd644-6d1b-434c-b4a8-a4cc1d666b57" />


<img width="940" height="241" alt="image" src="https://github.com/user-attachments/assets/02cb9c5b-1cd0-4a48-9394-07b14b5572fa" />


<img width="940" height="591" alt="image" src="https://github.com/user-attachments/assets/407144b9-7c00-4c22-80e4-60c7efc642f9" />


<img width="940" height="419" alt="image" src="https://github.com/user-attachments/assets/06b40f48-3703-4c01-935e-ff33a946e207" />


<img width="940" height="384" alt="image" src="https://github.com/user-attachments/assets/74deaa1b-e748-49b1-839a-3064112c822f" />


<img width="940" height="412" alt="image" src="https://github.com/user-attachments/assets/d4368ad5-a752-4198-abde-3cb31127c684" />


<img width="940" height="450" alt="image" src="https://github.com/user-attachments/assets/d04ef3dc-3dd7-4472-bfce-95632b1b3f5d" />


<img width="940" height="346" alt="image" src="https://github.com/user-attachments/assets/13140796-14fe-4ed9-999f-c0914a3f90b3" />

---

## Uptime Kuma

Uptime Kuma continuously checks application availability by monitoring the deployed application URL.

Features include:

- HTTP health monitoring
- Response time tracking
- Downtime history
- Email notifications
- Real-time availability status


<img width="940" height="640" alt="image" src="https://github.com/user-attachments/assets/1f63c93c-5646-40b6-808e-a26fbb61ffdd" />

<img width="940" height="486" alt="image" src="https://github.com/user-attachments/assets/84929bcf-ead8-4334-894d-e99ee071030d" />

<img width="940" height="566" alt="image" src="https://github.com/user-attachments/assets/a76c55d5-3e5f-41ce-a175-e04b9115273c" />

<img width="940" height="732" alt="image" src="https://github.com/user-attachments/assets/ba2c0006-39dd-41c5-9d13-3194eb8b9aa6" />

<img width="940" height="269" alt="image" src="https://github.com/user-attachments/assets/3de89f79-ac1e-4eb6-9da8-90b2742e5d4c" />

<img width="940" height="342" alt="image" src="https://github.com/user-attachments/assets/710d43f0-dcf7-41bb-abd5-5d2037f0e5ea" />

<img width="940" height="199" alt="image" src="https://github.com/user-attachments/assets/26d0eea2-49a2-49be-a538-35ca0f2e68f4" />

<img width="940" height="359" alt="image" src="https://github.com/user-attachments/assets/53e14ed0-0fe6-4766-910d-4e6f91647a01" />


---

# Notifications

Email notifications are configured using Uptime Kuma.

Whenever the application becomes unavailable, Uptime Kuma automatically sends an email alert containing:

- Monitor name
- Downtime status
- Failure time
- Error details

This provides immediate notification whenever the application experiences downtime.

<img width="940" height="265" alt="image" src="https://github.com/user-attachments/assets/0da5a131-a566-4210-8ab9-e54d1030e861" />

---

# CI/CD Workflow

The complete deployment pipeline follows the workflow below.

```
Developer

↓

Git Push

↓

GitHub Repository

↓

GitHub Webhook

↓

Jenkins Pipeline

↓

Docker Image Build

↓

Docker Hub

↓

AWS EC2 Deployment

↓

Application Available

↓

Prometheus Monitoring

↓

Grafana Dashboard

↓

Uptime Kuma

↓

Email Notification (If Down)
```

---

# Project Deliverables

The following deliverables are included as part of the project submission:

- GitHub Repository
- Dockerfile
- Docker Compose File
- Jenkinsfile
- build.sh
- deploy.sh
- Docker Hub Images
- AWS Deployment
- Prometheus Monitoring
- Grafana Dashboard
- Uptime Kuma Monitoring
- Email Alert Configuration

---

# Screenshots

The repository includes screenshots for:

- Jenkins Dashboard
- Jenkins Pipeline Execution
- AWS EC2 Console
- Security Group Configuration
- Docker Hub Repositories
- Running Docker Containers
- Application Deployment
- Prometheus Targets
- Grafana Dashboard
- Uptime Kuma Dashboard
- Email Alert Notification

---
