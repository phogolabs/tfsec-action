# tfsec-action

Scan your Terraform code for vulnerabilities with TfSec.

## Usage

The workflow, usually declared in `.github/workflows/tfsec.yaml` under your Go project repository, looks like:

```yaml
name: tfsec

on:
  pull_request:
    branches: [ main ]

jobs:
  tfsec:
    name: tfsec scanner
    runs-on: ubuntu-latest

    steps:
      - name: Checkout
        uses: actions/checkout@v2

      - name: Run TfSec
        uses: phogolabs/tfsec-action@v2.0.0
```

## References

- https://github.com/aquasecurity/tfsec
