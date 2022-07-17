# DevOps Sharing

**WARNING:** The content of this repository is my **personal knowledge**

Please let me know if you find something wrongs and I will fix that

---
## **Protect your root account**

Use secrets manager

Generate a strong random password

Enable multi-factor authentication

## AWS Organizations

Link multiple AWS accounts

* Consolidate billing

* Cost reporting

Share resources

Common IAM policies

Setup is easy and free to use

### Enabling AWS Organizations

Login as root user - Select **username** on the top right panel - **My organization**

Select **Create organization** and make the current account the root master account

### Adding Member Accounts

Existing account

* Root user of account must accept invitation

New account

* When we create new account, it is automatically added to organization

### Organizational Units

```
AWS Organizations
├── Account               
├── Organizational Unit
│   └── Account
└── Organizational Unit
    └── Organizational Unit
        └── Account
```
