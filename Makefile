# check here for makefile inspiration:
# https://github.com/argoproj/argo-cd/blob/master/Makefile

CURRENT_DIR=$(shell pwd)
BIN_LOCATION=${HOME}/go/bin
PATH:=$(PATH):$(PWD)/hack


.PHONY: install-coco
install-coco: ## install the coco binary for the current architecture (result is stored in ./dist/coco)
	./hack/install_coco.sh


.PHONY: cleanup
cleanup: ## remove temporary folders (dist/)
	rm -rf dist
	rm -rf tmp
	mkdir -p tmp

.PHONY: reconcile-reset
reconcile-reset: ## resets the repository changes for a new reconciliation example
	./tmp/reconcile-reset.sh
	


.PHONY: help
help:
	@grep -E '^[%a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
