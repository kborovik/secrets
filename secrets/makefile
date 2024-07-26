.ONESHELL:
.SILENT:
.EXPORT_ALL_VARIABLES:

MAKEFLAGS += --no-builtin-rules --no-builtin-variables

###############################################################################
# Settings
###############################################################################

gpg_id ?= $(word 1,$(file < .gpg_id))

txt := $(shell ls -1 | grep -vE 'makefile|.asc|.gpg_id|.tfvars' | tr '\n' ' ')
asc := $(addsuffix .asc,$(txt))

###############################################################################
# Targets
###############################################################################

.PHONY: help decrypt encrypt clean

help: .gpg_id .gitignore
	$(call header,Settings)
	$(call var,gpg_id,$(gpg_id))
	$(call header,Help)
	$(call help,make decrypt,Decrypt all secrets)
	$(call help,make encrypt,Encrypt all secrets)
	$(call help,make clean,Remove unencrypted secrets)

.gpg_id:
	touch $@

.gitignore:
	cat << EOF > $@
	**
	!.gitignore
	!.gpg_key
	!*.asc
	!makefile
	EOF

ifeq ($(gpg_id),)
$(error "gpg_id is not set. Set it or define a '.gpg_id' file")
endif

decrypt:
	$(call header,Decrypting secrets)
	$(foreach file,$(wildcard *.asc),gpg $(file) && touch $(file) && chmod 600 $(file:%.asc=%);)

encrypt:
	$(call header,Encrypting secrets)
	$(foreach file,$(txt),gpg -aer $(gpg_id) $(file);)

$(asc): $(txt)
	$(call header,Encrypting $@)
	gpg -aer $(gpg_id) $(@:%.asc=%)

clean:
	$(call header,Removing unencrypted secrets)
	$(foreach file,$(txt),shred -uf $(file);)

###############################################################################
# Colors and Headers
###############################################################################

TERM := xterm-256color

black := $$(tput setaf 0)
red := $$(tput setaf 1)
green := $$(tput setaf 2)
yellow := $$(tput setaf 3)
blue := $$(tput setaf 4)
magenta := $$(tput setaf 5)
cyan := $$(tput setaf 6)
white := $$(tput setaf 7)
reset := $$(tput sgr0)

define header
echo "$(blue)==> $(1) <==$(reset)"
endef

define help
echo "$(green)$(1)$(reset) - $(white)$(2)$(reset)"
endef

define var
echo "$(magenta)$(1)$(reset): $(yellow)$(2)$(reset)"
endef
