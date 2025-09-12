# Cloud Resume Challenge - AWS Implementation

This project is my submission for the **Cloud Resume Challenge**, where the goal is to deploy a personal resume website on the cloud using **AWS services** and demonstrate basic cloud engineering skills.

---

## Table of Contents

- [Project Overview](#project-overview)  
- [Architecture](#architecture)  
- [AWS Services Used](#aws-services-used)  
- [Features](#features)  
- [Setup & Deployment](#setup--deployment)  
- [Usage](#usage)  
- [License](#license)  

---

## Project Overview

The **Cloud Resume Challenge** is designed to showcase cloud skills by building a resume website hosted on the cloud. This project focuses on:

- Hosting a static website with a resume.
- Using cloud-native services to handle storage, content delivery, and data analytics.
- Automating deployments with Infrastructure as Code (IaC) and CI/CD pipelines.
- Implementing a visitor counter to track website traffic.

---

## Architecture

The website is deployed using the following architecture:

1. **S3 Bucket** – Hosts the static website content (HTML, CSS, JS).  
2. **CloudFront CDN** – Distributes content globally with low latency.  
3. **Route 53** – Provides a custom domain name and DNS management.  
4. **DynamoDB** – Stores visitor count data.  
5. **Lambda Function** – Updates the visitor counter in DynamoDB on each page visit.  
6. **IAM Roles & Policies** – Ensures secure access for AWS resources.  

*Optional:* A CI/CD pipeline (using GitHub Actions) automatically deploys updates to the S3 bucket.

---

## AWS Services Used

- **Amazon S3** – Static website hosting  
- **Amazon CloudFront** – Content Delivery Network (CDN)  
- **Amazon Route 53** – DNS management  
- **AWS Lambda** – Serverless functions for visitor counter  
- **Amazon DynamoDB** – NoSQL database for storing visitor data  
- **AWS IAM** – Security and access management  
- **AWS Certificate Manager (ACM)** – SSL/TLS certificate for HTTPS  

---

## Features

- Fully **static resume website** hosted on AWS S3  
- **Visitor counter** updated in real-time using AWS Lambda and DynamoDB  
- **Global content delivery** with CloudFront CDN  
- **Custom domain support** via Route 53  
- **Automated deployment** via GitHub Actions (CI/CD pipeline)  
- **Secure access** with HTTPS (ACM certificate)

---
