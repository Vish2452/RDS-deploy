# AWS DevOps Engineer — Complete Training Plan (2026 Edition)

> **Goal:** End-to-end hands-on training with **real-time projects per topic**.  
> **Duration:** ~16–20 weeks (adjustable).  
> **Approach:** Each module ends with a deployable project; projects build on each other so that by the end the trainee has a **production-grade portfolio**.

---

## Training Roadmap — Module Overview

| # | Module | Duration | Real-Time Project |
|---|--------|----------|-------------------|
| 1 | Linux Fundamentals | 1 week | Server hardening & automation on EC2 |
| 2 | Shell Scripting | 1 week | 15 production scripts (backup, monitoring, deploy) |
| 3 | Git & GitHub | 1 week | Team GitFlow simulation with PR reviews |
| 4 | AWS Core Services | 3 weeks | Scalable 3-tier web app on AWS |
| 5 | AWS Advanced / Networking | 2 weeks | Multi-Region VPC with Transit Gateway |
| 6 | Docker | 1.5 weeks | Microservices voting app with Trivy scanning |
| 7 | Jenkins CI/CD | 1.5 weeks | Full pipeline: build → test → scan → deploy |
| 8 | GitHub Actions CI/CD | 1 week | OIDC-based Terraform + app deployment |
| 9 | Terraform (IaC) | 2 weeks | Multi-env infra with modules & remote state |
| 10 | Kubernetes | 3 weeks | Production EKS cluster with monitoring |
| 11 | Monitoring & Observability | 1 week | Prometheus + Grafana + EFK on K8s |
| 12 | Security & Compliance | 0.5 week | DevSecOps pipeline with SonarQube + Trivy |
| 13 | Capstone Project | 1 week | End-to-end banking/e-commerce app |

---

## MODULE 1 — Linux Fundamentals (1 Week)

### Topics
- Linux architecture (kernel, shell, file system hierarchy)
- **200 essential commands** grouped by category:
  - File & Directory: `ls, cd, cp, mv, rm, mkdir, find, locate, stat, file, tree`
  - Permissions: `chmod, chown, chgrp, umask, getfacl, setfacl`
  - Text Processing: `cat, less, head, tail, grep, awk, sed, cut, sort, uniq, wc, tr, diff`
  - Process Management: `ps, top, htop, kill, nice, nohup, bg, fg, jobs, systemctl`
  - Disk & Storage: `df, du, mount, umount, lsblk, fdisk, mkfs, blkid`
  - Networking: `ip, ss, netstat, curl, wget, ping, traceroute, nslookup, dig, scp, rsync`
  - User Management: `useradd, usermod, userdel, passwd, groupadd, id, who, w, last`
  - Package Management: `apt, yum, dnf, rpm, dpkg, snap`
  - Archives: `tar, gzip, zip, unzip, bzip2, xz`
  - System Info: `uname, hostname, uptime, free, vmstat, iostat, dmesg, lscpu`
  - Cron & Scheduling: `crontab, at, systemd timers`
  - SSH & Security: `ssh, ssh-keygen, ssh-copy-id, sshd_config, iptables, ufw, firewalld`

### Tasks (5 Practical Exercises)
1. **Task 1** — Provision an EC2 instance, SSH in, explore file system hierarchy
2. **Task 2** — Create users, groups, set file permissions & ACLs
3. **Task 3** — Set up a cron job to rotate logs and email alerts
4. **Task 4** — Configure firewall rules (iptables/ufw) and harden SSH
5. **Task 5** — Install and configure Nginx, troubleshoot service issues using logs

### Real-Time Project: **EC2 Server Hardening & Automation**
- Launch Amazon Linux 2023 EC2
- Harden SSH (key-only, non-default port, fail2ban)
- Set up automated log rotation, disk monitoring cron jobs
- Configure firewall rules
- Deliverable: Documented hardened server ready for application deployment

---

## MODULE 2 — Shell Scripting (1 Week)

### Topics
- Bash fundamentals: variables, data types, quoting
- Control structures: `if/elif/else`, `case`, `for`, `while`, `until`
- Functions, return values, local variables
- Arrays, associative arrays
- String manipulation, regex with `grep`/`sed`/`awk`
- Exit codes, error handling, `set -euo pipefail`
- Input: `read`, positional parameters, `getopts`
- File descriptors, redirection, pipes
- Process substitution, subshells
- Debugging: `set -x`, `trap`, `shellcheck`

### 15 Interview-Essential Shell Scripts
| # | Script | Concepts Covered |
|---|--------|-----------------|
| 1 | **Automated Backup to S3** | `aws cli`, `tar`, cron, date formatting |
| 2 | **Log Analyzer** | `awk`, `grep`, `sort`, associative arrays |
| 3 | **Disk Usage Alert** | `df`, `mail`, conditionals, threshold checks |
| 4 | **User Account Manager** | `useradd`, functions, input validation |
| 5 | **Service Health Checker** | `systemctl`, loops, exit codes |
| 6 | **AWS EC2 Start/Stop Scheduler** | `aws ec2`, `jq`, cron |
| 7 | **Deployment Script** | `git pull`, `rsync`, rollback logic, lock files |
| 8 | **SSL Certificate Expiry Checker** | `openssl`, date arithmetic |
| 9 | **Docker Cleanup Script** | `docker system prune`, dangling images |
| 10 | **MySQL/PostgreSQL DB Backup & Restore** | `pg_dump`, `mysqldump`, compression |
| 11 | **Password Generator** | `/dev/urandom`, `tr`, string slicing |
| 12 | **Bulk File Renamer** | `mv`, regex, parameter expansion |
| 13 | **AWS Resource Inventory** | `aws ec2 describe-*`, `jq`, CSV output |
| 14 | **Terraform Wrapper** | `getopts`, environment switching, `terraform` CLI |
| 15 | **CI/CD Pipeline Trigger** | `curl`, GitHub API, webhooks, JSON parsing |

### Real-Time Project: **Automated AWS Cost Optimization Script**
- Script that identifies unused EBS volumes, unattached Elastic IPs, idle EC2 instances
- Generates daily cost report and emails via SNS
- Runs as a cron job on a management EC2 or Lambda

---

## MODULE 3 — Git & GitHub (1 Week)

### Topics
- Distributed vs Centralized VCS — why Git won
- Git internals: objects, refs, HEAD, index
- **Git Flow** — `main`, `develop`, `feature/*`, `release/*`, `hotfix/*`
- **Trunk-based development** (modern alternative)
- Core commands: `init, clone, add, commit, push, pull, fetch, log, diff, status, branch, checkout, switch`
- `git stash` — save, pop, list, drop, apply
- `git revert` vs `git reset` (soft/mixed/hard)
- `git merge` vs `git rebase` — when to use each
- `git cherry-pick`
- **Branching & merging strategy** for teams
- `.gitignore`, `.gitattributes`
- **Git hooks** — pre-commit, pre-push, commit-msg (with Husky)
- **Pull Requests** — code review, approval rules, branch protection
- **Resolving merge conflicts** — manual and with VS Code
- **Forking workflow** for open-source contributions
- **Git tags** — lightweight vs annotated, semantic versioning
- **Managing GitHub in real-time release** — release branches, hotfixes, changelog generation
- **GitHub CLI** (`gh`) — PR creation, issue management from terminal
- **Signed commits** with GPG

### Real-Time Project: **Team GitFlow Simulation**
- Create a GitHub org with 3 repos (frontend, backend, infra)
- Branch protection rules, required reviews, status checks
- Simulate feature development → PR → code review → merge → release tagging
- Practice conflict resolution and hotfix flow
- Deliverable: Documented branching strategy + working repo with history

---

## MODULE 4 — AWS Core Services (3 Weeks)

### Week 1: Compute, Storage & Identity

#### IAM (Identity & Access Management)
- Users, groups, roles, policies (AWS managed vs customer managed vs inline)
- **IAM policy structure** — Effect, Action, Resource, Condition
- **Least privilege principle** — practical implementation
- **IAM role switching** between accounts (cross-account access)
- **OIDC federation** — GitHub Actions, Google, etc.
- **Service-linked roles**
- **IAM Access Analyzer** & credential reports
- **SCP (Service Control Policies)** with AWS Organizations
- **Identity Center (SSO)** — modern approach to multi-account access

#### S3 (Simple Storage Service)
- Buckets, objects, prefixes, versioning
- **Storage classes** — Standard, IA, One Zone-IA, Intelligent-Tiering, Glacier, Glacier Deep Archive
- **Lifecycle policies** — transition and expiration rules
- **Bucket policies vs ACLs** vs IAM policies
- **S3 access points** — simplifying access for shared datasets
- **Pre-signed URLs** — temporary access
- **S3 event notifications** → Lambda / SQS / SNS
- **S3 Transfer Acceleration**
- **Cross-Region Replication (CRR)**
- Static website hosting on S3

#### EC2 & Compute
- Instance types, AMI (Amazon Machine Image), key pairs
- **EBS (Elastic Block Store)** — gp3, io2, snapshots, encryption
- **EFS (Elastic File System)** — shared NFS across instances
- **Instance Store** — ephemeral storage
- **EBS vs EFS vs Instance Store** — when to use what
- **Spot instances, Reserved instances, Savings Plans**
- **Placement groups** — cluster, spread, partition
- **User data** — bootstrap scripts
- **AMI creation** — golden image pipeline

#### Backup
- **AWS Backup** — centralized backup across services
- **Backup plans, vaults, lifecycle rules**
- **Cross-region & cross-account backups**
- **Point-in-time recovery** for RDS

### Week 2: Networking, Load Balancing & Auto Scaling

#### VPC (Virtual Private Cloud)
- VPC, subnets (public/private), route tables, internet gateway
- **NAT Gateway** vs NAT Instance — cost and architecture
- **VPC Peering** — cross-account, cross-region
- **Transit Gateway** — hub-and-spoke for multi-VPC
- **VPC Endpoints** — Gateway (S3, DynamoDB) vs Interface (PrivateLink)
- **VPC Flow Logs** — capture, analyze with CloudWatch/Athena
- **Network ACLs vs Security Groups** — stateless vs stateful
- **IP ranges & CIDR** — designing VPC addressing
- **Bastion Host / Jump Server** — secure access pattern
- **VPN Gateway** vs **Direct Connect** — when to use each
- **Private vs Public IP addresses** — identifying and assigning

#### Load Balancing
- **ALB (Application Load Balancer)** — HTTP/HTTPS, path-based, host-based routing
- **NLB (Network Load Balancer)** — TCP/UDP, ultra-low latency
- **GLB (Gateway Load Balancer)** — third-party appliances
- **Algorithms** — Round Robin, Least Outstanding Requests, Flow Hash
- **Target groups** — instance, IP, Lambda
- **Health checks** — configuration and troubleshooting
- **SSL/TLS termination** with ACM (AWS Certificate Manager)
- **Sticky sessions**
- **Cross-zone load balancing**

#### Auto Scaling
- **Auto Scaling Groups (ASG)** — launch templates, scaling policies
- **Dynamic scaling** — target tracking, step scaling, simple scaling
- **Predictive scaling**
- **Scheduled scaling**
- **Scaling cooldowns**
- **ASG + ALB/NLB integration**
- **Lifecycle hooks** — custom actions on launch/terminate

### Week 3: Database, DNS, Serverless & Monitoring

#### RDS (Relational Database Service)
- MySQL, PostgreSQL, MariaDB, Oracle, SQL Server, Aurora
- **Multi-AZ** — high availability
- **Read Replicas** — horizontal read scaling
- **IAM database authentication**
- **RDS Proxy** — connection pooling
- **Performance Insights**
- **Automated backups & snapshots**
- **Encryption** at rest (KMS) and in transit (SSL)

#### Route 53
- **Domain registration & management**
- **Hosted zones** — public vs private
- **Record types** — A, AAAA, CNAME, ALIAS, MX, TXT, SRV
- **Routing policies** — Simple, Weighted, Latency, Failover, Geolocation, Multi-value
- **Health checks** and DNS failover
- **Domain → ALB/NLB → EC2** flow
- **Website hosting** with S3 + CloudFront + Route 53

#### Lambda (Serverless)
- **Event-driven architecture**
- **Triggers** — API Gateway, S3, SQS, DynamoDB Streams, CloudWatch Events
- **Lambda layers** — shared code/libraries
- **Environment variables & secrets**
- **Concurrency** — reserved vs provisioned
- **Cold start optimization**
- **Lambda@Edge** — CloudFront integration
- **Step Functions** — state machine orchestration

#### CloudWatch, SNS, CloudFront & CloudTrail
- **CloudWatch Metrics** — standard vs custom
- **CloudWatch Logs** — log groups, log streams, metric filters
- **CloudWatch Alarms** — thresholds, anomaly detection
- **CloudWatch Dashboards**
- **SNS** — topics, subscriptions (email, SMS, Lambda, SQS)
- **CloudFront** — CDN, distributions, behaviors, cache invalidation
- **CloudTrail** — API logging, event history, S3 log storage

#### KMS (Key Management Service)
- **Customer managed keys (CMK)** vs AWS managed keys
- **Envelope encryption**
- **Key policies & grants**
- **KMS with S3, EBS, RDS, Secrets Manager**

#### EKS (Elastic Kubernetes Service) — Overview
- Why EKS, managed vs self-managed node groups, Fargate profiles
- (Detailed in Kubernetes module)

### 21 AWS Practical Scenarios

| # | Scenario | Services Used |
|---|----------|--------------|
| 1 | How to take backup — automated cross-region | AWS Backup, S3, RDS Snapshots |
| 2 | AWS cost optimization | Cost Explorer, Trusted Advisor, Shell Script |
| 3 | Bastion Host (Jump server) setup | EC2, VPC, Security Groups, SSH |
| 4 | Connect EC2 in Account A to RDS in Account B | VPC Peering, IAM Role Switching, SG rules |
| 5 | Scalable NLB project with EC2, VPC, Route53 & SSL | NLB, ASG, ACM, Route 53 |
| 6 | VPN Gateway vs Direct Connect demo | VPN, Site-to-Site comparison |
| 7 | EBS vs EFS — shared storage demo | EBS, EFS, EC2 |
| 8 | ECR + ECS — deploy Docker containers on AWS | ECR, ECS Fargate, ALB |
| 9 | Serverless banking app | API Gateway, Lambda, S3, DynamoDB, CloudFormation |
| 10 | Identify private vs public IP addresses | VPC, EC2, `curl ifconfig.me` |
| 11 | IAM policies — secure resource access | IAM, S3, policy simulator |
| 12 | IAM role switching across accounts | IAM, STS, AWS Organizations |
| 13 | KMS encryption demo | KMS, S3, EBS |
| 14 | Multi-Region Transit Gateway + 3 VPCs | Transit Gateway, VPC, Route Tables |
| 15 | NAT Gateway setup | VPC, NAT-GW, private subnets |
| 16 | VPC Flow Logs analysis | VPC, CloudWatch Logs, Athena |
| 17 | VPC Endpoints for S3 | VPC, Gateway Endpoint, S3 |
| 18 | Static website on S3 + CloudFront | S3, CloudFront, Route 53, ACM |
| 19 | IP ranges & CIDR design | VPC, subnets |
| 20 | Access a specific S3 bucket via policy | IAM, S3 Bucket Policy |
| 21 | Auto Scaling Group with SNS notifications | ASG, SNS, CloudWatch |

### Real-Time Project: **Scalable 3-Tier Web Application on AWS**
- **Architecture:** Route 53 → CloudFront → ALB → ASG (EC2) → RDS Multi-AZ
- S3 for static assets, EFS for shared file storage
- IAM roles with least privilege, KMS encryption
- CloudWatch alarms + SNS notifications
- AWS Backup automated schedules
- VPC with public/private subnets, NAT Gateway, Bastion Host
- Deliverable: Fully deployed, auto-scaling, monitored web application

---

## MODULE 5 — AWS Advanced Networking (2 Weeks)

### Real-Time Project: **Multi-Region VPC Architecture with Transit Gateway**
- 3 VPCs across 2 regions connected via Transit Gateway
- VPC Flow Logs → CloudWatch → Athena for analysis
- VPN Gateway for on-premises simulation
- VPC Endpoints for S3 and DynamoDB
- NAT Gateway for private subnet internet access
- Bastion Host with Session Manager alternative
- Cross-account RDS access (Account A EC2 → Account B RDS)
- Deliverable: Production-grade multi-region network architecture

---

## MODULE 6 — Docker (1.5 Weeks)

### Topics
- Docker architecture — daemon, client, registry, images, containers
- **Dockerfile deep-dive:**
  - `FROM`, `RUN`, `COPY` vs `ADD`, `CMD` vs `ENTRYPOINT`, `EXPOSE`, `WORKDIR`, `USER`
  - `ARG` vs `ENV` — build-time vs runtime
  - `.dockerignore`
- **Multi-stage builds** — minimize image size
- **Google Distroless images** — security-first approach
- **Dangling images** — what they are, how to clean
- **Docker commands:**
  - `build, run, exec, logs, ps, stop, rm, rmi, inspect, network, volume`
  - `docker system prune`, `docker image prune`
- **Docker Compose** — multi-container applications
- **Volumes & Bind Mounts** — persisting data, differences
- **Docker networking** — bridge, host, none, overlay
- **Docker Secrets** — managing sensitive data, mounting secrets from files
- **Changing default Docker data directory** (`/var/lib/docker` → custom path)
- **Manually inspecting Docker images** — `docker inspect`, `dive`, layer analysis
- **Trivy** — vulnerability scanning for images
- **Docker registries** — Docker Hub, AWS ECR, GitHub Container Registry (GHCR)

### Real-Time Project: **Microservices Voting App with Security Scanning**
- Docker Compose-based voting app (Python, Node.js, Redis, PostgreSQL, .NET worker)
- Custom Dockerfiles with multi-stage builds and distroless base images
- Trivy scanning integrated into CI pipeline
- Docker secrets for database credentials
- Push images to AWS ECR
- Deliverable: Secure, optimized, multi-service Docker application

---

## MODULE 7 — Jenkins CI/CD (1.5 Weeks)

### Topics
- **Jenkins setup** — installation, initial configuration, dashboard overview
- **Architecture** — Master/Controller + Agent/Slave nodes
- **Pipelines:**
  - Freestyle projects vs Pipeline (Declarative vs Scripted)
  - `Jenkinsfile` — stages, steps, post actions
  - Shared Libraries
- **Plugins** — Blue Ocean, Git, Docker, SonarQube, Slack, Credentials
- **Credentials management** — types, scopes, best practices
- **RBAC** — Role-Based Access Control with Matrix auth / Role Strategy plugin
- **Build workspace** — how Jenkins manages job workspaces
- **WAR vs JAR** — deployment formats
- **Webhooks** — GitHub → Jenkins trigger, webhook security (HMAC)
- **Integrations:**
  - Docker builds within Jenkins
  - SonarQube for code quality
  - Nexus/Artifactory as artifact repository
  - Slack/Teams notifications
- **Troubleshooting** — build failures, agent connectivity, plugin conflicts
- **Jenkins security** — CSRF, script console, API tokens

### CI/CD Pipeline Steps (Developer Side → Deployment Side)
```
Developer Side:
  Git Checkout → Compile → Unit Test → Code Quality (SonarQube) → 
  Security Scan (Trivy) → Build Docker Image → Push to Registry

Deployment Side:
  Pull Image → Deploy to Staging → Integration Tests → 
  Approval Gate → Deploy to Production → Smoke Tests → 
  Notify Team (Slack/SNS)
```

### Real-Time Project: **Complete Jenkins Pipeline for Java Microservice**
- Java Spring Boot app built with Maven
- Jenkins multi-branch pipeline with `Jenkinsfile`
- SonarQube quality gate check
- Docker build → Trivy scan → Push to ECR
- Deploy to ECS/EKS staging
- Manual approval → Production deploy
- Slack notifications on build status
- Deliverable: Production CI/CD pipeline with security gates

---

## MODULE 8 — GitHub Actions CI/CD ⭐ (1 Week)

> **This is a highly demanded modern skill — many companies are migrating from Jenkins to GitHub Actions.**

### Topics
- **Why GitHub Actions** — native integration, YAML-based, marketplace
- **Core concepts:**
  - Workflows, Jobs, Steps, Actions
  - Triggers: `push`, `pull_request`, `workflow_dispatch`, `schedule`, `repository_dispatch`
  - `on` event filters — branches, paths, tags
- **Runners:**
  - GitHub-hosted vs Self-hosted runners
  - Runner labels, groups
  - **EC2 self-hosted runner setup** (like your existing project!)
- **YAML syntax deep-dive:**
  - `env`, `secrets`, `needs`, `if` conditionals
  - Matrix builds — multi-version testing
  - Reusable workflows (`workflow_call`)
  - Composite actions
- **OIDC authentication with AWS** — no static credentials!
  - `aws-actions/configure-aws-credentials`
  - IAM role assumption via OIDC
- **Secrets & Variables** — repo, environment, org levels
- **Environments** — protection rules, required reviewers, deployment gates
- **Artifacts** — upload/download between jobs
- **Caching** — dependencies (npm, pip, Maven)
- **GitHub Container Registry (GHCR)** — build and push images
- **GitHub Actions Marketplace** — popular actions
- **Security hardening:**
  - `permissions` block — least privilege for `GITHUB_TOKEN`
  - Pin actions to SHA instead of tags
  - `Dependabot` for action version updates
  - OpenSSF Scorecard

### Workflow Examples to Build
| # | Workflow | Description |
|---|---------|-------------|
| 1 | **CI Pipeline** | Lint → Test → Build → Docker → Push to ECR |
| 2 | **Terraform Pipeline** | Plan on PR → Apply on merge → Destroy on dispatch |
| 3 | **Kubernetes Deploy** | Build → Push → Update K8s manifest → Deploy to EKS |
| 4 | **Serverless Deploy** | Test → Package → Deploy Lambda via SAM/CDK |
| 5 | **Security Scan** | Trivy image scan + SonarQube analysis |
| 6 | **Release Pipeline** | Semantic versioning → Changelog → GitHub Release |
| 7 | **Multi-Env Deploy** | Dev → Staging → Manual Approval → Production |
| 8 | **Scheduled Cleanup** | Cron-based AWS resource cleanup |

### Real-Time Project: **Full CI/CD with GitHub Actions (mirrors your RDS-deploy project!)**
- **Workflow 1:** Terraform plan/apply for AWS infrastructure (VPC, RDS, ECS)
- **Workflow 2:** Application build → Docker image → ECR → ECS Fargate deploy
- **Workflow 3:** Liquibase database migration on merge to main
- OIDC-based AWS authentication (no secrets for AWS credentials)
- Environment-based deployment gates (dev → staging → prod)
- Slack/Teams notification on deploy
- Deliverable: Zero-credential, multi-workflow CI/CD for infra + app + DB

---

## MODULE 9 — Terraform (IaC) (2 Weeks)

### Topics
- **Why Terraform** — multi-cloud, declarative, state management
- **Terraform workflow:** `init` → `validate` → `plan` → `apply` → `destroy`
- **Files:**
  - `main.tf`, `variables.tf`, `outputs.tf`, `providers.tf`, `versions.tf`
  - `terraform.tfvars`, `*.auto.tfvars`
  - `.terraform.lock.hcl` — dependency lock
- **State file:**
  - What it contains, why it's critical
  - `terraform.tfstate` — never commit to Git!
  - **Remote state** — S3 + DynamoDB locking
  - **State commands** — `show`, `list`, `mv`, `rm`, `pull`, `push`
- **Resources & Data Sources** — create vs read
- **Variables** — string, number, bool, list, map, object, validation
- **Outputs** — referencing across modules
- **Locals** — computed values
- **Expressions & Functions** — `lookup`, `merge`, `concat`, `templatefile`, `cidrsubnet`
- **Meta-arguments:** `count`, `for_each`, `depends_on`, `lifecycle`, `provider`
- **Provisioners** — `local-exec`, `remote-exec`, `file` (use sparingly!)
- **Null resource & triggers** — run arbitrary actions
- **Modules:**
  - Creating reusable modules
  - Module registry (public & private)
  - Module composition patterns
- **Backend configuration** — S3, Consul, Terraform Cloud
- **Workspaces** — dev/staging/prod isolation
- **Import** — bring existing resources under Terraform
- **Drift detection** — `plan` detects configuration drift
- **Log storage** — `TF_LOG`, `TF_LOG_PATH`
- **AWS key management integration** — KMS for encryption
- **Commands cheat sheet:**
  - `init, plan, apply, destroy, fmt, validate, console, graph, output, refresh, taint, untaint, import, state`

### Real-Time Project: **Multi-Environment AWS Infrastructure with Modules**
- Custom Terraform modules: VPC, EC2, RDS, ALB, ASG, S3
- Workspaces for dev/staging/prod
- Remote state in S3 with DynamoDB locking
- **GitHub Actions** pipeline: Plan on PR → Apply on merge
- Import existing resources, handle drift
- Deliverable: Reusable, modular Terraform codebase deployed across 3 environments

---

## MODULE 10 — Kubernetes (3 Weeks)

### Week 1: Fundamentals

#### Basics
- **Docker vs Kubernetes** — single container vs orchestration
- **What is Kubernetes** — definition, why K8s, importance
- **Architecture:**
  - **Control Plane** — API Server, etcd, Scheduler, Controller Manager, Cloud Controller Manager
  - **Worker Node** — kubelet, kube-proxy, container runtime (containerd)
- **Pod** — smallest deployable unit, multi-container pods, sidecar pattern
- **Master vs Worker nodes** — roles and responsibilities
- **kubectl** — `get, describe, apply, delete, logs, exec, port-forward, top`

#### Installation & Setup
- Minikube (local)
- kind (Kubernetes in Docker)
- kubeadm (bare-metal / EC2)
- **EKS** (AWS managed) — eksctl, managed node groups, Fargate

#### Workloads
| Resource | Purpose |
|----------|---------|
| **ReplicaSet** | Ensures desired number of pod replicas |
| **Deployment** | Declarative updates, rolling updates, rollbacks |
| **StatefulSet** | Ordered deployment, stable network IDs (databases) |
| **DaemonSet** | One pod per node (monitoring agents, log collectors) |
| **Job** | Run-to-completion workloads (batch processing) |
| **CronJob** | Scheduled jobs (backups, cleanup) |

### Week 2: Networking, Storage & Configuration

#### Services & Networking
- **ClusterIP** — internal-only service
- **NodePort** — expose on node's IP
- **LoadBalancer** — cloud provider LB integration
- **Headless Service** — direct pod DNS access (StatefulSets)
- **DNS in Kubernetes** — CoreDNS, service discovery
- **CNI (Container Network Interface)** — Calico, Flannel, AWS VPC CNI
- **Pod-to-Pod communication** — same node, cross node
- **Ingress:**
  - Ingress resource + Ingress Controller
  - NGINX Ingress, AWS ALB Ingress Controller
  - Path-based and host-based routing
  - TLS termination

#### Storage & Configuration
- **Volumes** — emptyDir, hostPath
- **Persistent Volume (PV)** — cluster-level storage
- **Persistent Volume Claim (PVC)** — pod-level request
- **Storage Class** — dynamic provisioning (EBS CSI, EFS CSI)
- **Dynamic Provisioning** — automatic PV creation
- **ConfigMap** — non-sensitive configuration
- **Secret** — base64-encoded sensitive data (use External Secrets Operator for production!)
- **Environment Variables** — from ConfigMap, Secret, fieldRef
- **Volume Mounts** — inject ConfigMap/Secret as files

### Week 3: Security, Scheduling, Advanced Topics

#### Security
- **RBAC** — Role, ClusterRole, RoleBinding, ClusterRoleBinding
- **Service Account** — pod identity, IRSA on EKS
- **Network Policies** — restrict pod-to-pod traffic (Calico)
- **TLS Certificates** — cert-manager, Let's Encrypt
- **Pod Security Standards** — restricted, baseline, privileged
- **Secrets management** — AWS Secrets Manager CSI driver, External Secrets

#### Scheduling & Resources
- **Node Selector** — schedule pods on specific nodes
- **Taints and Tolerations** — repel pods from nodes
- **Affinity and Anti-Affinity** — fine-grained scheduling
- **Resource Requests and Limits** — CPU, memory guarantees
- **Pod Priority and Preemption**
- **Horizontal Pod Autoscaler (HPA)** — scale based on metrics
- **Vertical Pod Autoscaler (VPA)** — right-size requests

### Real-Time Project: **Production EKS Cluster with Full Application Stack**
- EKS cluster provisioned via Terraform (Module 9 integration)
- Application deployment: frontend (React/Next.js) + backend (Node.js/Java) + database (PostgreSQL StatefulSet or RDS)
- Ingress with AWS ALB Ingress Controller + TLS via cert-manager
- ConfigMap/Secrets for config, IRSA for AWS access
- HPA for auto-scaling, resource limits set
- Network Policies to restrict traffic
- Deliverable: Production-grade EKS cluster running a real application

---

## MODULE 11 — Monitoring & Observability (1 Week)

### Topics

#### Prometheus & Grafana
- Prometheus architecture — scraping, PromQL, alerting rules
- Grafana dashboards — pre-built dashboards for K8s, Node, Docker
- **kube-prometheus-stack** — Helm-based all-in-one setup
- Alert Manager — route alerts to Slack, PagerDuty, email

#### EFK Stack (Elasticsearch, Fluentd/Fluent Bit, Kibana)
- Centralized logging architecture
- Fluent Bit as DaemonSet on K8s
- Elasticsearch for log storage and search
- Kibana for visualization
- Alternative: **Loki + Promtail + Grafana** (lighter weight)

#### AWS Native Monitoring
- CloudWatch Container Insights for EKS
- X-Ray for distributed tracing
- CloudWatch Logs integration

### Real-Time Project: **Full Observability Stack on EKS**
- Deploy kube-prometheus-stack via Helm
- Set up Grafana dashboards for cluster, node, pod metrics
- Configure alerting rules → Slack notifications
- Deploy EFK or Loki stack for centralized logging
- Create custom application metrics and dashboards
- Deliverable: Observable EKS cluster with metrics, logs, and alerts

---

## MODULE 12 — Security & DevSecOps (0.5 Week)

### Topics & Tools
| Tool | Purpose |
|------|---------|
| **SonarQube** | Static code analysis, quality gates |
| **Trivy** | Container image vulnerability scanning |
| **Snyk** | Open-source dependency scanning |
| **OWASP ZAP** | Dynamic application security testing |
| **Nexus Repository** | Artifact management (Maven, npm, Docker) |
| **HashiCorp Vault** | Secrets management (alternative to AWS Secrets Manager) |
| **Checkov / tfsec** | Terraform security scanning |
| **Falco** | Runtime security for Kubernetes |

### Real-Time Project: **DevSecOps Pipeline**
- GitHub Actions pipeline with security gates at every stage:
  ```
  Code → SonarQube (SAST) → Build → Trivy (Image Scan) → 
  Checkov (IaC Scan) → Deploy Staging → OWASP ZAP (DAST) → 
  Approval → Deploy Production
  ```
- Fail pipeline on critical vulnerabilities
- Deliverable: Security-first CI/CD pipeline

---

## MODULE 13 — Capstone Project (1 Week)

### **End-to-End Serverless Banking Application**

**Architecture:**
```
User → Route 53 → CloudFront → S3 (React Frontend)
                              → API Gateway → Lambda Functions
                                             → DynamoDB (Accounts, Transactions)
                                             → RDS PostgreSQL (Reporting)
                                             → SNS (Notifications)
                                             → SQS (Transaction Queue)
Infrastructure: Terraform modules
CI/CD: GitHub Actions (OIDC)
Monitoring: CloudWatch + Prometheus/Grafana (for EKS variant)
Security: KMS encryption, IAM least privilege, WAF
```

**OR — Microservices E-Commerce on EKS:**
```
User → Route 53 → ALB → NGINX Ingress → EKS Cluster
  ├── Product Service (Node.js)
  ├── Order Service (Python)
  ├── Payment Service (Java)
  ├── Notification Service (Lambda)
  └── PostgreSQL (StatefulSet) + Redis (Cache)

Infrastructure: Terraform (VPC, EKS, RDS)
CI/CD: GitHub Actions → Docker Build → ECR → ArgoCD → EKS
Monitoring: Prometheus + Grafana + Loki
Security: Network Policies, RBAC, Trivy, SonarQube
```

---

## Additional Modern Topics (2026 Must-Haves) ⭐

### Added to Your Curriculum

| Topic | Why It's Important | Where to Cover |
|-------|--------------------|----------------|
| **GitHub Actions** | Replacing Jenkins in many orgs | New Module 8 |
| **ArgoCD / GitOps** | Modern K8s deployment pattern | Module 10 (K8s) |
| **Helm Charts** | K8s package management | Module 10 (K8s) |
| **AWS Secrets Manager + External Secrets Operator** | Modern secrets management | Module 4 & 10 |
| **AWS Identity Center (SSO)** | Multi-account access | Module 4 (IAM) |
| **Service Mesh (Istio/Linkerd)** | Microservice communication | Module 10 (Advanced) |
| **Policy as Code (OPA/Gatekeeper)** | K8s admission control | Module 12 (Security) |
| **Cost Optimization (FinOps)** | Always asked in interviews | Module 4 (AWS) |
| **Terraform Cloud / Spacelift** | Remote Terraform management | Module 9 |
| **Container Orchestration on AWS (ECS Fargate)** | Serverless containers | Module 4 & 6 |
| **Infrastructure Testing (Terratest)** | Test IaC code | Module 9 |
| **Dependabot + Renovate** | Automated dependency updates | Module 8 (GH Actions) |
| **AWS CDK** | Alternative IaC (awareness level) | Module 9 (Brief) |
| **Platform Engineering basics** | Internal Developer Platforms | Module 13 |

### AWS Services Missing from Your List (Added)

| Service | Category | Importance |
|---------|----------|------------|
| **AWS Organizations & SCPs** | Governance | High — multi-account strategy |
| **AWS Identity Center (SSO)** | IAM | High — modern access management |
| **AWS Secrets Manager** | Security | High — secrets rotation |
| **AWS Systems Manager (SSM)** | Operations | High — Session Manager, Parameter Store |
| **AWS Config** | Compliance | Medium — resource compliance rules |
| **AWS GuardDuty** | Security | Medium — threat detection |
| **AWS WAF** | Security | Medium — web app firewall |
| **AWS ECS + Fargate** | Compute | High — serverless containers |
| **AWS ECR** | Containers | High — Docker image registry |
| **AWS CodePipeline/CodeBuild** | CI/CD | Medium — AWS-native CI/CD awareness |
| **AWS DynamoDB** | Database | Medium — serverless NoSQL |
| **AWS SQS** | Messaging | Medium — message queuing |
| **AWS Step Functions** | Orchestration | Medium — serverless workflows |
| **AWS Athena** | Analytics | Low — query S3 data with SQL |
| **AWS Cost Explorer** | FinOps | High — cost analysis |

---

## Interview Preparation Tips

### Top DevOps Interview Scenarios (Practice These)
1. Design a CI/CD pipeline for a microservices application
2. How would you implement zero-downtime deployments?
3. Your production K8s pod is in CrashLoopBackOff — troubleshoot
4. Design a multi-account AWS organization strategy
5. How to handle Terraform state conflicts in a team?
6. Docker image size is 2GB — how to optimize?
7. Explain blue-green vs canary vs rolling deployment
8. RDS is running slow — how to diagnose?
9. How to secure a CI/CD pipeline end-to-end?
10. Design a disaster recovery strategy for a 3-tier app

### Recommended Certifications
- **AWS Solutions Architect Associate (SAA-C03)** — foundational
- **AWS Developer Associate (DVA-C02)** — CI/CD focus
- **AWS DevOps Engineer Professional (DOP-C02)** — ultimate goal
- **CKA (Certified Kubernetes Administrator)** — K8s credibility
- **Terraform Associate (003)** — IaC validation
- **GitHub Actions Certification** — newest, high value

---

## Weekly Schedule Template

| Day | Activity | Hours |
|-----|----------|-------|
| Mon-Fri | Theory + Hands-on Labs | 2-3 hrs/day |
| Sat | Real-Time Project Work | 4-5 hrs |
| Sun | Review + Interview Q&A Practice | 2-3 hrs |

---

## Tools Setup Checklist

- [ ] AWS Free Tier account (or training account)
- [ ] GitHub account with Actions enabled
- [ ] VS Code + extensions (Docker, Terraform, YAML, K8s)
- [ ] Docker Desktop (or Rancher Desktop)
- [ ] Terraform CLI installed
- [ ] kubectl + eksctl installed
- [ ] AWS CLI v2 configured
- [ ] Minikube or kind for local K8s
- [ ] Jenkins (Docker container for lab use)
- [ ] Helm CLI installed

---

*Generated: February 25, 2026 | Based on current industry requirements*
