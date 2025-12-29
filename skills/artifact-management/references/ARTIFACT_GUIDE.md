# Artifact Management Guide
## Repository Types
| Type | Purpose | Tools |
|------|---------|-------|
| Binary | Compiled artifacts | Nexus, Artifactory |
| Container | Docker images | Harbor, ECR, GCR |
| Package | Language packages | npm, PyPI, Maven |
| Helm | Kubernetes charts | ChartMuseum, Harbor |

## JFrog Artifactory
```yaml
# Repository configuration
repositories:
  - name: libs-release
    type: maven
    layout: maven-2-default
  - name: docker-local
    type: docker
    v2: true
```

## Nexus Repository
```bash
# Upload artifact
curl -u admin:pass -X PUT \
  "http://nexus:8081/repository/maven-releases/com/app/1.0/app-1.0.jar" \
  --upload-file app-1.0.jar
```

## Best Practices
- Semantic versioning (semver)
- Immutable releases (no overwrites)
- Retention policies for snapshots
- Security scanning before publishing
- Promotion pipelines (dev → staging → prod)

## Version Tagging
```bash
# Git tags for releases
git tag -a v1.2.3 -m "Release 1.2.3"
git push origin v1.2.3
```
