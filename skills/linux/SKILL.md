---
name: linux-fundamentals-skill
description: Complete Linux administration skill covering process management, filesystem, permissions, package management, users, bash scripting, and system monitoring.
sasmp_version: "1.3.0"
bonded_agent: 01-linux-fundamentals
bond_type: PRIMARY_BOND
---

# Linux Fundamentals Skill

## Overview
Master Linux system administration - the foundation of DevOps.

## Core Topics

### Process Management
- Process lifecycle and states
- Foreground and background processes
- Process monitoring (ps, top, htop)
- Signals and process control

### Filesystem Operations
- Directory structure and hierarchy
- Mounting and unmounting
- Disk partitioning
- LVM basics

### File Permissions
- chmod, chown, chgrp
- Numeric and symbolic notation
- ACLs and extended permissions
- umask configuration

### Package Management
- APT (Debian/Ubuntu)
- YUM/DNF (RHEL/CentOS)
- Package compilation from source

### User Administration
- User and group management
- sudo configuration
- Password policies

### Bash Scripting
- Shell basics and syntax
- Variables and control flow
- Functions and error handling
- Best practices

### System Monitoring
- Resource monitoring tools
- Log analysis
- Performance diagnostics

## Quick Commands

```bash
# Process management
ps aux | grep process
kill -9 PID
nohup command &

# File permissions
chmod 755 file
chown user:group file

# Package management
apt update && apt upgrade
yum install package

# User management
useradd -m username
usermod -aG group user
```

## Resources
- [Linux Journey](https://linuxjourney.com)
- [TLDR Pages](https://tldr.sh)
