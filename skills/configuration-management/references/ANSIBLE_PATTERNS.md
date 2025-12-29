# Ansible Best Practices

## Directory Structure
```
ansible/
├── inventory/
├── group_vars/
├── host_vars/
├── roles/
└── playbooks/
```

## Common Patterns

### Idempotent Tasks
Always write tasks that can run multiple times safely.

### Variables Precedence
1. Extra vars (-e)
2. Task vars
3. Block vars
4. Role vars
5. Playbook vars
6. Host vars
7. Group vars
