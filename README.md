# The Lost Art of the Makefile: Simple Secret Sharing for Small Teams

## Introduction

This repository demonstrates a straightforward method for sharing secrets within a small development team when centralized secret management tools (like Hashicorp Vault) aren't feasible. The approach leverages GPG encryption to securely embed secrets directly within your source code repository.

## Problem

The challenge lies in finding a safe and reliable way to include secrets in your development repository without the overhead of centralized secret management solutions.

## Solution

Utilize GPG encryption to store secrets within the source code repository.

## Requirements

* [GnuPGP](https://gnupg.org/)
* [GNU Make](https://www.gnu.org/software/make/)

## Instructions

1. Place the provided `makefile` into a designated `secrets` directory within your repository.
2. Add GPG_ID to `.gpg_id` file in `secrets` directory to specify the encryption key.

## Demo

[![asciicast](https://asciinema.org/a/646428.svg)](https://asciinema.org/a/646428)

## Usage

```shell
$ make
==> Settings <==
GPG_KEY: 5B3F2E505184715EE22BFF04FF0F630A17B88E52
==> Help <==
make decrypt - Decrypt all secrets
make encrypt - Encrypt all secrets
make clean - Remove unencrypted secrets
```

### Decrypt Secret

```shell
$ gpg -dq secret.asc 
I2eddWBzw3Yd4ZKi
```

## Important Considerations

* **Key Management:** Establish a secure process for sharing and rotating GPG keys within your team.
* **Version Control:** Treat the `secrets` directory with the same sensitivity as you would your source code. 

