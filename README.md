# automation-platform Helm chart

Helm chart to deploy AAP on OpenShift.

It includes:

- Namespace
- AAP Operator `OperatorGroup`
- AAP Operator `Subscription`
- External database/Redis secrets
- `AnsibleAutomationPlatform` custom resource
- OpenShift `ConsoleLink`

## Render

```bash
helm template aap ./automation-platform-chart --namespace aap
```

## Install / upgrade

```bash
helm upgrade --install aap ./automation-platform-chart \
  --namespace aap \
  --create-namespace
```

## Switch operator channel

```bash
helm upgrade --install aap ./automation-platform-chart \
  --namespace aap \
  --set operator.subscription.channel=stable-2.6
```

For a controlled GitOps upgrade, set:

```yaml
operator:
  subscription:
    installPlanApproval: Manual
```

## Cluster-scoped operator mode

```yaml
operator:
  operatorGroup:
    clusterScoped: true
```

## Argo CD application source example

```yaml
source:
  repoURL: https://github.com/tonyreveal/automation_platform_helm.git
  targetRevision: main
  path: charts/automation-platform
  helm:
    valueFiles:
      - values.yaml
```

## Security note

The original repository contains clear-text demo database credentials. Move real credentials to External Secrets, Sealed Secrets, SOPS, Vault, or another secret-management workflow before production use.
