# AWS DevOps Engineer — Complete Training Plan (2026 Edition)

> **Goal:** End-to-end hands-on training with **real-time projects per topic**.  
> **Duration:** ~18–22 weeks (adjustable).  
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
| 9A | **Liquibase (DB Migrations)** | 1 week | RDS schema CI/CD with GitHub Actions |
| 10 | Kubernetes | 3 weeks | Production EKS cluster with monitoring |
| 11 | Monitoring & Observability | 1 week | Prometheus + Grafana + EFK on K8s |
| 12 | Security & Compliance | 0.5 week | DevSecOps pipeline with SonarQube + Trivy |
| 13 | **Lambda + Glue + Data Infra** | 1.5 weeks | Serverless ETL pipeline + Data Lake |
| 14 | Capstone Projects | 1.5 weeks | CDP / E-Commerce / Banking (pick one) |

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

## MODULE 9A — Liquibase: Database Schema Management & CI/CD ⭐ (1 Week)

> **Real-world projects always need database migration tooling. This module uses YOUR existing RDS-deploy project as the training lab!**

### Why Liquibase?
- Manual SQL scripts don't track state — Liquibase does
- Version-controlled, repeatable, auditable database changes
- Integrates into CI/CD pipelines (GitHub Actions, Jenkins)
- Supports rollback, tagging, diff, and drift detection
- Industry alternatives: Flyway, Atlas, golang-migrate, Alembic (Python)

### Topics

#### Liquibase Fundamentals
- **Architecture** — changelog, changeset, DATABASECHANGELOG tracking table
- **Changelog formats:**
  - SQL formatted (`--liquibase formatted sql`) ← most common in DevOps
  - YAML
  - XML
  - JSON
- **Master changelog** — `db.changelog-master.yaml` includes individual files
- **Changeset anatomy:**
  - `--changeset author:id` — unique identifier
  - `labels` and `context` — selective execution
  - `--rollback` — undo SQL for every changeset
  - `--preconditions` — conditional execution
  - `runOnChange`, `runAlways` — re-runnable changesets
  - `--comment` — documentation

#### Liquibase Commands
| Command | Purpose |
|---------|---------|
| `liquibase update` | Apply pending changesets |
| `liquibase rollback` | Rollback to a tag or count |
| `liquibase rollbackCount N` | Rollback last N changesets |
| `liquibase tag <tagName>` | Tag current state for rollback |
| `liquibase status` | Show pending changesets |
| `liquibase validate` | Validate changelog syntax |
| `liquibase diff` | Compare two databases |
| `liquibase generateChangeLog` | Reverse-engineer existing DB |
| `liquibase history` | Show applied changesets |
| `liquibase changelogSync` | Mark changesets as applied without running |
| `liquibase dropAll` | Drop all objects (DEV only!) |
| `liquibase snapshot` | Capture current DB state |
| `liquibase updateSQL` | Preview SQL without executing (dry run) |

#### Configuration
- **`liquibase.properties`** — connection URL, credentials, changelog path
- **Environment variables** — `LIQUIBASE_COMMAND_URL`, `LIQUIBASE_COMMAND_USERNAME`
- **Command-line overrides** — `--url`, `--username`, `--password`, `--changelog-file`
- **Connection via IAM Auth Token** (AWS RDS) — generate token, pass as password

#### Best Practices
- **One changeset = one logical change** (never combine unrelated DDL)
- **Always write rollback SQL** — essential for production safety
- **Never modify an applied changeset** — Liquibase checksums will fail
- **Use `runOnChange` for views, stored procs, functions** — they're idempotent
- **Use contexts** — separate dev seed data from production schema
- **Tag before every release** — enables precise rollback
- **Naming convention:** `NNN-description.sql` (e.g., `001-initial-schema.sql`)

### Practical Exercises (8 Hands-On Labs)

| # | Lab | What You Learn |
|---|-----|----------------|
| 1 | **Setup Liquibase locally** | Install CLI, connect to local PostgreSQL, run first `update` |
| 2 | **Create schema from scratch** | Users, orders, products tables with indexes — same as your RDS-deploy project |
| 3 | **Write rollback SQL** | Rollback each changeset, practice `rollbackCount`, `rollback --tag` |
| 4 | **Add columns, modify schema** | `ALTER TABLE`, add `status` enum, default values — migration evolution |
| 5 | **Seed data with contexts** | Insert test data using `context:dev`, skip in `context:prod` |
| 6 | **IAM Auth with AWS RDS** | Generate auth token, connect Liquibase to RDS PostgreSQL (your project!) |
| 7 | **Diff two databases** | Compare dev vs staging, generate differential changelog |
| 8 | **CI/CD integration** | Build GitHub Actions workflow: validate on PR → update on merge |

### Real-Time Project: **Liquibase CI/CD for RDS PostgreSQL** (Uses Your Existing Repo!)

**This project directly uses the `RDS-deploy` codebase as the training environment.**

#### Project Architecture
```
GitHub Repo (RDS-deploy)
│
├── db/
│   ├── changelog/
│   │   ├── db.changelog-master.yaml        # Master changelog
│   │   └── changelogs/
│   │       ├── 001-initial-schema.sql       # users + orders tables
│   │       ├── 002-test-connection.sql      # connectivity test
│   │       ├── 003-test-rds.sql             # products table
│   │       ├── 004-add-categories.sql       # NEW: categories table
│   │       ├── 005-add-user-profiles.sql    # NEW: user profiles
│   │       ├── 006-add-audit-log.sql        # NEW: audit trail
│   │       ├── 007-create-views.sql         # NEW: reporting views (runOnChange)
│   │       └── 008-seed-data.sql            # NEW: dev seed data (context:dev)
│   └── scripts/
│       └── create-cicd-user.sql             # IAM-auth DB user
│
├── .github/workflows/
│   ├── deploy-rds.yml                       # Terraform infra pipeline
│   └── deploy-db.yml                        # Liquibase migration pipeline
│
├── liquibase.properties                     # Config file
└── terraform/                               # RDS infrastructure
```

#### Pipeline Flow (Already in Your Repo!)
```
Pull Request:
  → Liquibase validate (syntax check)
  → Liquibase status (show pending changes)
  → Liquibase updateSQL (dry-run preview)
  → Reviewers approve SQL changes

Merge to main:
  → Setup CICD user (IAM auth)
  → Liquibase tag (pre-release checkpoint)
  → Liquibase update (apply migrations)
  → Liquibase history (confirm applied)
  → Smoke test (query tables)

Rollback (manual dispatch):
  → Liquibase rollbackCount N
  → Verify rollback
  → Notify team
```

#### What Trainees Build
1. Extend the existing `RDS-deploy` schema with 5 new changesets
2. Write proper rollback SQL for every changeset
3. Use `context:dev` for seed data, `context:prod` for schema-only
4. Add a `runOnChange` view for order reporting
5. Practice rollback to a tagged state
6. Run the full CI/CD pipeline via GitHub Actions
7. Generate a diff between local and RDS databases
8. Handle a "checksum mismatch" error (intentionally break and fix)

#### Liquibase + IAM Auth Token Flow (AWS-Specific)
```
GitHub Actions Runner (EC2)
  │
  ├── OIDC → AWS STS → GitHubActionsRole
  │
  ├── aws rds generate-db-auth-token \
  │     --hostname <rds-endpoint> \
  │     --port 5432 \
  │     --region us-east-1 \
  │     --username cicd
  │
  └── liquibase update \
        --url jdbc:postgresql://<rds-endpoint>:5432/appdb?sslmode=require \
        --username cicd \
        --password <IAM_AUTH_TOKEN> \
        --changelog-file db/changelog/db.changelog-master.yaml
```

#### Interview Questions: Liquibase & DB Migrations
1. How does Liquibase track which changesets have been applied?
2. What happens if you modify an already-applied changeset?
3. How to handle a failed migration in production?
4. Liquibase vs Flyway — differences and when to use each?
5. How to rollback a specific changeset without rolling back later ones?
6. What is `DATABASECHANGELOGLOCK` and why does it exist?
7. How to run Liquibase with IAM database authentication on RDS?
8. How to share common changesets across multiple microservice databases?

- **Deliverable:** Fully automated DB migration pipeline with rollback capability, IAM auth, and multi-environment support

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

## MODULE 13 — Lambda + Glue + Serverless Data Infrastructure ⭐ (1.5 Weeks)

> **Data Engineering on AWS is a top-demand skill in 2026. Every DevOps engineer needs to know how to deploy and manage serverless data pipelines.**

### Part A: AWS Lambda — Production Infrastructure Setup

#### Topics
- **Lambda architecture** — execution environment, cold starts, runtime lifecycle
- **Lambda function deployment:**
  - ZIP deployment package
  - Container image deployment (ECR-based Lambda)
  - SAM (Serverless Application Model) vs CDK vs raw Terraform
- **Lambda infrastructure with Terraform:**
  - `aws_lambda_function` — runtime, handler, memory, timeout, VPC config
  - `aws_lambda_permission` — allow triggers from API Gateway, S3, etc.
  - `aws_lambda_event_source_mapping` — SQS, DynamoDB Streams, Kinesis
  - `aws_lambda_layer_version` — shared dependencies
  - `aws_cloudwatch_log_group` — Lambda log retention
- **Lambda networking:**
  - Lambda in VPC — access RDS, ElastiCache from Lambda
  - Lambda + NAT Gateway — internet access from VPC Lambda
  - Lambda + VPC Endpoints — private access to S3, DynamoDB, Secrets Manager
- **API Gateway integration:**
  - REST API vs HTTP API — cost and feature differences
  - Lambda proxy integration
  - API Gateway stages, throttling, API keys
  - Custom domain + ACM certificate
- **Event-driven patterns:**
  - S3 event → Lambda (file processing)
  - SQS → Lambda (queue processing with batch size, DLQ)
  - EventBridge → Lambda (scheduled tasks, event routing)
  - DynamoDB Streams → Lambda (change data capture)
  - SNS → Lambda (fan-out pattern)
- **Lambda best practices:**
  - Environment variables + Secrets Manager integration
  - Provisioned concurrency for latency-sensitive workloads
  - Lambda PowerTools (logging, tracing, metrics)
  - Dead letter queues (DLQ) for failed invocations
  - Lambda Destinations — onSuccess/onFailure routing

#### Lambda Practical Labs
| # | Lab | What You Build |
|---|-----|----------------|
| 1 | **S3 Image Processor** | S3 upload → Lambda resizes image → saves to output bucket |
| 2 | **API Gateway + Lambda CRUD** | REST API for a todo app backed by DynamoDB |
| 3 | **SQS Order Processor** | Orders queue → Lambda processes → writes to RDS |
| 4 | **Scheduled Cost Reporter** | EventBridge cron → Lambda queries Cost Explorer → SNS email |
| 5 | **VPC Lambda + RDS** | Lambda in VPC connects to RDS PostgreSQL with IAM auth |

### Part B: AWS Glue — Serverless ETL & Data Infrastructure

#### Topics
- **What is AWS Glue** — serverless ETL (Extract, Transform, Load) service
- **Glue components:**
  - **Glue Data Catalog** — centralized metadata store (Hive-compatible)
  - **Glue Crawlers** — auto-discover schema from S3, RDS, DynamoDB
  - **Glue Jobs** — ETL scripts (PySpark or Python shell)
  - **Glue Triggers** — schedule or event-based job execution
  - **Glue Workflows** — orchestrate multiple crawlers and jobs
  - **Glue Schema Registry** — Avro/JSON schema versioning
- **Glue infrastructure with Terraform:**
  ```hcl
  # Key Terraform resources
  aws_glue_catalog_database     # Create Glue database
  aws_glue_crawler               # Auto-discover S3/RDS schema
  aws_glue_job                   # ETL job (PySpark/Python)
  aws_glue_trigger               # Schedule or event trigger
  aws_glue_workflow              # Orchestrate crawlers + jobs
  aws_glue_connection            # JDBC connection to RDS/Redshift
  aws_iam_role                   # Glue service role
  ```
- **Glue + S3 Data Lake pattern:**
  ```
  Raw Zone (S3)  →  Glue Crawler  →  Data Catalog
       ↓                                    ↓
  Glue ETL Job  →  Processed Zone (S3)  →  Athena Queries
       ↓                                    ↓
  Curated Zone (S3)  →  Redshift / QuickSight
  ```
- **Glue job types:**
  - Spark ETL — large-scale data processing
  - Python Shell — lightweight transformations
  - Glue Streaming — real-time with Kafka/Kinesis
- **Glue Data Quality** — rule-based data validation
- **Glue + Lake Formation** — fine-grained access control for data lake
- **Cost optimization** — DPU allocation, job bookmarks, partition pushdown

#### Glue Practical Labs
| # | Lab | What You Build |
|---|-----|----------------|
| 1 | **S3 Crawler + Athena** | Crawl CSV files in S3 → query with Athena SQL |
| 2 | **CSV to Parquet ETL** | Glue job converts raw CSV → optimized Parquet in S3 |
| 3 | **RDS to S3 Export** | Glue JDBC connection → extract RDS data → write to S3 data lake |
| 4 | **Data Quality Checks** | Validate data completeness, uniqueness, and format rules |
| 5 | **Workflow Orchestration** | Crawler → ETL Job → Crawler → trigger notification |

### Part C: Step Functions — Serverless Orchestration

#### Topics
- **State machines** — definition, states, transitions
- **State types:** Task, Choice, Parallel, Map, Wait, Pass, Succeed, Fail
- **Standard vs Express** workflows — duration, cost, use cases
- **Integration patterns:** Lambda, Glue, ECS, SQS, SNS, DynamoDB, Bedrock
- **Error handling** — Retry, Catch, Fallback states
- **Terraform deployment** of Step Functions

### Real-Time Project: **Serverless Data Pipeline with Lambda + Glue + Step Functions**

**Architecture:**
```
                    ┌─────────────────────────────────────────┐
                    │         Step Functions Orchestrator      │
                    │                                         │
S3 Raw Upload ──►   │  ① Lambda: Validate file format         │
                    │  ② Glue Crawler: Discover schema         │
                    │  ③ Glue ETL Job: Transform & clean data  │
                    │  ④ Lambda: Data quality check             │
                    │  ⑤ Glue Job: Load to curated zone        │
                    │  ⑥ Lambda: Send SNS notification         │
                    │                                         │
                    └─────────────────────────────────────────┘
                              ↓              ↓
                        Athena Queries   CloudWatch Dashboard

Infrastructure: 100% Terraform
CI/CD: GitHub Actions
Monitoring: CloudWatch + SNS alerts
```

**What Trainees Build:**
1. Terraform modules for Lambda, Glue, Step Functions, S3, IAM
2. S3 bucket structure: `raw/`, `processed/`, `curated/` zones
3. Glue Crawler for auto-schema discovery
4. Glue PySpark ETL job for data transformation
5. Step Functions state machine to orchestrate the pipeline
6. Lambda functions for validation and notification
7. Athena queries on the curated data
8. GitHub Actions pipeline to deploy all infrastructure
9. CloudWatch alarms for job failures
- **Deliverable:** Production-ready serverless ETL pipeline deployed via Terraform + GitHub Actions

---

## MODULE 14 — Capstone Projects (1.5 Weeks)

> **Pick ONE of the four projects below. Each is a real-world, interview-ready project that demonstrates end-to-end DevOps skills.**

---

### CAPSTONE OPTION A: Customer Data Platform (CDP) ⭐

> **CDPs are the #1 trending data project in 2026. Companies like Segment, mParticle, and Rudderstack are billion-dollar businesses built on this pattern.**

**What is a CDP?**
A system that collects customer data from multiple sources (web, mobile, CRM, transactions), unifies it into a single customer profile, and makes it available for analytics, marketing, and personalization.

**Architecture:**
```
┌──────────────────────────────────────────────────────────────────────┐
│                        CDP Architecture                              │
│                                                                      │
│  DATA INGESTION                                                      │
│  ─────────────                                                       │
│  Web Events ──► API Gateway ──► Lambda ──► Kinesis Data Stream      │
│  Mobile App ──► API Gateway ──► Lambda ──► Kinesis Data Stream      │
│  CRM Export ──► S3 Upload   ──► S3 Event ──► Lambda ──► Kinesis     │
│  DB Changes ──► DynamoDB Streams ──► Lambda ──► Kinesis             │
│                                          ↓                           │
│  PROCESSING LAYER                                                    │
│  ─────────────────                                                   │
│  Kinesis ──► Kinesis Firehose ──► S3 Raw Zone                       │
│                   ↓                                                  │
│  Step Functions Orchestrator:                                        │
│    ① Glue Crawler → discover new event schemas                      │
│    ② Glue ETL → deduplicate, validate, enrich                      │
│    ③ Lambda → identity resolution (merge customer profiles)         │
│    ④ Glue ETL → build unified customer profile                     │
│    ⑤ Lambda → update DynamoDB (real-time profile store)             │
│    ⑥ Glue ETL → write to curated S3 (analytics)                    │
│                                          ↓                           │
│  DATA STORAGE                                                        │
│  ────────────                                                        │
│  S3 Data Lake:  raw/ → processed/ → curated/                        │
│  DynamoDB:      unified_customer_profiles (real-time access)         │
│  RDS PostgreSQL: reporting database (via Liquibase migrations!)      │
│                                          ↓                           │
│  CONSUMPTION LAYER                                                   │
│  ──────────────────                                                  │
│  Athena:        Ad-hoc SQL queries on S3 data                        │
│  QuickSight:    Dashboards & visualizations                          │
│  API Gateway:   Profile API → Lambda → DynamoDB (real-time lookup)  │
│  SNS/SQS:       Trigger marketing campaigns on profile changes       │
│                                                                      │
│  INFRASTRUCTURE                                                      │
│  ──────────────                                                      │
│  Terraform:     All resources in reusable modules                    │
│  GitHub Actions: CI/CD for infra + Lambda code + Glue scripts       │
│  Liquibase:     RDS reporting schema migrations                      │
│  Monitoring:    CloudWatch + Prometheus/Grafana (if EKS components)  │
│  Security:      KMS encryption, IAM least privilege, VPC, WAF       │
└──────────────────────────────────────────────────────────────────────┘
```

**AWS Services Used:** API Gateway, Lambda, Kinesis Data Streams, Kinesis Firehose, S3, Glue (Crawler + ETL + Catalog), Step Functions, DynamoDB, RDS PostgreSQL, Athena, SNS, SQS, KMS, IAM, VPC, CloudWatch, Route 53, CloudFront

**DevOps Skills Demonstrated:**
- Terraform modules (15+ resources)
- GitHub Actions CI/CD (3 workflows: infra, app, data)
- Liquibase for RDS schema management
- Docker for Lambda container images
- Monitoring with CloudWatch dashboards and alarms
- Security: encryption at rest/transit, least privilege IAM, VPC endpoints

**Deliverable:** Working CDP that ingests events, builds unified customer profiles, and exposes them via API + analytics

---

### CAPSTONE OPTION B: End-to-End Serverless Banking Application

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
DB Migrations: Liquibase → RDS PostgreSQL
Monitoring: CloudWatch + SNS alerts
Security: KMS encryption, IAM least privilege, WAF
```

**Deliverable:** Full banking app with account management, transaction processing, and reporting

---

### CAPSTONE OPTION C: Microservices E-Commerce on EKS

```
User → Route 53 → ALB → NGINX Ingress → EKS Cluster
  ├── Product Service (Node.js)
  ├── Order Service (Python)
  ├── Payment Service (Java)
  ├── Notification Service (Lambda)
  └── PostgreSQL (StatefulSet) + Redis (Cache)

Infrastructure: Terraform (VPC, EKS, RDS)
CI/CD: GitHub Actions → Docker Build → ECR → ArgoCD → EKS
DB Migrations: Liquibase for each microservice DB
Monitoring: Prometheus + Grafana + Loki
Security: Network Policies, RBAC, Trivy, SonarQube
```

**Deliverable:** Production-grade EKS microservices with GitOps deployment

---

### CAPSTONE OPTION D: Real-Time IoT Analytics Platform (Industry 4.0)

> **IoT + Data Engineering is booming in manufacturing, logistics, and smart cities.**

**Architecture:**
```
IoT Sensors → IoT Core → Kinesis Data Stream → Lambda (real-time alerts)
                                              → Kinesis Firehose → S3 Raw
                                                                    ↓
                                              Glue Crawler → Glue ETL Job
                                                                    ↓
                                              S3 Curated → Athena → QuickSight
                                              
  Time-series DB:  Timestream (or InfluxDB on EKS)
  Real-time Dashboard: Grafana + CloudWatch
  Alerting: SNS + PagerDuty integration

Infrastructure: Terraform
CI/CD: GitHub Actions
DB Migrations: Liquibase (reporting RDS)
```

**Deliverable:** IoT data pipeline with real-time alerting and historical analytics

---

## Additional Modern Topics (2026 Must-Haves) ⭐

### Added to Your Curriculum

| Topic | Why It's Important | Where to Cover |
|-------|--------------------|----------------|
| **GitHub Actions** | Replacing Jenkins in many orgs | Module 8 |
| **Liquibase DB Migrations** | Every production app needs schema CI/CD | Module 9A |
| **ArgoCD / GitOps** | Modern K8s deployment pattern | Module 10 (K8s) |
| **Helm Charts** | K8s package management | Module 10 (K8s) |
| **AWS Lambda (Production)** | Serverless compute is default in 2026 | Module 13 |
| **AWS Glue + Data Lake** | Data engineering is highest-demand skill | Module 13 |
| **Step Functions** | Serverless orchestration for pipelines | Module 13 |
| **CDP (Customer Data Platform)** | Trending real-time project in industry | Module 14 (Capstone) |
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
| **Platform Engineering basics** | Internal Developer Platforms | Module 14 |
| **Kinesis Data Streams / Firehose** | Real-time streaming ingestion | Module 13 |
| **Amazon Athena** | Serverless SQL on S3 data lake | Module 13 |
| **AWS Lake Formation** | Data lake governance | Module 13 |
| **Amazon EventBridge** | Event-driven architecture hub | Module 13 |

### AWS Services Missing from Your List (Now Added)

| Service | Category | Importance | Module |
|---------|----------|------------|--------|
| **AWS Organizations & SCPs** | Governance | High — multi-account strategy | 4 |
| **AWS Identity Center (SSO)** | IAM | High — modern access management | 4 |
| **AWS Secrets Manager** | Security | High — secrets rotation | 4, 9A |
| **AWS Systems Manager (SSM)** | Operations | High — Session Manager, Parameter Store | 4 |
| **AWS Config** | Compliance | Medium — resource compliance rules | 12 |
| **AWS GuardDuty** | Security | Medium — threat detection | 12 |
| **AWS WAF** | Security | Medium — web app firewall | 12 |
| **AWS ECS + Fargate** | Compute | High — serverless containers | 4, 6 |
| **AWS ECR** | Containers | High — Docker image registry | 6, 8 |
| **AWS CodePipeline/CodeBuild** | CI/CD | Medium — AWS-native CI/CD awareness | 8 |
| **AWS DynamoDB** | Database | High — serverless NoSQL | 4, 13, 14 |
| **AWS SQS** | Messaging | High — message queuing | 4, 13 |
| **AWS Step Functions** | Orchestration | High — serverless workflows | 13 |
| **AWS Glue** | Data Engineering | High — serverless ETL | 13 |
| **AWS Kinesis** | Streaming | High — real-time data ingestion | 13, 14 |
| **Amazon Athena** | Analytics | High — query S3 data with SQL | 13 |
| **AWS Lake Formation** | Data Governance | Medium — data lake permissions | 13 |
| **Amazon EventBridge** | Event Bus | High — event-driven routing | 13 |
| **AWS Cost Explorer** | FinOps | High — cost analysis | 2, 4 |

### 2026 Industry Trend: What Companies Are Hiring For

| Trend | Why It Matters | Covered In |
|-------|---------------|------------|
| **Data Engineering + DevOps = DataOps** | Companies need DevOps engineers who can deploy data pipelines | Module 13 |
| **Customer Data Platforms (CDP)** | Unified customer view is top priority for enterprises | Module 14 |
| **Serverless-first architectures** | Lambda + Glue + Step Functions replacing EC2 for many workloads | Module 13 |
| **Platform Engineering** | Internal Developer Platforms (IDPs) are the next evolution of DevOps | Module 14 |
| **GitOps with ArgoCD** | Declarative K8s deployments replacing imperative scripts | Module 10 |
| **FinOps / Cloud Cost Optimization** | Every company is cutting cloud spend | Module 2, 4 |
| **AI/ML Pipeline Deployment** | Deploying ML models (SageMaker, Bedrock) is a DevOps responsibility | Awareness |
| **Database-as-Code (Liquibase/Flyway)** | Schema changes in CI/CD, not manual SQL scripts | Module 9A |

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
- [ ] VS Code + extensions (Docker, Terraform, YAML, K8s, Liquibase)
- [ ] Docker Desktop (or Rancher Desktop)
- [ ] Terraform CLI installed
- [ ] kubectl + eksctl installed
- [ ] AWS CLI v2 configured
- [ ] Minikube or kind for local K8s
- [ ] Jenkins (Docker container for lab use)
- [ ] Helm CLI installed
- [ ] Liquibase CLI installed (`brew install liquibase` / download from liquibase.org)
- [ ] PostgreSQL client (`psql`) installed
- [ ] Python 3.10+ (for Glue scripts, Lambda functions)
- [ ] SAM CLI (for local Lambda testing)
- [ ] AWS Glue local development container (Docker)

---

## Real-Time Project Portfolio Summary

> After completing all modules, trainees will have these deployable projects:

| # | Project | Key Services | Interview Value |
|---|---------|-------------|----------------|
| 1 | Server Hardening Script | Linux, SSH, iptables | Shows Linux depth |
| 2 | AWS Cost Optimization Script | Shell, AWS CLI, SNS | FinOps is hot |
| 3 | GitFlow Team Simulation | Git, GitHub, PRs | Collaboration proof |
| 4 | Scalable 3-Tier Web App | VPC, ALB, ASG, RDS, S3 | Core AWS competency |
| 5 | Multi-Region VPC Network | Transit GW, VPC, VPN | Networking expertise |
| 6 | Docker Voting App + Trivy | Docker, Compose, ECR | Container skills |
| 7 | Jenkins Java Pipeline | Jenkins, SonarQube, ECR | CI/CD pipeline design |
| 8 | GitHub Actions CI/CD | GH Actions, OIDC, Terraform | Modern CI/CD |
| 9 | Terraform Multi-Env Infra | Terraform, S3, modules | IaC mastery |
| **9A** | **Liquibase RDS Pipeline** | **Liquibase, RDS, GH Actions** | **DB-as-Code (unique skill!)** |
| 10 | Production EKS Cluster | EKS, Helm, Ingress, HPA | K8s production readiness |
| 11 | Observability Stack | Prometheus, Grafana, EFK | Monitoring culture |
| 12 | DevSecOps Pipeline | Trivy, SonarQube, Checkov | Security-first mindset |
| **13** | **Serverless Data Pipeline** | **Lambda, Glue, Step Functions** | **DataOps + Serverless** |
| **14** | **CDP / Banking / E-Commerce** | **Full stack (15+ services)** | **Capstone portfolio piece** |

---

*Generated: February 25, 2026 | Updated with Liquibase, Lambda, Glue, CDP, and 2026 industry trends*
