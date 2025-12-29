# Containerization & Orchestration - DevOps Roadmap

## Table of Contents
1. [Introduction to Containerization](#introduction-to-containerization)
2. [Docker](#docker)
3. [Container Registries](#container-registries)
4. [Kubernetes](#kubernetes)
5. [Container Orchestration Concepts](#container-orchestration-concepts)
6. [Best Practices](#best-practices)

---

## Introduction to Containerization

### What is Containerization?

Containerization is a lightweight form of virtualization that packages an application and its dependencies together in an isolated environment called a container. Containers share the host OS kernel but run in isolated user spaces.

### Benefits of Containerization

- **Portability**: Run anywhere - development, testing, production
- **Consistency**: "Works on my machine" problem solved
- **Efficiency**: Lightweight compared to VMs
- **Scalability**: Quick startup times enable rapid scaling
- **Isolation**: Applications run independently without conflicts
- **Resource Optimization**: Better utilization of hardware resources

### Containers vs Virtual Machines

| Feature | Containers | Virtual Machines |
|---------|-----------|------------------|
| OS | Share host OS kernel | Each VM has full OS |
| Size | Megabytes | Gigabytes |
| Startup | Seconds | Minutes |
| Performance | Near-native | Overhead from hypervisor |
| Isolation | Process-level | Complete isolation |

---

## Docker

### Docker Fundamentals

Docker is the most popular containerization platform that enables developers to package applications into containers.

#### Core Concepts

1. **Docker Engine**
   - Docker Daemon (dockerd): Background service managing containers
   - Docker CLI: Command-line interface for interacting with Docker
   - REST API: Interface for programs to communicate with daemon

2. **Docker Architecture**
   - Client-Server architecture
   - Docker Host: Runs Docker daemon
   - Docker Client: User interface for Docker
   - Docker Registry: Stores Docker images

### Docker Components

#### 1. Docker Images

- Read-only templates used to create containers
- Built from Dockerfile instructions
- Layered filesystem (Union File System)
- Base images and derived images

**Image Layers**:
```
Application Layer
├── Dependencies Layer
├── Runtime Layer
├── OS Libraries Layer
└── Base Image Layer
```

#### 2. Containers

- Runnable instances of Docker images
- Isolated, secure application platforms
- Can be created, started, stopped, moved, or deleted
- Ephemeral by default

#### 3. Dockerfile

Text file containing instructions to build Docker images.

**Common Dockerfile Instructions**:
```dockerfile
FROM        # Base image
WORKDIR     # Set working directory
COPY/ADD    # Copy files from host to container
RUN         # Execute commands during build
ENV         # Set environment variables
EXPOSE      # Document ports to be exposed
CMD         # Default command to run
ENTRYPOINT  # Configure container executable
USER        # Set user for running container
VOLUME      # Create mount point for volumes
ARG         # Build-time variables
LABEL       # Add metadata to image
```

**Example Dockerfile**:
```dockerfile
FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY . .
EXPOSE 3000
USER node
CMD ["node", "server.js"]
```

### Essential Docker Commands

#### Image Management
```bash
docker build -t myapp:1.0 .              # Build image
docker images                             # List images
docker pull nginx:latest                  # Pull image from registry
docker push myrepo/myapp:1.0             # Push image to registry
docker rmi image_id                       # Remove image
docker tag source:tag target:tag          # Tag image
docker history image_name                 # Show image layers
docker image prune                        # Remove unused images
```

#### Container Management
```bash
docker run -d -p 8080:80 nginx           # Run container detached
docker ps                                 # List running containers
docker ps -a                              # List all containers
docker stop container_id                  # Stop container
docker start container_id                 # Start container
docker restart container_id               # Restart container
docker rm container_id                    # Remove container
docker logs container_id                  # View logs
docker exec -it container_id /bin/bash   # Execute command in container
docker inspect container_id               # View container details
docker stats                              # View resource usage
```

#### System Commands
```bash
docker system df                          # Show disk usage
docker system prune                       # Remove unused data
docker info                               # Display system information
docker version                            # Show Docker version
```

### Docker Networking

Docker provides several network drivers:

#### 1. Bridge Network (Default)
- Default network for containers
- Containers can communicate via IP addresses
- NAT between host and containers

```bash
docker network create mybridge
docker run --network=mybridge myapp
```

#### 2. Host Network
- Container shares host's network stack
- No network isolation
- Best performance

```bash
docker run --network=host myapp
```

#### 3. Overlay Network
- Multi-host networking
- Used in Docker Swarm
- Enables container communication across hosts

```bash
docker network create -d overlay myoverlay
```

#### 4. Macvlan Network
- Assign MAC address to container
- Container appears as physical device

#### 5. None Network
- Disables networking
- Complete isolation

**Network Commands**:
```bash
docker network ls                         # List networks
docker network create network_name        # Create network
docker network inspect network_name       # Inspect network
docker network connect network container  # Connect container to network
docker network disconnect network container # Disconnect container
docker network rm network_name            # Remove network
```

### Docker Volumes

Volumes persist data generated by containers.

#### Volume Types

1. **Named Volumes**
   - Managed by Docker
   - Stored in `/var/lib/docker/volumes/`
   ```bash
   docker volume create myvolume
   docker run -v myvolume:/data myapp
   ```

2. **Bind Mounts**
   - Mount host directory into container
   - Full path required
   ```bash
   docker run -v /host/path:/container/path myapp
   ```

3. **tmpfs Mounts**
   - Stored in host memory only
   - Not persisted on disk
   ```bash
   docker run --tmpfs /app/temp myapp
   ```

**Volume Commands**:
```bash
docker volume ls                          # List volumes
docker volume create volume_name          # Create volume
docker volume inspect volume_name         # Inspect volume
docker volume rm volume_name              # Remove volume
docker volume prune                       # Remove unused volumes
```

### Docker Compose

Tool for defining and running multi-container Docker applications.

#### docker-compose.yml Structure

```yaml
version: '3.8'

services:
  web:
    build: .
    ports:
      - "8080:80"
    environment:
      - NODE_ENV=production
    volumes:
      - ./app:/app
    depends_on:
      - db
    networks:
      - app-network
    restart: unless-stopped

  db:
    image: postgres:15
    environment:
      POSTGRES_PASSWORD: secret
    volumes:
      - db-data:/var/lib/postgresql/data
    networks:
      - app-network

  redis:
    image: redis:alpine
    networks:
      - app-network

volumes:
  db-data:

networks:
  app-network:
    driver: bridge
```

#### Docker Compose Commands

```bash
docker-compose up -d                      # Start services
docker-compose down                       # Stop and remove services
docker-compose ps                         # List services
docker-compose logs -f service_name       # View logs
docker-compose exec service_name bash     # Execute command
docker-compose build                      # Build services
docker-compose restart                    # Restart services
docker-compose scale service=3            # Scale service
```

### Docker Best Practices

1. **Use official base images**
2. **Use specific image tags** (avoid `latest`)
3. **Minimize layer count** (combine RUN commands)
4. **Use .dockerignore** file
5. **Run as non-root user**
6. **Use multi-stage builds** for smaller images
7. **Leverage build cache** (order instructions properly)
8. **Scan images for vulnerabilities**
9. **Keep images small** (use alpine variants)
10. **One process per container**

**Multi-stage Build Example**:
```dockerfile
# Build stage
FROM node:18 AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# Production stage
FROM node:18-alpine
WORKDIR /app
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
USER node
CMD ["node", "dist/server.js"]
```

---

## Container Registries

### What is a Container Registry?

A container registry is a repository for storing and distributing container images. It provides centralized storage with access control and versioning.

### Types of Container Registries

#### 1. Public Registries

**Docker Hub**
- Default registry for Docker
- Free public repositories
- Official images from vendors
- Automated builds from GitHub/Bitbucket

```bash
docker pull nginx:latest
docker push username/myapp:1.0
```

**GitHub Container Registry (ghcr.io)**
- Integrated with GitHub
- Free for public repositories
- Fine-grained access control

```bash
docker pull ghcr.io/username/myapp:latest
docker push ghcr.io/username/myapp:1.0
```

**Quay.io**
- Red Hat's container registry
- Advanced security scanning
- Geo-replication

#### 2. Private Registries

**AWS Elastic Container Registry (ECR)**
```bash
aws ecr get-login-password | docker login --username AWS \
  --password-stdin 123456789.dkr.ecr.region.amazonaws.com
docker push 123456789.dkr.ecr.region.amazonaws.com/myapp:1.0
```

**Azure Container Registry (ACR)**
```bash
az acr login --name myregistry
docker push myregistry.azurecr.io/myapp:1.0
```

**Google Container Registry (GCR) / Artifact Registry**
```bash
gcloud auth configure-docker
docker push gcr.io/project-id/myapp:1.0
```

**Harbor**
- Open-source registry
- Policy-based replication
- Role-based access control
- Vulnerability scanning

**JFrog Artifactory**
- Universal artifact repository
- Docker registry support
- Advanced metadata management

#### 3. Self-hosted Registries

**Docker Registry v2**
```bash
docker run -d -p 5000:5000 --name registry registry:2
docker tag myapp:1.0 localhost:5000/myapp:1.0
docker push localhost:5000/myapp:1.0
```

### Registry Features to Consider

1. **Security**
   - Image scanning for vulnerabilities
   - Access control and authentication
   - Encryption at rest and in transit
   - Image signing and verification

2. **Performance**
   - Geo-replication
   - Caching layers
   - Content delivery networks

3. **Integration**
   - CI/CD pipeline integration
   - Kubernetes integration
   - Webhook support

4. **Management**
   - Automatic image cleanup
   - Storage optimization
   - Usage analytics
   - Audit logging

### Registry Best Practices

1. **Use private registries** for production images
2. **Implement image scanning** in CI/CD pipelines
3. **Use image signing** (Docker Content Trust)
4. **Tag images semantically** (semantic versioning)
5. **Implement retention policies** to cleanup old images
6. **Enable audit logging** for compliance
7. **Use read-only registries** in production
8. **Implement registry mirrors** for faster pulls

---

## Kubernetes

### What is Kubernetes?

Kubernetes (K8s) is an open-source container orchestration platform that automates deployment, scaling, and management of containerized applications.

### Kubernetes Architecture

#### Control Plane Components

1. **API Server (kube-apiserver)**
   - Frontend for Kubernetes control plane
   - RESTful API interface
   - Authentication and authorization
   - Validates and processes API requests

2. **etcd**
   - Distributed key-value store
   - Stores all cluster data
   - Highly available and consistent
   - Backup critical for disaster recovery

3. **Scheduler (kube-scheduler)**
   - Assigns pods to nodes
   - Considers resource requirements
   - Affinity/anti-affinity rules
   - Taints and tolerations

4. **Controller Manager (kube-controller-manager)**
   - Node Controller: Monitors node health
   - Replication Controller: Maintains pod replicas
   - Endpoints Controller: Populates endpoint objects
   - Service Account Controller: Creates default accounts

5. **Cloud Controller Manager**
   - Cloud-specific control logic
   - Node, Route, Service, Volume controllers
   - Abstracts cloud provider APIs

#### Node Components

1. **kubelet**
   - Agent running on each node
   - Ensures containers are running in pods
   - Communicates with API server
   - Monitors pod and container health

2. **kube-proxy**
   - Network proxy on each node
   - Maintains network rules
   - Enables pod communication
   - Implements Services

3. **Container Runtime**
   - Software for running containers
   - Docker, containerd, CRI-O
   - Implements Container Runtime Interface (CRI)

### Kubernetes Objects

#### 1. Pod

Smallest deployable unit in Kubernetes. One or more containers that share network and storage.

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: myapp-pod
  labels:
    app: myapp
spec:
  containers:
  - name: myapp-container
    image: myapp:1.0
    ports:
    - containerPort: 8080
    resources:
      requests:
        memory: "64Mi"
        cpu: "250m"
      limits:
        memory: "128Mi"
        cpu: "500m"
    livenessProbe:
      httpGet:
        path: /health
        port: 8080
      initialDelaySeconds: 15
      periodSeconds: 10
    readinessProbe:
      httpGet:
        path: /ready
        port: 8080
      initialDelaySeconds: 5
      periodSeconds: 5
```

#### 2. Deployment

Manages stateless applications with declarative updates.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp-deployment
spec:
  replicas: 3
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 1
  selector:
    matchLabels:
      app: myapp
  template:
    metadata:
      labels:
        app: myapp
    spec:
      containers:
      - name: myapp
        image: myapp:1.0
        ports:
        - containerPort: 8080
```

#### 3. Service

Exposes applications running on pods.

**ClusterIP (Default)**:
```yaml
apiVersion: v1
kind: Service
metadata:
  name: myapp-service
spec:
  type: ClusterIP
  selector:
    app: myapp
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8080
```

**NodePort**:
```yaml
apiVersion: v1
kind: Service
metadata:
  name: myapp-nodeport
spec:
  type: NodePort
  selector:
    app: myapp
  ports:
  - port: 80
    targetPort: 8080
    nodePort: 30080
```

**LoadBalancer**:
```yaml
apiVersion: v1
kind: Service
metadata:
  name: myapp-loadbalancer
spec:
  type: LoadBalancer
  selector:
    app: myapp
  ports:
  - port: 80
    targetPort: 8080
```

#### 4. ConfigMap

Stores non-sensitive configuration data.

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: myapp-config
data:
  APP_ENV: "production"
  APP_PORT: "8080"
  config.json: |
    {
      "database": "postgres",
      "cache": "redis"
    }
```

**Using ConfigMap**:
```yaml
spec:
  containers:
  - name: myapp
    envFrom:
    - configMapRef:
        name: myapp-config
    volumeMounts:
    - name: config-volume
      mountPath: /etc/config
  volumes:
  - name: config-volume
    configMap:
      name: myapp-config
```

#### 5. Secret

Stores sensitive information (passwords, tokens, keys).

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: myapp-secret
type: Opaque
data:
  username: YWRtaW4=    # base64 encoded
  password: cGFzc3dvcmQ=
```

**Using Secret**:
```yaml
spec:
  containers:
  - name: myapp
    env:
    - name: DB_USERNAME
      valueFrom:
        secretKeyRef:
          name: myapp-secret
          key: username
```

#### 6. StatefulSet

Manages stateful applications with stable identities.

```yaml
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: postgres
spec:
  serviceName: postgres
  replicas: 3
  selector:
    matchLabels:
      app: postgres
  template:
    metadata:
      labels:
        app: postgres
    spec:
      containers:
      - name: postgres
        image: postgres:15
        ports:
        - containerPort: 5432
        volumeMounts:
        - name: postgres-storage
          mountPath: /var/lib/postgresql/data
  volumeClaimTemplates:
  - metadata:
      name: postgres-storage
    spec:
      accessModes: [ "ReadWriteOnce" ]
      resources:
        requests:
          storage: 10Gi
```

#### 7. DaemonSet

Ensures a pod runs on all (or selected) nodes.

```yaml
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: fluentd
spec:
  selector:
    matchLabels:
      name: fluentd
  template:
    metadata:
      labels:
        name: fluentd
    spec:
      containers:
      - name: fluentd
        image: fluentd:latest
```

#### 8. Job

Creates one or more pods and ensures successful completion.

```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: data-migration
spec:
  completions: 1
  parallelism: 1
  backoffLimit: 3
  template:
    spec:
      containers:
      - name: migration
        image: migration:1.0
      restartPolicy: Never
```

#### 9. CronJob

Runs jobs on a schedule.

```yaml
apiVersion: batch/v1
kind: CronJob
metadata:
  name: backup
spec:
  schedule: "0 2 * * *"  # 2 AM daily
  jobTemplate:
    spec:
      template:
        spec:
          containers:
          - name: backup
            image: backup:1.0
          restartPolicy: OnFailure
```

#### 10. Ingress

HTTP/HTTPS routing to services.

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: myapp-ingress
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  rules:
  - host: myapp.example.com
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: myapp-service
            port:
              number: 80
  tls:
  - hosts:
    - myapp.example.com
    secretName: myapp-tls
```

#### 11. PersistentVolume & PersistentVolumeClaim

**PersistentVolume (PV)**:
```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-data
spec:
  capacity:
    storage: 10Gi
  accessModes:
  - ReadWriteOnce
  persistentVolumeReclaimPolicy: Retain
  storageClassName: standard
  hostPath:
    path: /mnt/data
```

**PersistentVolumeClaim (PVC)**:
```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pvc-data
spec:
  accessModes:
  - ReadWriteOnce
  resources:
    requests:
      storage: 5Gi
  storageClassName: standard
```

#### 12. Namespace

Virtual clusters for resource isolation.

```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: development
```

### Kubernetes Networking

#### 1. Pod-to-Pod Communication
- Every pod gets its own IP address
- Pods can communicate without NAT
- Implemented by CNI (Container Network Interface) plugins

#### 2. CNI Plugins

- **Calico**: Network policy and security
- **Flannel**: Simple overlay network
- **Weave Net**: Multi-host networking
- **Cilium**: eBPF-based networking and security
- **Canal**: Combines Flannel and Calico

#### 3. Service Types

- **ClusterIP**: Internal cluster communication
- **NodePort**: External access via node port
- **LoadBalancer**: Cloud provider load balancer
- **ExternalName**: DNS CNAME record

#### 4. Network Policies

Control traffic flow between pods.

```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: api-allow-frontend
spec:
  podSelector:
    matchLabels:
      app: api
  policyTypes:
  - Ingress
  - Egress
  ingress:
  - from:
    - podSelector:
        matchLabels:
          app: frontend
    ports:
    - protocol: TCP
      port: 8080
  egress:
  - to:
    - podSelector:
        matchLabels:
          app: database
    ports:
    - protocol: TCP
      port: 5432
```

### Kubernetes Storage

#### Storage Classes

Define different storage types.

```yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: fast-ssd
provisioner: kubernetes.io/aws-ebs
parameters:
  type: gp3
  iops: "3000"
  throughput: "125"
reclaimPolicy: Delete
allowVolumeExpansion: true
```

#### Volume Types

- **emptyDir**: Temporary directory
- **hostPath**: Mount from host filesystem
- **nfs**: Network File System
- **persistentVolumeClaim**: Abstracted storage
- **configMap/secret**: Configuration as volume
- **cloud provider**: EBS, Azure Disk, GCE PD

### Kubernetes Security

#### 1. Authentication
- Client certificates
- Bearer tokens
- Service account tokens
- OpenID Connect (OIDC)

#### 2. Authorization
- **RBAC** (Role-Based Access Control)
- **ABAC** (Attribute-Based Access Control)
- **Webhook** mode
- **Node** authorization

**RBAC Example**:
```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: development
  name: pod-reader
rules:
- apiGroups: [""]
  resources: ["pods"]
  verbs: ["get", "watch", "list"]
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: read-pods
  namespace: development
subjects:
- kind: User
  name: jane
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: pod-reader
  apiGroup: rbac.authorization.k8s.io
```

#### 3. Pod Security

**Security Context**:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: secure-pod
spec:
  securityContext:
    runAsNonRoot: true
    runAsUser: 1000
    fsGroup: 2000
  containers:
  - name: app
    image: myapp:1.0
    securityContext:
      allowPrivilegeEscalation: false
      readOnlyRootFilesystem: true
      capabilities:
        drop:
        - ALL
```

#### 4. Secrets Management
- Use external secret managers (Vault, AWS Secrets Manager)
- Enable encryption at rest for secrets in etcd
- Use sealed secrets for GitOps
- Implement secret rotation

#### 5. Network Security
- Implement Network Policies
- Use service mesh (Istio, Linkerd)
- Enable TLS for all communication
- Segment networks with multiple clusters

### Essential Kubernetes Commands

#### Cluster Management
```bash
kubectl cluster-info                      # Display cluster info
kubectl get nodes                         # List nodes
kubectl describe node node-name           # Node details
kubectl top nodes                         # Node resource usage
kubectl cordon node-name                  # Mark node unschedulable
kubectl drain node-name                   # Drain node for maintenance
kubectl uncordon node-name                # Mark node schedulable
```

#### Resource Management
```bash
kubectl get pods                          # List pods
kubectl get pods -A                       # List all pods in all namespaces
kubectl get pods -o wide                  # Detailed pod info
kubectl describe pod pod-name             # Pod details
kubectl logs pod-name                     # View pod logs
kubectl logs -f pod-name                  # Stream logs
kubectl exec -it pod-name -- /bin/bash   # Execute command in pod
kubectl delete pod pod-name               # Delete pod
kubectl get all                           # List all resources
```

#### Deployment Management
```bash
kubectl create deployment name --image=image   # Create deployment
kubectl get deployments                         # List deployments
kubectl scale deployment name --replicas=5      # Scale deployment
kubectl rollout status deployment name          # Check rollout status
kubectl rollout history deployment name         # View rollout history
kubectl rollout undo deployment name            # Rollback deployment
kubectl set image deployment name container=image:tag  # Update image
```

#### Service Management
```bash
kubectl get services                      # List services
kubectl expose deployment name --port=80  # Create service
kubectl port-forward pod-name 8080:80    # Forward local port to pod
```

#### Configuration Management
```bash
kubectl apply -f manifest.yaml            # Apply configuration
kubectl delete -f manifest.yaml           # Delete resources from file
kubectl get configmaps                    # List ConfigMaps
kubectl get secrets                       # List Secrets
kubectl create configmap name --from-file=file  # Create ConfigMap
kubectl create secret generic name --from-literal=key=value  # Create Secret
```

#### Debugging
```bash
kubectl describe pod pod-name             # Detailed pod info
kubectl logs pod-name -c container-name   # Container logs
kubectl logs pod-name --previous          # Previous container logs
kubectl top pod pod-name                  # Pod resource usage
kubectl get events                        # Cluster events
kubectl debug pod-name --image=busybox    # Debug pod
```

#### Context and Namespace
```bash
kubectl config get-contexts               # List contexts
kubectl config use-context context-name   # Switch context
kubectl config set-context --current --namespace=name  # Set namespace
kubectl get namespaces                    # List namespaces
kubectl create namespace name             # Create namespace
```

### Kubernetes Deployment Strategies

#### 1. Rolling Update (Default)
- Gradually replaces old pods with new ones
- Zero downtime
- Configurable max surge and max unavailable

#### 2. Recreate
- Terminates all old pods before creating new ones
- Downtime occurs
- Simple and fast

#### 3. Blue/Green
- Two identical environments
- Switch traffic between them
- Quick rollback capability

#### 4. Canary
- Gradually roll out to subset of users
- Monitor metrics before full rollout
- Risk mitigation

#### 5. A/B Testing
- Route traffic based on criteria
- Multiple versions running simultaneously
- Feature testing

### Kubernetes Package Management

#### Helm

Package manager for Kubernetes.

**Helm Commands**:
```bash
helm create mychart                       # Create chart
helm install myapp mychart/               # Install chart
helm upgrade myapp mychart/               # Upgrade release
helm rollback myapp 1                     # Rollback to revision
helm list                                 # List releases
helm uninstall myapp                      # Uninstall release
helm repo add stable https://charts.helm.sh/stable  # Add repo
helm repo update                          # Update repos
helm search repo nginx                    # Search charts
```

**Chart Structure**:
```
mychart/
├── Chart.yaml          # Chart metadata
├── values.yaml         # Default configuration values
├── charts/             # Dependency charts
├── templates/          # Template files
│   ├── deployment.yaml
│   ├── service.yaml
│   └── ingress.yaml
└── .helmignore         # Ignored files
```

#### Kustomize

Template-free Kubernetes configuration customization.

```bash
kubectl apply -k ./                       # Apply kustomization
kubectl kustomize ./                      # View kustomized output
```

**kustomization.yaml**:
```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

resources:
- deployment.yaml
- service.yaml

namespace: production

commonLabels:
  app: myapp
  env: production

images:
- name: myapp
  newTag: v2.0.0

configMapGenerator:
- name: myapp-config
  literals:
  - APP_ENV=production
```

---

## Container Orchestration Concepts

### What is Container Orchestration?

Container orchestration automates the deployment, management, scaling, and networking of containers across a cluster of machines.

### Key Orchestration Capabilities

#### 1. Automated Deployment
- Deploy containers across multiple hosts
- Declarative configuration
- Version control for infrastructure
- Rollback capabilities

#### 2. Scaling
- **Horizontal Scaling**: Add/remove container instances
- **Vertical Scaling**: Adjust resource allocation
- **Auto-scaling**: Based on metrics (CPU, memory, custom)

```yaml
# Horizontal Pod Autoscaler
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: myapp-hpa
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: myapp
  minReplicas: 2
  maxReplicas: 10
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 70
  - type: Resource
    resource:
      name: memory
      target:
        type: Utilization
        averageUtilization: 80
```

#### 3. Load Balancing
- Distribute traffic across containers
- Health checks and automatic routing
- Service discovery
- DNS-based routing

#### 4. Self-Healing
- Restart failed containers
- Replace unhealthy instances
- Kill unresponsive containers
- Don't advertise containers until ready

#### 5. Service Discovery
- Automatic DNS registration
- Environment variable injection
- Service mesh integration
- Load balancer integration

#### 6. Storage Orchestration
- Automatic mounting of storage systems
- Local storage, network storage, cloud storage
- Dynamic provisioning
- Volume lifecycle management

#### 7. Configuration Management
- Centralized configuration
- Secret management
- Environment-specific configs
- Hot reload capabilities

#### 8. Resource Management
- CPU and memory limits
- Resource quotas
- Quality of Service (QoS)
- Priority and preemption

**Resource Quota Example**:
```yaml
apiVersion: v1
kind: ResourceQuota
metadata:
  name: compute-quota
  namespace: development
spec:
  hard:
    requests.cpu: "10"
    requests.memory: 20Gi
    limits.cpu: "20"
    limits.memory: 40Gi
    pods: "50"
```

#### 9. Monitoring and Logging
- Health checks (liveness, readiness, startup probes)
- Metrics collection
- Centralized logging
- Alerting and notifications

#### 10. Security
- Role-Based Access Control (RBAC)
- Network policies
- Pod security policies/standards
- Image scanning and signing

### Container Orchestration Platforms

#### 1. Kubernetes
- Industry standard
- Extensive ecosystem
- Multi-cloud support
- Large community

#### 2. Docker Swarm
- Native Docker clustering
- Simple setup
- Built into Docker Engine
- Less feature-rich than Kubernetes

```bash
docker swarm init                         # Initialize swarm
docker service create --name web --replicas 3 nginx  # Create service
docker service ls                         # List services
docker service scale web=5                # Scale service
docker stack deploy -c compose.yml myapp  # Deploy stack
```

#### 3. Amazon ECS (Elastic Container Service)
- AWS-native orchestration
- Deep AWS integration
- Fargate support (serverless)
- Simpler than Kubernetes

#### 4. Apache Mesos + Marathon
- Distributed systems kernel
- Resource scheduling
- Multi-framework support
- Large-scale clusters

#### 5. Nomad (HashiCorp)
- Simple and lightweight
- Multi-workload support (containers, VMs, binaries)
- HashiCorp ecosystem integration
- Easy operations

### Managed Kubernetes Services

#### AWS Elastic Kubernetes Service (EKS)
```bash
eksctl create cluster --name mycluster --region us-west-2
aws eks update-kubeconfig --name mycluster --region us-west-2
```

#### Azure Kubernetes Service (AKS)
```bash
az aks create --resource-group myRG --name mycluster
az aks get-credentials --resource-group myRG --name mycluster
```

#### Google Kubernetes Engine (GKE)
```bash
gcloud container clusters create mycluster --zone us-central1-a
gcloud container clusters get-credentials mycluster --zone us-central1-a
```

#### Other Managed Services
- **DigitalOcean Kubernetes (DOKS)**
- **IBM Cloud Kubernetes Service (IKS)**
- **Oracle Container Engine (OKE)**
- **Red Hat OpenShift** (Kubernetes distribution)
- **Rancher** (Multi-cluster management)

### Service Mesh

Advanced networking layer for microservices.

#### Popular Service Meshes

**Istio**:
- Traffic management
- Security (mTLS)
- Observability
- Policy enforcement

```yaml
apiVersion: networking.istio.io/v1beta1
kind: VirtualService
metadata:
  name: myapp
spec:
  hosts:
  - myapp.example.com
  http:
  - match:
    - headers:
        user:
          exact: premium
    route:
    - destination:
        host: myapp-v2
  - route:
    - destination:
        host: myapp-v1
```

**Linkerd**:
- Lightweight and fast
- Automatic mTLS
- Built-in observability
- Simpler than Istio

**Consul Connect**:
- HashiCorp service mesh
- Multi-platform support
- Service discovery integration
- Certificate management

#### Service Mesh Features

1. **Traffic Management**
   - Load balancing
   - Circuit breaking
   - Retry logic
   - Timeouts

2. **Security**
   - Mutual TLS (mTLS)
   - Certificate management
   - Access control
   - Encryption

3. **Observability**
   - Distributed tracing
   - Metrics collection
   - Traffic visualization
   - Request logging

4. **Resilience**
   - Circuit breakers
   - Retries and timeouts
   - Rate limiting
   - Fault injection

---

## Best Practices

### Container Best Practices

1. **Image Management**
   - Use minimal base images (alpine, distroless)
   - Scan images for vulnerabilities regularly
   - Use multi-stage builds
   - Tag images with version numbers
   - Implement image signing

2. **Security**
   - Run containers as non-root user
   - Use read-only root filesystem when possible
   - Drop unnecessary capabilities
   - Scan for secrets in images
   - Keep base images updated

3. **Configuration**
   - Externalize configuration (ConfigMaps, Secrets)
   - Use environment variables
   - Don't hardcode credentials
   - Follow 12-factor app principles

4. **Resource Management**
   - Set resource requests and limits
   - Implement health checks
   - Use appropriate restart policies
   - Monitor resource usage

5. **Logging and Monitoring**
   - Log to stdout/stderr
   - Use structured logging
   - Implement distributed tracing
   - Set up alerts

### Kubernetes Best Practices

1. **Cluster Management**
   - Use multiple namespaces for isolation
   - Implement RBAC
   - Enable audit logging
   - Regular cluster upgrades
   - Backup etcd regularly

2. **Workload Configuration**
   - Always set resource requests/limits
   - Use liveness and readiness probes
   - Implement pod disruption budgets
   - Use appropriate restart policies
   - Set pod security contexts

3. **Deployment**
   - Use GitOps (ArgoCD, Flux)
   - Implement CI/CD pipelines
   - Use rolling updates
   - Test in staging before production
   - Version all manifests

4. **Networking**
   - Implement network policies
   - Use Ingress controllers
   - Enable TLS everywhere
   - Segment networks appropriately
   - Monitor network traffic

5. **Storage**
   - Use StatefulSets for stateful apps
   - Implement backup strategies
   - Use appropriate storage classes
   - Monitor disk usage
   - Test restore procedures

6. **Security**
   - Scan images in CI/CD
   - Use Pod Security Standards
   - Implement least privilege access
   - Rotate credentials regularly
   - Enable audit logging
   - Use network policies
   - Implement secrets encryption

7. **Monitoring and Logging**
   - Deploy Prometheus + Grafana
   - Use centralized logging (ELK, Loki)
   - Set up alerting
   - Monitor cluster health
   - Track resource usage

8. **Cost Optimization**
   - Right-size resources
   - Use cluster autoscaling
   - Implement pod autoscaling
   - Use spot/preemptible instances
   - Clean up unused resources
   - Monitor costs regularly

### Production Checklist

- [ ] Container images scanned for vulnerabilities
- [ ] Images signed and verified
- [ ] Non-root user configured
- [ ] Resource limits set
- [ ] Health probes configured
- [ ] Secrets externalized
- [ ] RBAC configured
- [ ] Network policies implemented
- [ ] Ingress/Load balancer configured
- [ ] TLS certificates configured
- [ ] Monitoring stack deployed
- [ ] Logging aggregation configured
- [ ] Backup strategy implemented
- [ ] Disaster recovery tested
- [ ] Auto-scaling configured
- [ ] Documentation updated
- [ ] Alerts configured
- [ ] Cost monitoring enabled

---

## Learning Path

### Beginner Level
1. Learn Docker basics
2. Understand containers vs VMs
3. Practice with Dockerfile
4. Learn Docker Compose
5. Understand container networking basics

### Intermediate Level
1. Learn Kubernetes architecture
2. Deploy applications to Kubernetes
3. Understand pods, deployments, services
4. Learn kubectl commands
5. Work with ConfigMaps and Secrets
6. Understand persistent storage
7. Learn about Ingress

### Advanced Level
1. Master Kubernetes networking
2. Implement security best practices
3. Set up monitoring and logging
4. Learn about StatefulSets and DaemonSets
5. Implement auto-scaling
6. Work with Helm charts
7. Learn service mesh concepts
8. Multi-cluster management
9. GitOps practices
10. Disaster recovery and backup

---

## Useful Tools and Resources

### Container Tools
- **Docker Desktop**: Local Docker environment
- **Podman**: Daemonless container engine
- **Buildah**: Container image builder
- **Skopeo**: Image operations tool
- **Dive**: Image layer explorer
- **Trivy**: Vulnerability scanner
- **Hadolint**: Dockerfile linter

### Kubernetes Tools
- **kubectl**: Kubernetes CLI
- **k9s**: Terminal UI for Kubernetes
- **Lens**: Kubernetes IDE
- **Stern**: Multi-pod log tailing
- **kubectx/kubens**: Context and namespace switcher
- **Helm**: Package manager
- **Kustomize**: Configuration management
- **ArgoCD**: GitOps continuous delivery
- **Flux**: GitOps toolkit
- **Prometheus**: Monitoring
- **Grafana**: Visualization
- **Jaeger**: Distributed tracing

### Cloud CLIs
- **aws-cli**: AWS CLI
- **azure-cli**: Azure CLI
- **gcloud**: Google Cloud CLI
- **eksctl**: EKS cluster management
- **az aks**: AKS management

### Development Tools
- **Skaffold**: Local Kubernetes development
- **Tilt**: Development environment
- **Garden**: Development orchestrator
- **Draft**: Developer tools for Kubernetes
- **DevSpace**: Developer workflows

### Testing Tools
- **kind**: Kubernetes in Docker
- **minikube**: Local Kubernetes
- **k3s/k3d**: Lightweight Kubernetes
- **Terraform**: Infrastructure as Code
- **Pulumi**: Cloud infrastructure as code

---

## Conclusion

Containerization and orchestration are fundamental skills for modern DevOps engineers. Docker provides the containerization technology, while Kubernetes offers robust orchestration capabilities. Understanding both technologies, along with container registries and orchestration concepts, is essential for deploying and managing cloud-native applications at scale.

Key takeaways:
- **Containers** provide lightweight, portable application packaging
- **Docker** is the standard containerization platform
- **Registries** enable centralized image management
- **Kubernetes** orchestrates containers at scale
- **Service meshes** add advanced networking capabilities
- **Managed services** simplify operations
- **Best practices** ensure security, reliability, and efficiency

Continue learning by practicing with hands-on projects, contributing to open-source projects, and staying updated with the evolving cloud-native ecosystem.
