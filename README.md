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
helm template aap .
```

## Install / upgrade

```bash
helm upgrade --install aap ./
```

## Switch operator channel

```bash
helm upgrade --install aap ./ \
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

## Security note

The original repository contains clear-text demo database credentials. Move real credentials to External Secrets, Sealed Secrets, SOPS, Vault, or another secret-management workflow before production use.
