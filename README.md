[![Build Status](https://travis-ci.com/calvinbui/ansible-xsibackup.svg?branch=master)](https://travis-ci.com/calvinbui/ansible-xsibackup)

# Ansible XSIBackup

Installs XSIBackup on ESXi and configures cron jobs

##  Requirements

N/A

## Role Variables

`xsibackup_version`: Version to install. Must be a zip file in `files`

`xsibackup_working_dir`: Where to extract xsibackup and create directories

`xsibackup_backup_dir`: Where to put backups

`xsibackup_jobs`: `name` and `cron` of the job. The `name` must match a `template`.

`xsibackup_cleaner`: `cron` and `days_to_keep` for backup using the python backup cleaner.

## Dependencies

N/A

## Example Playbook

```yaml
- hosts: servers
  become: true
  roles:
    - role: calvinbui.ansible_xsibackup
```

## License

GPLv3

## Author Information

http://calvin.me
