# TSDB to PostgreSQL Migrator Helm Chart

A Helm chart for running TimescaleDB to PostgreSQL migration with scripts loaded via ConfigMap.

## TL;DR

```bash
helm install tsdb-migrator . --namespace migration --create-namespace
```

## Overview

This Helm chart deploys a StatefulSet that:
- Loads migration scripts from a ConfigMap
- Mounts a persistent volume for migration data
- Connects to TimescaleDB and PostgreSQL using environment variables
- Supports JDBC URI configuration from the statefulset

## Architecture

### Script Loading

Scripts are stored in `chart/scripts/` and automatically loaded into a ConfigMap:

```
chart/scripts/*.sh → ConfigMap → Mounted at /scripts (executable)
```

### Volume Mounts

1. **Scripts ConfigMap** → `/scripts` (read-only, executable)
2. **Migration Data PVC** → `/migration-data` (persistent)

### Environment Configuration

The chart reads database connections from environment variables (defined in `statefulset.yaml`):

- `TIMESCALEDB_URI` - Primary TimescaleDB JDBC connection
- `SECONDARY_TIMESCALEDB_URI` - Secondary/replica connection  
- `POSTGRESDB_URI` - Target PostgreSQL connection
- `POSTGRES_USERNAME` - PostgreSQL username
- `POSTGRES_PASSWORD` - PostgreSQL password

These are automatically parsed by `0-common.sh` to extract host, port, database, etc.

## Quick Start

### Install

```bash
# Basic installation
helm install tsdb-migrator . -n migration --create-namespace

# With custom values
helm install tsdb-migrator . -n migration \
  --set persistence.size=50Gi \
  --set resources.limits.memory=20Gi
```

### Run Migration

```bash
# Get pod name
POD=$(kubectl get pods -n migration -l app=tsdb-to-psql-migrator -o jsonpath='{.items[0].metadata.name}')

# Execute full migration
kubectl exec -it $POD -n migration -- /scripts/migrate.sh

# Or run individual steps
kubectl exec $POD -n migration -- /scripts/1-extract-schema.sh
kubectl exec $POD -n migration -- /scripts/2-recreate-functions.sh
# ... etc
```

### Verify Setup

```bash
./verify-setup.sh
```

## Configuration

### Key Values

| Parameter | Description | Default |
|-----------|-------------|---------|
| `image.repository` | Docker image | `aryaharness/tsdb2psql` |
| `image.tag` | Image tag | `1.0.0` |
| `persistence.enabled` | Enable PVC | `true` |
| `persistence.size` | PVC size | `20Gi` |
| `persistence.mountPath` | Mount path | `/migration-data` |
| `resources.limits.memory` | Memory limit | `10Gi` |
| `resources.requests.cpu` | CPU request | `1024m` |
| `config` | Additional config map data | `{}` |

### Example Custom Values

```yaml
# custom-values.yaml
persistence:
  enabled: true
  size: 100Gi
  storageClass: fast-ssd

resources:
  limits:
    memory: 32Gi
  requests:
    cpu: 4000m
    memory: 32Gi

config:
  MAX_PARALLEL_JOBS: "8"
  RETRY_DELAY_SECONDS: "60"
  ENABLE_VALIDATION: "true"
```

Apply with:

```bash
helm upgrade tsdb-migrator . -n migration -f custom-values.yaml
```

## Available Scripts

All scripts are mounted at `/scripts/`:

| Script | Purpose |
|--------|---------|
| `0-common.sh` | Common utilities, URI parsing, logging |
| `1-extract-schema.sh` | Extract schema from TimescaleDB |
| `2-recreate-functions.sh` | Recreate database functions |
| `3-recreate-hypertables.sh` | Recreate hypertables |
| `4-dump-data.sh` | Dump data from TimescaleDB |
| `5-restore-data.sh` | Restore data to PostgreSQL |
| `6-incremental-sync.sh` | Incremental synchronization |
| `7-validate.sh` | Validate migration results |
| `8-update-endpoints.sh` | Update application endpoints |
| `migrate.sh` | Main orchestrator script |

## Updating Scripts

To update scripts without rebuilding Docker image:

1. Edit scripts in `chart/scripts/`
2. Upgrade the release:
   ```bash
   helm upgrade tsdb-migrator . -n migration
   ```
3. Restart the pod (if needed):
   ```bash
   kubectl delete pod $POD -n migration
   ```

The new pod will automatically get the updated scripts from the ConfigMap.

## Monitoring

### View Logs

```bash
# Pod logs
kubectl logs -f $POD -n migration

# Persistent logs
kubectl exec $POD -n migration -- cat /migration-data/logs/migration_master.log

# Search for errors
kubectl exec $POD -n migration -- grep ERROR /migration-data/logs/migration_master.log
```

### Check Status

```bash
# Pod status
kubectl get pods -n migration -l app=tsdb-to-psql-migrator

# PVC status
kubectl get pvc -n migration

# ConfigMap
kubectl get configmap tsdb-to-psql-migrator -n migration
```

### Copy Logs Locally

```bash
kubectl cp migration/$POD:/migration-data/logs ./logs-backup
```

## Troubleshooting

### Pod Not Starting

```bash
# Check events
kubectl describe pod $POD -n migration

# Check logs
kubectl logs $POD -n migration
```

### Scripts Not Found

Verify ConfigMap:

```bash
kubectl get configmap tsdb-to-psql-migrator -n migration -o yaml | grep "\.sh:"
```

### PVC Issues

```bash
# Check PVC
kubectl get pvc -n migration
kubectl describe pvc migration-data-tsdb-to-psql-migrator-0 -n migration
```

### Connection Issues

Test from inside the pod:

```bash
kubectl exec -it $POD -n migration -- bash

# Inside pod:
source /scripts/0-common.sh
load_env
echo "TSDB: $TSDB_HOST:$TSDB_PORT/$TSDB_DATABASE"
echo "PG: $POSTGRES_HOST:$POSTGRES_PORT/$POSTGRES_DATABASE"
```

## Uninstall

```bash
# Uninstall chart (keeps PVC)
helm uninstall tsdb-migrator -n migration

# Delete PVC (careful - this deletes migration data!)
kubectl delete pvc -n migration -l app=tsdb-to-psql-migrator
```

## Files

- `templates/statefulset.yaml` - Main StatefulSet definition
- `templates/config.yaml` - ConfigMap with scripts
- `templates/_helpers.tpl` - Helper functions including script loader
- `scripts/` - Migration scripts directory
- `DEPLOYMENT_GUIDE.md` - Detailed deployment guide
- `verify-setup.sh` - Setup verification script

## Requirements

- Kubernetes 1.19+
- Helm 3.0+
- PersistentVolume provisioner support
- Access to TimescaleDB and PostgreSQL instances

## Support

For issues or questions:
- Check `DEPLOYMENT_GUIDE.md` for detailed information
- Run `./verify-setup.sh` to verify setup
- Review logs in `/migration-data/logs/`
- Check pod events: `kubectl describe pod $POD -n migration`

## License

See main repository license.

---

**Chart Version**: See `Chart.yaml`  
**Last Updated**: November 25, 2025
