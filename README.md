# Terraform AWS Infrastructure Provisioning

This project uses **Terraform** to provision and manage key AWS resources, including **VPCs**, **Subnets**, **Security Groups**, **EC2 Instances**, and a fully functional **EKS (Elastic Kubernetes Service)** cluster. It also supports automatic deployment of **Docker containers** and includes reusable modules to streamline infrastructure management.

---

## 🚀 Features

1. **Provision Key AWS Resources**  
   Create VPCs, public and private subnets, internet gateways, and route tables.

2. **Reusable Terraform Modules**  
   Modular structure for:
   - VPC
   - EC2 Instances
   - Security Groups
   - EKS Cluster

3. **EC2 & Docker Automation**  
   - Deploy EC2 instances with specified configurations.
   - Automatically install and run Docker containers using `user_data` scripts.

4. **Elastic Kubernetes Service (EKS)**  
   - Create and configure an EKS cluster.
   - Manage node groups with auto-scaling.
   - Pass required subnets, VPCs, IAM roles, and tags.

5. **Remote State Management**  
   - Store Terraform state files in an AWS S3 bucket.
   - Configure state locking using DynamoDB to prevent concurrent modifications.

6. **CI/CD Integration**  
   - Automate provisioning and deployment through a CI/CD pipeline.
   - Jenkinsfile can be adjusted to include Terraform steps for provisioning and Docker deployment.

---

## 📁 Project Structure

