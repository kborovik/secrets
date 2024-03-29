# The Lost Art of the Makefile: Simple Secret Sharing for Small Teams

**Introduction**

This repository demonstrates a straightforward method for sharing secrets within a small development team when centralized secret management tools (like Hashicorp Vault) aren't feasible. The approach leverages GPG encryption to securely embed secrets directly within your source code repository.

**Problem**

The challenge lies in finding a safe and reliable way to include secrets in your development repository without the overhead of centralized secret management solutions.

**Solution**

Utilize GPG encryption to store secrets within the source code repository.

**Requirements**

* GnuPGP ([https://gnupg.org/](https://gnupg.org/))
* GNU Make

**Instructions**

1. Place the provided `makefile` and `.gitignore` into a designated `secrets` directory within your repository.
2. Configure the `makefile`:  Replace the placeholder GPG key IDs with the actual public key IDs of your team members.

**Demo**

[![asciicast](https://asciinema.org/a/646428.svg)](https://asciinema.org/a/646428)

**Help**

```shell
(0) > make
Help:
  make decrypt        # Decrypt all secrets
  make encrypt        # Encrypt all secrets
  make <secret_name>  # Encrypt a secret
  make clean          # Remove unencrypted secrets
```

**Decrypt Secret**

```shell
(0) > gpg -dq secret.asc 
I2eddWBzw3Yd4ZKi
```

**Important Considerations**

* **Key Management:** Establish a secure process for sharing and rotating GPG keys within your team.
* **Version Control:**  Treat the `secrets` directory with the same sensitivity as you would your source code. 

