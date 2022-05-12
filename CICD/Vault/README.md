# DevOps Sharing

**WARNING:** The content of this repository is my **personal knowledge**

Please let me know if you find something wrongs and I will fix that

---

**Hashicorp Vault** is a *secrets lifecycle manager*. It stores secrets or generates secrets material.

Written in Go so that it can be compiled for multiple OS. The compiled binary is the same for client and server interactions.

### Vault Conceptual Architecture

Authentication: Users need to be authenticated to access something in Vault server.

Policy: Control each authenticated users is able to do

Secrets: Our protected data

Audit: Keep a record of how people interacting with Vault service:

Clients: User, Application, Machine

Vault API: the Frontend of Vault Server.

* It controls all access to what exists inside of Vault.

* Once we authenticate to Vault server, it gives us a token. Each request that sent to API has to include this token.

### Vault Logical Architecture

Vault stays inside a barrier, and everything inside a barrier is unencrypted, and anything leave barrier has to be protected and encrypted.

API - a HTTPS listener in front of Vault Deployment. It is secured by using TLS, and API requests should also have valid Vault Token

Storage - Vault writes data to the storage in an encrypted format. Vault encrypts information by using encryption keys, which are secured by a master key, and this key is secured by an unsealed key which is never stored inside of Vault

## Vault Development Mode

Running on localhost without SSL

In-memory storage

Starts unsealed with token cached

UI enabled

Key/Value secrets engine enabled

**vault server -dev** export VAULT_ADDR and VAULT_TOKEN

## Vault Production Deployment Model

### Deployment Components

Compute to run Vault Binary: Bare metal, VM, container,...

Networking: Communication of client-Vault and storage-Vault. Load Balancer and DNS also.

Storage: Hashicorp Support or Community Support, and high availability aspect

TLS Certificates:

* For the Front End: API TLS certificate

* For the Back End: Storage backend traffic

### Deployment Considerations

High availability

* Service level agreement and uptime

* Component failure

Monitoring

* Health Monitoring

* Capacity Monitoring

Backup & Recovery

* Key shares

* Server configuration

* Storage backend

Key shares & unsealed keys

* Distributed key shares

* Auto unseal

### Manage Encryption and Seal Keys

Encryption keys: Protect data written to storage. Stored on disk

Master key: Protects encryption keys. Stored on disk

Unseal key: Protects master key. Stored as shares or externally

#### Seal Options:

Shamir secret sharing: takes a single unseal key, break in into one or more key shares. Those shares can be combined to recreate unseal key

* Only need certain threshhold of shares, not all

* Configured at initialization

* Key shares can be used for sensitive operations

Auto unseal: 

* Unseal key is stored in external service.

* Key shares had from Shamir converted to recovery key shares.

* Set by Vault server configuration

Seal migration: Seal options can be migrated

### Vault initialization commands and process

Process: 

* 3 administrators create 3 public/private key pairs and give us 3 public keys to use for encryption

* We use 3 public keys as a part of initialization process to encrypt unsealed keys and the output will be unsealed keys.

* Those unsealed keys will go back through the initialization process, be encrypted by above public keys and administrators can receive their encrypted unsealed keys

* They have private key pairs, so they can decrypt the encrypted unsealed keys and use it

Commands:

* echo public_key_1 | base64 > vaultadmin1.asc

* echo public_key_2 | base64 > vaultadmin2.asc

* echo public_key_3 | base64 > vaultadmin1.asc

* vault operator init -key-shares=3 -key-threshold=2 -pgp-keys="vaultadmin1.asc,vaultadmin2.asc,vaultadmin3.asc" : For Shamir 

    * The Output will give us 3 encrypted unseal keys and root token.

* vault operator init -recovery-shares=3 -recovery-threshold=2 : For auto unseal

### Unseal Vault commands and process: 

Process: 

* Administrators will receive encrypted unsealed key and they need to decode it from base64 with their private key

Command: 

* vault operator unseal: Start unseal process. This command needs to be run multiple times until we hit the threshold for key shares. 

### Seal migration process: 

Process: 

* Update the Vault configuration

* Restart Vault service

* Unseal Vault with migrate flag

Command: 

* add seal block to Vault configurtion files, then restart Vault service

* vault operator unseal -migrate

### Basic Authentication 

Authentication Methods: 

* Provided by plugins

* Multiple methods allowed. Token method is enabled by default and all the other authentication methods are to obtain token.

* Reference external sources: LDAP, GitHub, AWS IAM,...

* All methods are enabled on the path /sys/auth. Example: userpass will use the path /sys/auth/userpass.

* Methods can not be moved after enabled, but they can be tuned and configured

* vault auth list : list existing auth methods

* vault auth enable TYPE : enable an auth method

* vault auth tune PATH : tune an auth method

* vault auth disable PATH : disable an auth method

* vault write auth/userpass/users/foo password=bar : create username foo with password bar

## Vault Secret Engines

Secret engines are plugins used by Vault to handle sensitive data

Key Value Engine:

* Store key/value pairs at a path

* Versioning and metadata in version 2

Transit engine

* Encryption as a service

* It does not store data

* Supported actions: 

    * Encrypt/decrypt

    * Sign and verify

    * Generate hashes

    * Create random bytes

* It manages cryptographic keys instead of store data

Secret engines are enabled on a path, defaults to engine name. All engines are enabled on /sys/mounts

vault secrets list : list existing secret engines

vault secrets enable TYPE : enable a new secret engine