# `ansible` role `openntpd`

Install and configure `ntpd` from the OpenBSD project.

# Requirements

None

# Role Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `openntpd_user` | User name of `ntpd` | `{{ __openntpd_user }}` |
| `openntpd_group` | Group name of `ntpd` | `{{ __openntpd_group }}` |
| `openntpd_service` | Service name of `ntpd` | `{{ __openntpd_service }}` |
| `openntpd_package` | Package name of `ntpd` | `{{ __openntpd_package }}` |
| `openntpd_conf_dir` | Path to base directory of `ntpd.conf` | `{{ __openntpd_conf_dir }}` |
| `openntpd_conf_file` | Path to `ntpd.conf` | `{{ openntpd_conf_dir }}/ntpd.conf` |
| `openntpd_bin` | Path to `ntpd` | `{{ __openntpd_bin }}` |
| `openntpd_flags` | Additional flags for service `ntpd` | `""` |

## Debian

| Variable | Default |
|----------|---------|
| `__openntpd_user` | `ntpd` |
| `__openntpd_group` | `ntpd` |
| `__openntpd_service` | `openntpd` |
| `__openntpd_package` | `openntpd` |
| `__openntpd_conf_dir` | `/etc/openntpd` |
| `__openntpd_bin` | `/usr/sbin/ntpd` |

## FreeBSD

| Variable | Default |
|----------|---------|
| `__openntpd_user` | `_ntpd` |
| `__openntpd_group` | `_ntpd` |
| `__openntpd_service` | `openntpd` |
| `__openntpd_package` | `openntpd` |
| `__openntpd_conf_dir` | `/usr/local/etc` |
| `__openntpd_bin` | `/usr/local/sbin/ntpd` |

## OpenBSD

| Variable | Default |
|----------|---------|
| `__openntpd_user` | `_ntpd` |
| `__openntpd_group` | `_ntpd` |
| `__openntpd_service` | `ntpd` |
| `__openntpd_package` | `""` |
| `__openntpd_conf_dir` | `/etc` |
| `__openntpd_bin` | `/usr/sbin/ntpd` |

# Dependencies

None

# Example Playbook

```yaml
- hosts: localhost
  roles:
    - ansible-role-openntpd
  vars:
    openntpd_flags: -s
    openntpd_config: |
      servers pool.ntp.org
      sensor *
      constraints from "https://www.google.com"
```

# License

```
Copyright (c) 2018 Tomoyuki Sakurai <y@trombik.org>

Permission to use, copy, modify, and distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
```

# Author Information

Tomoyuki Sakurai <y@trombik.org>

This README was created by [qansible](https://github.com/trombik/qansible)
