## This is the exact production pattern many teams use on EKS. I’ll walk you through the end-to-end flow + every file you need, step by step.   
## 🏆 Architecture Overview  
```text
AWS Secrets Manager (DB host, creds)
            ↓
External Secrets Operator (ESO)
            ↓
Kubernetes Secret (global-db-secret)
            ↓
Reloader detects change
            ↓
Deployments restart automatically
            ↓
Pods use updated DB_HOST
```

## 🎯 What you achieve
✔ One central DB config
✔ No hardcoding in Helm charts
✔ Auto-update when AWS secret changes
✔ No manual redeploys
