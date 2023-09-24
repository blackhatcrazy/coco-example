# coco example repository

This repository serves as a demonstration repository to play around with the
functionalities of
[coco](https://github.com/SAP/configuration-tools-for-gitops).

## Command examples

### version

```bash
dist/coco version

```

### generate

```bash
dist/coco generate
```

### dependencies graph

```bash
dist/coco dependencies graph
```

### dependencies

```bash
dist/coco dependencies \
  --source-branch pr-example \
  --target-branch main \
  -u https://github.com/blackhatcrazy/coco-example.git \
  -p $(pwd)/tmp/coco-example
```

### reconcile

```bash
dist/coco reconcile \
  --source branch-to-reconcile \
  --target main \
  --owner blackhatcrazy \
  --repository coco-example \
  -p ./../coco-example/tmp \
  -u https://github.com/blackhatcrazy/coco-example
```
