<div align="center">

# DevOps Automation Plugin

### Complete DevOps Learning System for Claude Code

**Master DevOps with 7 specialized agents covering Linux, containers, CI/CD, IaC, monitoring, cloud, and security**

[![Verified](https://img.shields.io/badge/Verified-Working-success?style=flat-square&logo=checkmarx)](https://github.com/pluginagentmarketplace/custom-plugin-devops)
[![License](https://img.shields.io/badge/License-Custom-yellow?style=flat-square)](LICENSE)
[![Version](https://img.shields.io/badge/Version-3.1.0-blue?style=flat-square)](https://github.com/pluginagentmarketplace/custom-plugin-devops)
[![Status](https://img.shields.io/badge/Status-Production_Ready-brightgreen?style=flat-square)](https://github.com/pluginagentmarketplace/custom-plugin-devops)
[![Agents](https://img.shields.io/badge/Agents-7-orange?style=flat-square)](#agents-overview)
[![Skills](https://img.shields.io/badge/Skills-17-purple?style=flat-square)](#skills-reference)
[![SASMP](https://img.shields.io/badge/SASMP-v1.3.0-blueviolet?style=flat-square)](#)

[![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)](https://linux.org)
[![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://docker.com)
[![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)](https://kubernetes.io)
[![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)](https://terraform.io)

[Quick Start](#quick-start) | [Agents](#agents-overview) | [Skills](#skills-reference) | [Learning Path](#learning-path)

</div>

---

## Verified Installation

> **This plugin has been tested and verified working on Claude Code.**
> Last verified: December 2025

---

## Quick Start

### Option 1: Install from GitHub (Recommended)

```bash
# Step 1: Add the marketplace from GitHub
/plugin add marketplace pluginagentmarketplace/custom-plugin-devops

# Step 2: Install the plugin
/plugin install devops-automation-plugin@pluginagentmarketplace-devops

# Step 3: Restart Claude Code to load new plugins
```

### Option 2: Clone and Load Locally

```bash
# Clone the repository
git clone https://github.com/pluginagentmarketplace/custom-plugin-devops.git

# Navigate to the directory in Claude Code
cd custom-plugin-devops

# Load the plugin
/plugin load .
```

After loading, restart Claude Code.

### Verify Installation

After restarting Claude Code, verify the plugin is loaded. You should see these agents available:

```
custom-plugin-devops:01-linux-fundamentals
custom-plugin-devops:02-networking-protocols
custom-plugin-devops:03-containers-orchestration
custom-plugin-devops:04-infrastructure-as-code
custom-plugin-devops:05-cicd-automation
custom-plugin-devops:06-monitoring-observability
custom-plugin-devops:07-cloud-infrastructure
```

---

## Available Skills

Once installed, these 17 skills become available:

| Skill | Invoke Command | Golden Format |
|-------|----------------|---------------|
| Linux | `Skill("custom-plugin-devops:linux")` | bashrc-template.sh, system-health-check.sh |
| Networking | `Skill("custom-plugin-devops:networking")` | port-scanner.sh, PROTOCOLS.md |
| Containers | `Skill("custom-plugin-devops:containers")` | docker-cleanup.sh, K8S-CHEATSHEET.md |
| IaC | `Skill("custom-plugin-devops:iac")` | terraform-validate.sh, TERRAFORM-COMMANDS.md |
| CI/CD | `Skill("custom-plugin-devops:cicd")` | github-actions-template.yml, GIT-WORKFLOW.md |
| Monitoring | `Skill("custom-plugin-devops:monitoring")` | prometheus-config.yml, check-endpoints.sh |
| Cloud | `Skill("custom-plugin-devops:cloud")` | aws-vpc-template.yaml, AWS-SERVICES.md |
| Version Control | `Skill("custom-plugin-devops:version-control")` | git-workflow.yaml, git_cleanup.sh |
| Configuration Mgmt | `Skill("custom-plugin-devops:configuration-management")` | ansible-patterns.yaml, validate_playbook.sh |
| Serverless | `Skill("custom-plugin-devops:serverless")` | serverless-patterns.yaml, lambda_deploy.sh |
| GitOps | `Skill("custom-plugin-devops:gitops")` | gitops-patterns.yaml, sync_check.sh |
| Service Mesh | `Skill("custom-plugin-devops:service-mesh")` | service-mesh-config.yaml, istio_check.sh |
| Security | `Skill("custom-plugin-devops:security")` | security-practices.yaml, security_scan.sh |
| Artifact Mgmt | `Skill("custom-plugin-devops:artifact-management")` | artifact-config.yaml, artifact_cleanup.sh |
| Logging | `Skill("custom-plugin-devops:logging")` | log_analyzer.sh |
| Scripting | `Skill("custom-plugin-devops:scripting")` | scripting-patterns.yaml, script_template.sh |
| Observability | `Skill("custom-plugin-devops:observability")` | observability-config.yaml, THREE_PILLARS.md |

---

## What This Plugin Does

This plugin provides **7 specialized agents** and **17 production-ready skills** for DevOps mastery:

| Agent | Purpose |
|-------|---------|
| **Linux Fundamentals** | Process management, filesystem, permissions, package management, bash scripting |
| **Networking Protocols** | TCP/IP, DNS, SSH, firewalls, load balancing, VPNs |
| **Containers & Orchestration** | Docker, Kubernetes, container security, Helm |
| **Infrastructure as Code** | Terraform, Ansible, CloudFormation, Pulumi |
| **CI/CD Automation** | Jenkins, GitHub Actions, GitLab CI, ArgoCD |
| **Monitoring & Observability** | Prometheus, Grafana, ELK Stack, alerting |
| **Cloud Infrastructure** | AWS, Azure, GCP, multi-cloud strategies |

---

## Agents Overview

### 7 Implementation Agents

Each agent is designed to **do the work**, not just explain:

| Agent | Capabilities | Example Prompts |
|-------|--------------|-----------------|
| **Linux Fundamentals** | OS concepts, bash scripting, system administration | `"Write a backup script"`, `"Explain Linux permissions"` |
| **Networking Protocols** | Network troubleshooting, firewall rules, DNS config | `"Configure iptables rules"`, `"Set up DNS records"` |
| **Containers & Orchestration** | Docker builds, K8s deployments, Helm charts | `"Create Dockerfile"`, `"Deploy to Kubernetes"` |
| **Infrastructure as Code** | Terraform modules, Ansible playbooks | `"Write Terraform for VPC"`, `"Create Ansible role"` |
| **CI/CD Automation** | Pipeline design, GitHub Actions, Jenkins | `"Set up GitHub Actions"`, `"Create Jenkins pipeline"` |
| **Monitoring & Observability** | Metrics, alerts, dashboards, logging | `"Configure Prometheus"`, `"Create Grafana dashboard"` |
| **Cloud Infrastructure** | AWS/Azure/GCP resources, IAM, networking | `"Set up AWS VPC"`, `"Configure IAM roles"` |

---

## Skills Reference

Each skill includes **Golden Format** content:
- `assets/` - YAML templates, configuration files
- `scripts/` - Shell/Python automation scripts
- `references/` - Detailed methodology guides

### Skills Deep Dive

| Skill | Focus Areas | Real Assets |
|-------|-------------|-------------|
| **linux** | Process, filesystem, permissions | `bashrc-template.sh`, `COMMANDS.md` |
| **networking** | TCP/IP, DNS, SSH, firewalls | `port-scanner.sh`, `PROTOCOLS.md` |
| **containers** | Docker, Kubernetes, Helm | `docker-cleanup.sh`, `K8S-CHEATSHEET.md` |
| **iac** | Terraform, Ansible, Pulumi | `terraform-validate.sh`, `TERRAFORM-COMMANDS.md` |
| **cicd** | Jenkins, GitHub Actions, GitLab CI | `github-actions-template.yml`, `GIT-WORKFLOW.md` |
| **monitoring** | Prometheus, Grafana, alerting | `prometheus-config.yml`, `check-endpoints.sh` |
| **cloud** | AWS, Azure, GCP | `aws-vpc-template.yaml`, `AWS-SERVICES.md` |
| **gitops** | ArgoCD, Flux, GitOps patterns | `gitops-patterns.yaml`, `sync_check.sh` |
| **security** | DevSecOps, scanning, compliance | `security-practices.yaml`, `DEVSECOPS.md` |

---

## Usage Examples

### Example 1: Docker Cleanup Script

```bash
# Before: Manual container cleanup
docker ps -a | grep Exited | awk '{print $1}' | xargs docker rm
docker images | grep "<none>" | awk '{print $3}' | xargs docker rmi

# After (with Containers skill):
Skill("custom-plugin-devops:containers")
# Uses docker-cleanup.sh from assets - handles containers, images, volumes, networks
./skills/containers/scripts/docker-cleanup.sh --all
```

### Example 2: Terraform Validation

```bash
# Before: Manual terraform checks
terraform fmt
terraform validate
terraform plan

# After (with IaC skill):
Skill("custom-plugin-devops:iac")
# Uses terraform-validate.sh - comprehensive validation
./skills/iac/scripts/terraform-validate.sh
# Checks: format, validation, plan, security scanning
```

### Example 3: Prometheus Configuration

```yaml
# Before: Manual prometheus.yml creation

# After (with Monitoring skill):
Skill("custom-plugin-devops:monitoring")
# Uses prometheus-config.yml template from assets
# Pre-configured with best practices:
# - Job definitions for common exporters
# - Alert rules for CPU, memory, disk
# - Service discovery patterns
```

---

## Learning Path

```
Start Here
    |
    v
[ 1. Linux Fundamentals ] ---> [ 2. Networking ]
                                      |
                                      v
                          [ 3. Containers & K8s ]
                                      |
              +---------------+-------+-------+
              |               |               |
              v               v               v
        [ 4. IaC ]      [ 5. CI/CD ]    [ 6. Monitoring ]
              |               |               |
              +-------+-------+-------+-------+
                      |
                      v
            [ 7. Cloud & Advanced ]
                      |
                      v
              DevOps Master!
```

---

## Plugin Structure

```
custom-plugin-devops/
├── .claude-plugin/
│   ├── plugin.json           # Plugin manifest
│   └── marketplace.json      # Marketplace config
├── agents/                   # 7 specialized agents
│   ├── 01-linux-fundamentals.md
│   ├── 02-networking-protocols.md
│   ├── 03-containers-orchestration.md
│   ├── 04-infrastructure-as-code.md
│   ├── 05-cicd-automation.md
│   ├── 06-monitoring-observability.md
│   └── 07-cloud-infrastructure.md
├── skills/                   # 17 skills (Golden Format)
│   ├── linux/
│   │   ├── SKILL.md
│   │   ├── assets/bashrc-template.sh
│   │   ├── scripts/system-health-check.sh
│   │   └── references/COMMANDS.md
│   ├── networking/
│   ├── containers/
│   ├── iac/
│   ├── cicd/
│   ├── monitoring/
│   ├── cloud/
│   ├── version-control/
│   ├── configuration-management/
│   ├── serverless/
│   ├── gitops/
│   ├── service-mesh/
│   ├── security/
│   ├── artifact-management/
│   ├── logging/
│   ├── scripting/
│   └── observability/
├── docs/                     # Additional documentation
│   ├── INSTALLATION.md
│   ├── USAGE.md
│   └── TROUBLESHOOTING.md
├── hooks/hooks.json
├── README.md
├── CHANGELOG.md
├── CONTRIBUTING.md
└── LICENSE
```

---

## Technology Coverage

| Category | Technologies |
|----------|--------------|
| **Operating Systems** | Linux (Ubuntu, CentOS, RHEL), Windows Server |
| **Containers** | Docker, Podman, containerd, Kubernetes, Helm |
| **IaC** | Terraform, Ansible, CloudFormation, Pulumi |
| **CI/CD** | Jenkins, GitHub Actions, GitLab CI, ArgoCD, Flux |
| **Cloud** | AWS, Azure, GCP, DigitalOcean |
| **Monitoring** | Prometheus, Grafana, ELK Stack, Datadog |
| **Security** | HashiCorp Vault, SOPS, Trivy, SonarQube |

---

## Security Notice

This plugin is designed for **authorized development and learning use only**:

**USE FOR:**
- Learning DevOps practices
- Building automation scripts
- Infrastructure provisioning
- CI/CD pipeline development
- Security best practices

**NEVER:**
- Store credentials in code
- Skip security scanning
- Ignore compliance requirements
- Use in production without review

---

## Contributing

Contributions are welcome:

1. Fork the repository
2. Create a feature branch
3. Follow the Golden Format for new skills
4. Submit a pull request

See [CONTRIBUTING.md](CONTRIBUTING.md) for details.

---

## Metadata

| Field | Value |
|-------|-------|
| **Last Updated** | 2025-12-28 |
| **Maintenance Status** | Active |
| **SASMP Version** | 1.3.0 |
| **Support** | [Issues](../../issues) |

---

## License

Custom License - See [LICENSE](LICENSE) for details.

---

## Contributors

**Authors:**
- **Dr. Umit Kacar** - Senior AI Researcher & Engineer
- **Muhsin Elcicek** - Senior Software Architect

---

<div align="center">

**Master DevOps with AI assistance!**

[![Made for DevOps](https://img.shields.io/badge/Made%20for-DevOps-blue?style=for-the-badge&logo=linux)](https://github.com/pluginagentmarketplace/custom-plugin-devops)

**Built by Dr. Umit Kacar & Muhsin Elcicek**

*Based on [roadmap.sh/devops](https://roadmap.sh/devops)*

</div>
