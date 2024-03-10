.ONESHELL:
.SILENT:
.EXPORT_ALL_VARIABLES:

gpg_key := 79A09C51CF531E16444D6871B59466C2C0CCF0BF
text := $(shell ls -1 | grep -vE '.asc|makefile' | tr '\n' ' ')
asc := $(addsuffix .asc,$(text))

help:
	echo "Help:"
	echo "make decrypt	# Decrypt all secrets"
	echo "make encrypt	# Encrypt all secrets"
	echo "make clean	# Remove unencrypted secrets"

decrypt:
	for file in *.asc; do
		gpg --yes $${file}
	done

$(asc):
	gpg -e -r $(gpg_key) $(@:%.asc=%)

clean:
	for file in $(text); do
		rm $${file}
	done
