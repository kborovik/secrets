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
2. Add GPG_ID to `.gpg_id` file specifying the key to use for encryption/decryption.

```shell
$ echo 10C9CE7BD969B9839A0B1D4DD9B5E06B6CE2A97B > .gpg_id
```

## Usage

```shell
$ make
==> Settings <==
gpg_id: 10C9CE7BD969B9839A0B1D4DD9B5E06B6CE2A97B
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
