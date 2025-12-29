# Configuration Management Guide
## Tools Comparison
| Tool | Language | Approach | Agent |
|------|----------|----------|-------|
| Ansible | YAML | Push | Agentless |
| Puppet | DSL | Pull | Agent |
| Chef | Ruby | Pull | Agent |
| SaltStack | YAML | Both | Optional |

## Ansible Basics
```yaml
# playbook.yml
---
- name: Configure web servers
  hosts: webservers
  become: yes
  vars:
    app_port: 8080
  tasks:
    - name: Install nginx
      apt:
        name: nginx
        state: present
        
    - name: Deploy config
      template:
        src: nginx.conf.j2
        dest: /etc/nginx/nginx.conf
      notify: Restart nginx
      
  handlers:
    - name: Restart nginx
      service:
        name: nginx
        state: restarted
```

## Inventory Management
```ini
# inventory.ini
[webservers]
web1.example.com
web2.example.com

[databases]
db1.example.com ansible_user=dbadmin
```

## Best Practices
- Idempotent operations
- Role-based organization
- Encrypted secrets (ansible-vault)
- Version-controlled playbooks
- Test in staging first
