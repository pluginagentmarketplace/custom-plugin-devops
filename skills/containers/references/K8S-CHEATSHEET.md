# Kubernetes Cheatsheet

## Pods
kubectl get pods -A
kubectl describe pod <name>
kubectl logs -f <pod>
kubectl exec -it <pod> -- /bin/sh

## Deployments
kubectl get deployments
kubectl scale deployment <name> --replicas=3
kubectl rollout status deployment/<name>
kubectl rollout undo deployment/<name>

## Services
kubectl get svc
kubectl expose deployment <name> --port=80
