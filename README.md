# Introduction to Cloud.

-  What is Cloud ?

# About AWS ( Amazon Web Service)

 - Regions
 - Availablity Zones
 - Edge Location
 - Global Services


# VPC

- **IP Address**
  - Private IP
  - Public IP
  - CIDR
  - Subneting 
- VPC
- Subnet
- Routing Table
- Internet Gateway
- NAT Gateway
- NACL
- Security Groups
- DHCP
- DNS
- Endpoint
- VPN
  - Customer Gateway # Todo
  - Virtual Private Gateway # Todo
  - VPN Connections # Todo
- EIP

# IAM

- Groups
- Users
- Roles
- Policy
- Identity providers
- ARN
- Policy Generator
- Encryption Keys ( KMS )

# Computing: EC2, Lambda, EKS, ECS, Beanstalk, Batch

## EC2

- Ondemand Instance
  - AMI
  - Instance Type
  - VPC
  - Subnet
  - Public IP / EIP
  - EBS
  - Key-pair
  - ENI
  - **userdata**
 

- Spot Instances
- Reserved Instances
- Dedicated Instanes

- **Autoscalling**
  - Configuration Templates
  - Scale out
  - Scale in
  - Cloud watch matrics and relations
  
- **SSM**
  - Document 
  - Session
  - Patching
  - Inventory
  

# Images and Snaphots

- AMI ( Private and Public )
- Snapshots

# Storage

- EBS [ Block Storage ]
 - GP2
 - Provisoned IOPS
 
- EFS [ File Storage ]
 - Provissioned Throuput
 - MaxIO/Standard
 
- S3 [ Object Storage ]

# Loadbalancer

- ALB [ Application Load Balancer ]
- NLB [Network Load Balancer ]
- Target Groups
- Listners
- L7 Policies
- Certificate and SNI

# Auto Scalling

- Scalling group
- Launch configuration
- Scalling policy based

# Route 53 [ DNS ]

- Hosted zone
- Record sets
  - A
  - CNAME
  - NS
  - MX
  - TXT
  - Alias ( A/CNAME )
- Subdomain
- DNS Routing Policy

# ACM
 - Private Certificate
 - Public Certificate [ ssl public encryption ]
 - Certificate for Cloudfront. 
 
# Cloud Watch
 - Metrics
 - Logs
 - Alerts
 - Custome Metrics
 - Dashboard

# SNS [Notification]
 - Topics
 - Subscriptions

# SES [ Email ]
 - Email
 - SMTP
 - Domain
 
# Cloudfront
 - Distribution 
 - Custome Domian

# Elastic Cache
 - Redis
 - Redis Cluster
 
# Database
 - RDS 
   - MySQL
   - MSSQL
   - POSTGRES
   - MariaDB
   - Aurora
 - DynamoDB
 - DocumentDB
 
 # SQS
  - Queues Types
  
 # Codecommit
  - Access Control
  - SSH vs HTTPS access
  - Git Repo
  
 # IAC, CLI and SDK
  - awscli
  - SDK ( python )
  - Terraform 
  - Cloudformation Template
  
 # LAB and TEST
  - Examples
    - Script
    - Application Deployment
    - Teraform Code 
    - Lambda python script

 
 
  
