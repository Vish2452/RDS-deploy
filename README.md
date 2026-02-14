# RDS Deploy

Terraform project to provision an **RDS MySQL** instance (with **IAM database authentication**) in the same VPC and security group as the AWS self-hosted GitHub Actions runners.

## Architecture

| Component | Detail |
|---|---|
| VPC | `vpc-0c185a3e6c0239bc2` (shared with EC2 runner) |
| Runner SG | `sg-04381b9eaa5f7441d` (`launch-wizard-2`) |
| RDS SG | New SG allowing inbound from runner SG on port 3306 |
| IAM Auth | Enabled – EC2 runner can generate auth tokens via `rds-db:connect` |
| OIDC Role | `arn:aws:iam::225749317825:role/GitHubActionsRole` |

## Project Structure

```
.
├── .github/workflows/deploy-rds.yml   # CI/CD pipeline
├── terraform/
│   ├── versions.tf                    # Terraform & provider versions
│   ├── providers.tf                   # AWS provider config
│   ├── variables.tf                   # Input variables
│   ├── terraform.tfvars               # Default values
│   ├── main.tf                        # RDS, SG, IAM resources
│   └── outputs.tf                     # Useful outputs
└── README.md
```

## Prerequisites

1. **GitHub Repository Secret** – Add `DB_PASSWORD` to your repo's **Settings → Secrets and variables → Actions**.
2. **OIDC Provider** – The IAM OIDC identity provider for GitHub must already be configured in your AWS account.
3. **Self-hosted Runner** – An EC2 runner registered to this repo with network access to the VPC subnets.

## Usage

### Run via GitHub Actions (recommended)
- Push to `main` → runs **plan** then **apply** automatically.
- Open a **Pull Request** → runs **plan** only.
- **Manual dispatch** → runs **destroy**.

### Run locally
```bash
cd terraform
terraform init
terraform plan -var="db_password=YOUR_PASSWORD"
terraform apply -var="db_password=YOUR_PASSWORD"
```

## Connecting from EC2 Runner with IAM Auth

```bash
# Generate an IAM auth token
TOKEN=$(aws rds generate-db-auth-token \
  --hostname <RDS_ENDPOINT> \
  --port 3306 \
  --username admin \
  --region us-east-1)

# Connect with MySQL client
mysql -h <RDS_ENDPOINT> -P 3306 -u admin --password=$TOKEN --enable-cleartext-plugin
```

## Tear Down

```bash
cd terraform
terraform destroy -var="db_password=YOUR_PASSWORD"
```

Or trigger a **manual workflow dispatch** from the Actions tab.