.ONESHELL:
.SILENT:
.EXPORT_ALL_VARIABLES:

gpg_key := 79A09C51CF531E16444D6871B59466C2C0CCF0BF

dir := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
txt := $(shell ls -1 $(dir) | grep -vE '.asc|makefile|README.md' | tr '\n' ' ')
asc := $(addsuffix .asc,$(txt))

help:
	echo "Help:"
	echo "  make decrypt        # Decrypt all secrets"
	echo "  make encrypt        # Encrypt all secrets"
	echo "  make <secret_name>  # Encrypt a secret"
	echo "  make clean          # Remove unencrypted secrets"

decrypt:
	$(info ==> Decrypting secrets <==)
	for file in *.asc; do
		gpg $${file}
	done
	for file in *.asc; do
		touch $${file}
	done

encrypt:
	$(info ==> Encrypting secrets <==)
	for file in $(txt); do
		gpg -a -e -r $(gpg_key) $${file}
	done

$(asc): $(txt)
	$(info ==> Encrypting $@ <==)
	gpg -a -e -r $(gpg_key) $(@:%.asc=%)

clean:
	$(info ==> Removing unencrypted secrets <==)
	for file in $(txt); do
		rm $${file}
	done
