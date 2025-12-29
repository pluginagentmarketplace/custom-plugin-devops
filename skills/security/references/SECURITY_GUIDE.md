# DevSecOps Security Guide
## Security Principles
- Shift-Left Security: Integrate security early in SDLC
- Defense in Depth: Multiple security layers
- Zero Trust: Verify everything, trust nothing
- Least Privilege: Minimum required permissions

## Tools & Practices
### SAST (Static Application Security Testing)
- SonarQube, Checkmarx, Fortify
- Code scanning in CI/CD pipelines

### DAST (Dynamic Application Security Testing)
- OWASP ZAP, Burp Suite, Nikto
- Runtime vulnerability scanning

### Container Security
```bash
# Scan container images
trivy image myapp:latest
grype myapp:latest

# Kubernetes security
kubesec scan deployment.yaml
kube-bench run
```

### Secret Management
- HashiCorp Vault
- AWS Secrets Manager
- Azure Key Vault
- Kubernetes Secrets (encrypted)

## OWASP Top 10 Prevention
1. Injection: Parameterized queries
2. Broken Auth: MFA, secure sessions
3. XSS: Input sanitization, CSP
4. Insecure Design: Threat modeling
5. Misconfig: Security hardening
