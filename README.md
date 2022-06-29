# devtools

- [devtools](#devtools)
  - [Playbooks](#playbooks)
    - [Gitlab Master](#gitlab-master)
    - [Gitlab Runners](#gitlab-runners)
  - [Inventory](#inventory)
  - [Ansible Vault](#ansible-vault)

## Playbooks

Before running these playbooks ensure that the [inventory](#inventory) is properly maintained, and that the [ansible vault prerequisites](#ansible-vault) have been met.

### Gitlab Master

Gitlab masters (as described in the [inventory](#inventory)) are provisioned with...

```bash
ansible-playbook -l gitlab_masters ./ansible/playbooks/gitlab-master.yaml
```

### Gitlab Runners

Gitlab runners (as described in the [inventory](#inventory)) are provisioned with...

```bash
ansible-playbook -l gitlab_runners ./ansible/playbooks/gitlab-runner.yaml
```

## Inventory

The ansible inventory is maintained in the file `ansible/inventory`, with two group `gitlab_masters` and `gitlab_runners`.

## Ansible Vault

The file `ansible/vars/gitlab-secrets.yaml` has been protected with a password using `ansible-vault`...

```bash
ansible-vault encrypt ansible/vars/gitlab-secrets.yaml
```

Playbooks that use this protected file must be supplied with the password to perform the decryption. This can be done by supplying the password on the `anisble-playbook` command-line calls.

Alternatively, this can more conveniently be performed by maintaining a file on your system that holds the password, and then using the environment variable `ANSIBLE_VAULT_PASSWORD_FILE` to locate this file...

```bash
echo "mypassword" > $HOME/.ansible-vault-password
export ANSIBLE_VAULT_PASSWORD_FILE=${HOME}/.ansible-vault-password
```

Once encrypted, the protected file can be edited using the ansible-vault command...

```bash
ansible-vault edit ansible/vars/gitlab-secrets.yaml
```
