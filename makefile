.ONESHELL:
.SILENT:
.EXPORT_ALL_VARIABLES:
.DEFAULT_GOAL: version

MAKEFLAGS += --no-builtin-rules --no-builtin-variables

###############################################################################
# Repo Version
###############################################################################

.PHONY: version commit

version:
	$(info ==> Version <==)
	echo $$(date +%Y.%m.%d-%H%M) >| VERSION
	git add --all
	echo "VERSION: $$(cat VERSION)"

commit: version
	$(info ==> Commit <==)
	git commit -m "$$(cat VERSION)"

