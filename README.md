<div align="center">

<!-- Animated Typing Banner -->
<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=600&size=28&duration=3000&pause=1000&color=2E9EF7&center=true&vCenter=true&multiline=true&repeat=true&width=600&height=100&lines=Devops+Assistant;7+Agents+%7C+17+Skills;Claude+Code+Plugin" alt="Devops Assistant" />

<br/>

<!-- Badge Row 1: Status Badges -->
[![Version](https://img.shields.io/badge/Version-3.1.0-blue?style=for-the-badge)](https://github.com/pluginagentmarketplace/custom-plugin-devops/releases)
[![License](https://img.shields.io/badge/License-Custom-yellow?style=for-the-badge)](LICENSE)
[![Status](https://img.shields.io/badge/Status-Production-brightgreen?style=for-the-badge)](#)
[![SASMP](https://img.shields.io/badge/SASMP-v1.3.0-blueviolet?style=for-the-badge)](#)

<!-- Badge Row 2: Content Badges -->
[![Agents](https://img.shields.io/badge/Agents-7-orange?style=flat-square&logo=robot)](#-agents)
[![Skills](https://img.shields.io/badge/Skills-17-purple?style=flat-square&logo=lightning)](#-skills)
[![Commands](https://img.shields.io/badge/Commands-1-green?style=flat-square&logo=terminal)](#-commands)

<br/>

<!-- Quick CTA Row -->
[📦 **Install Now**](#-quick-start) · [🤖 **Explore Agents**](#-agents) · [📖 **Documentation**](#-documentation) · [⭐ **Star this repo**](https://github.com/pluginagentmarketplace/custom-plugin-devops)

---

### What is this?

> **Devops Assistant** is a Claude Code plugin with **7 agents** and **17 skills** for devops development.

</div>

---

## 📑 Table of Contents

<details>
<summary>Click to expand</summary>

- [Quick Start](#-quick-start)
- [Features](#-features)
- [Agents](#-agents)
- [Skills](#-skills)
- [Commands](#-commands)
- [Documentation](#-documentation)
- [Contributing](#-contributing)
- [License](#-license)

</details>

---

## 🚀 Quick Start

### Prerequisites

- Claude Code CLI v2.0.27+
- Active Claude subscription

### Installation (Choose One)

<details open>
<summary><strong>Option 1: From Marketplace (Recommended)</strong></summary>

```bash
# Step 1️⃣ Add the marketplace
/plugin add marketplace pluginagentmarketplace/custom-plugin-devops

# Step 2️⃣ Install the plugin
/plugin install devops-automation-plugin@pluginagentmarketplace-devops

# Step 3️⃣ Restart Claude Code
# Close and reopen your terminal/IDE
```

</details>

<details>
<summary><strong>Option 2: Local Installation</strong></summary>

```bash
# Clone the repository
git clone https://github.com/pluginagentmarketplace/custom-plugin-devops.git
cd custom-plugin-devops

# Load locally
/plugin load .

# Restart Claude Code
```

</details>

### ✅ Verify Installation

After restart, you should see these agents:

```
devops-automation-plugin:06-monitoring-observability
devops-automation-plugin:02-networking-protocols
devops-automation-plugin:04-infrastructure-as-code
devops-automation-plugin:07-cloud-infrastructure
devops-automation-plugin:01-linux-fundamentals
... and 2 more
```

---

## ✨ Features

| Feature | Description |
|---------|-------------|
| 🤖 **7 Agents** | Specialized AI agents for devops tasks |
| 🛠️ **17 Skills** | Reusable capabilities with Golden Format |
| ⌨️ **1 Commands** | Quick slash commands |
| 🔄 **SASMP v1.3.0** | Full protocol compliance |

---

## 🤖 Agents

### 7 Specialized Agents

| # | Agent | Purpose |
|---|-------|---------|
| 1 | **06-monitoring-observability** | Master monitoring and observability with Prometheus, Grafana |
| 2 | **02-networking-protocols** | Master networking fundamentals including TCP/IP, DNS, HTTP/H |
| 3 | **04-infrastructure-as-code** | Master Infrastructure as Code with Terraform, Ansible, and C |
| 4 | **07-cloud-infrastructure** | Master cloud platforms including AWS, Azure, and GCP. Learn  |
| 5 | **01-linux-fundamentals** | Master Linux OS fundamentals including process management, f |
| 6 | **05-cicd-automation** | Master CI/CD pipelines with Git, GitHub Actions, GitLab CI,  |
| 7 | **03-containers-orchestration** | Master containerization with Docker and orchestration with K |

---

## 🛠️ Skills

### Available Skills

| Skill | Description | Invoke |
|-------|-------------|--------|
| `scripting` | DevOps scripting with Bash, Python, and Go for automation, t | `Skill("devops-automation-plugin:scripting")` |
| `artifact-management` | Artifact repositories with Nexus, Artifactory, and container | `Skill("devops-automation-plugin:artifact-management")` |
| `configuration-management` | Infrastructure configuration with Ansible, Chef, Puppet, and | `Skill("devops-automation-plugin:configuration-management")` |
| `security` | DevSecOps practices including secrets management, SSL/TLS, v | `Skill("devops-automation-plugin:security")` |
| `serverless` | Serverless computing with AWS Lambda, Azure Functions, Googl | `Skill("devops-automation-plugin:serverless")` |
| `networking` | Network protocols and troubleshooting - TCP/IP, DNS, HTTP/HT | `Skill("devops-automation-plugin:networking")` |
| `version-control` | Git version control, branching strategies, GitHub/GitLab wor | `Skill("devops-automation-plugin:version-control")` |
| `observability` | Distributed tracing with Jaeger, OpenTelemetry, and observab | `Skill("devops-automation-plugin:observability")` |
| `cicd` | CI/CD pipelines with Git, GitHub Actions, GitLab CI, Jenkins | `Skill("devops-automation-plugin:cicd")` |
| `iac` | Infrastructure as Code with Terraform, Ansible, and CloudFor | `Skill("devops-automation-plugin:iac")` |
| ... | +7 more | See skills/ directory |

---

## ⌨️ Commands

| Command | Description |
|---------|-------------|

---

## 📚 Documentation

| Document | Description |
|----------|-------------|
| [CHANGELOG.md](CHANGELOG.md) | Version history |
| [CONTRIBUTING.md](CONTRIBUTING.md) | How to contribute |
| [LICENSE](LICENSE) | License information |

---

## 📁 Project Structure

<details>
<summary>Click to expand</summary>

```
custom-plugin-devops/
├── 📁 .claude-plugin/
│   ├── plugin.json
│   └── marketplace.json
├── 📁 agents/              # 7 agents
├── 📁 skills/              # 17 skills (Golden Format)
├── 📁 commands/            # 1 commands
├── 📁 hooks/
├── 📄 README.md
├── 📄 CHANGELOG.md
└── 📄 LICENSE
```

</details>

---

## 📅 Metadata

| Field | Value |
|-------|-------|
| **Version** | 3.1.0 |
| **Last Updated** | 2025-12-29 |
| **Status** | Production Ready |
| **SASMP** | v1.3.0 |
| **Agents** | 7 |
| **Skills** | 17 |
| **Commands** | 1 |

---

## 🤝 Contributing

Contributions are welcome! Please read our [Contributing Guide](CONTRIBUTING.md).

1. Fork the repository
2. Create your feature branch
3. Follow the Golden Format for new skills
4. Submit a pull request

---

## ⚠️ Security

> **Important:** This repository contains third-party code and dependencies.
>
> - ✅ Always review code before using in production
> - ✅ Check dependencies for known vulnerabilities
> - ✅ Follow security best practices
> - ✅ Report security issues privately via [Issues](../../issues)

---

## 📝 License

Copyright © 2025 **Dr. Umit Kacar** & **Muhsin Elcicek**

Custom License - See [LICENSE](LICENSE) for details.

---

## 👥 Contributors

<table>
<tr>
<td align="center">
<strong>Dr. Umit Kacar</strong><br/>
Senior AI Researcher & Engineer
</td>
<td align="center">
<strong>Muhsin Elcicek</strong><br/>
Senior Software Architect
</td>
</tr>
</table>

---

<div align="center">

**Made with ❤️ for the Claude Code Community**

[![GitHub](https://img.shields.io/badge/GitHub-pluginagentmarketplace-black?style=for-the-badge&logo=github)](https://github.com/pluginagentmarketplace)

</div>
