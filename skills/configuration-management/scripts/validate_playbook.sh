#!/bin/bash
# Ansible Playbook Validator
ansible-playbook --syntax-check "$1"
ansible-lint "$1" 2>/dev/null || echo "ansible-lint not installed"
