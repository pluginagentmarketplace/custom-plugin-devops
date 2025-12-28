# Linux Commands Quick Reference

## File Operations
| Command | Description |
|---------|-------------|
| `ls -la` | List all files with details |
| `cp -r src dest` | Copy recursively |
| `mv src dest` | Move/rename |
| `rm -rf dir` | Remove recursively |
| `find . -name "*.log"` | Find files |
| `grep -r "pattern" .` | Search in files |

## Process Management
| Command | Description |
|---------|-------------|
| `ps aux` | List all processes |
| `top` / `htop` | Interactive process viewer |
| `kill -9 PID` | Force kill process |
| `pkill name` | Kill by name |
| `nohup cmd &` | Run in background |

## System Info
| Command | Description |
|---------|-------------|
| `uname -a` | System info |
| `df -h` | Disk usage |
| `free -h` | Memory usage |
| `uptime` | System uptime |
| `who` | Logged in users |

## Networking
| Command | Description |
|---------|-------------|
| `ip addr` | IP addresses |
| `netstat -tuln` | Open ports |
| `curl -I url` | HTTP headers |
| `ping host` | Test connectivity |
| `traceroute host` | Trace route |

## User Management
| Command | Description |
|---------|-------------|
| `useradd -m user` | Create user |
| `passwd user` | Set password |
| `usermod -aG group user` | Add to group |
| `su - user` | Switch user |
| `sudo cmd` | Run as root |

## Package Management (Debian)
| Command | Description |
|---------|-------------|
| `apt update` | Update package list |
| `apt upgrade` | Upgrade packages |
| `apt install pkg` | Install package |
| `apt remove pkg` | Remove package |
| `apt search pkg` | Search packages |
