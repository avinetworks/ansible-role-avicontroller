# avinetworks.avicontroller

[![Build Status](https://travis-ci.org/avinetworks/ansible-role-avicontroller.svg?branch=master)](https://travis-ci.org/avinetworks/ansible-role-avicontroller)
[![Ansible Galaxy](https://img.shields.io/badge/galaxy-avinetworks.avicontroller-blue.svg)](https://galaxy.ansible.com/avinetworks/avicontroller/)

Using this module you are able to install the Avi Vantage Controlller, to your system. However, minimum requirements must be met.

## Requirements

Requires Docker to be installed. We have created `avinetworks.docker` to install Docker on a host. Please run that role first, or manually install Docker.

## Role Variables

| Variable | Required | Default | Comments |
|-----------------------|----------|-----------|---------|
| `package_deploy` | No | `false` | Set to true to deploy via package   |
| `package_source` | No | `controller_docker.tgz` | Source location of the docker tgz |
| `package_dest` | No | `/tmp/controller_docker.tgz` | Destination location on the remote server |
| `docker_repo` | No | `None` | If using a local repository please enter it here. |
| `con_version` | No | `latest` | Version of the Avi Controller package you want to deploy. |
| `con_image` | No | `avinetworks/controller:{{ con_version }}` | Full name of the controller image. |
| `con_cores` | No | `{{ ansible_processor_cores * ansible_processor_count }}` | How many cores the controller will use. |
| `con_memory_gb` | No | `{{ ansible_memtotal_mb // 1024 }}` | How much memory the controller will use.  |
| `destination_disk` | No | `auto-detect based on ansible_mounts largest sized disk` | The disk that the controller data will be installed |
| `con_disk_path` | No | `{{ destination_disk }}opt/avi/controller/data` | The path that the controller data will be installed. |
| `con_disk_gb` | No | `30` | The size of the disk that will be used by controller data. |
| `con_metrics_disk_path` | No | `None` | The path that the controller metric data will be stored. |
| `con_metrics_disk_gb` | No | `None` | The size of the disk that will be used by metric data. |
| `con_logs_disk_path` | No | `None` | The path that the controller log data will be stored. |
| `con_logs_disk_gb` | No | `None` | The size of the disk that will be used by log data. |
| `controller_ip` | No | `{{ ansible_default_ipv4.address }}` | The IP address of the controller. |
| `dev_name` | No | `auto-detect based on controller_ip` | The device name that will be used by the controller. |
| `setup_json` | No | `None` | The source location of the setup.json file. Used to auto-configure a controller. |
| `fresh_install` | No | `false` | Erases any pre-existing directories associated with the controller. |
| `skip_requirements` | No | `false` | Skips any requirements for disk space, ram, and cpu. |
| `portal_http_port` | No | `80` | Port used for the controllers unsecured web interface. |
| `portal_https_port` | No | `443` | Port used for the controllers secured web interface. |
| `sec_channel_neg_port` | No | `8443` | Port to be used by the controller communication interface. |
| `controller_ssh_port` | No | `5098` | Port used to connect directly to the controllers ssh port. |
| `serviceengine_ssh_port` | No | `5099` | Port used to connect directly to the service engines ssh port. |
| `controller_cli_port` | No | `5054` | Port used to access the command line interface of the controller. |
| `snmp_port` | No | `161` | UDP port used to access the SNMP service on the controller. |
| `mounts_extras` | No | `[]` | Extra mounting points to be used by the controller. |
| `env_variables_extras` | No | `[]` | Extra environment variables to be used by the controller. |
| `ports_list_extras` | No | `[]` | Extra ports to be used by the controller. |

### Parameter Override Variables
However, you are able to provide these parameters another way. Using the following variables. This will allow the user to customize all values.  
**!!!BEWARE: USING THIS WILL ERASE DEFAULTS - USE WITH CAUTION!!!**

```

env_variables_all:
  - "CONTAINER_NAME=avicontroller"
  - "MANAGEMENT_IP={{ controller_ip | string}}"
  - "NUM_CPU={{ con_cores }}"
  - "NUM_MEMG={{ con_memory_gb }}"
  - "DISK_GB={{ con_disk_gb }}"

mounts_all:
  - "/:/hostroot/"
  - "/var/run/docker.sock:/var/run/docker.sock"
  - "{{ con_disk_path }}:/vol/"

ports_list_all:
  - "5098:5098"
  - "80:80"
  - "443:443"
  - "8443:8443"
  - "5054:5054"
  - "161:161/udp"
```

## Example Playbook

**WARNING:**
**Before using this example please make the correct changes required for your server.  
For more information please visit [https://kb.avinetworks.com/avi-controller-sizing/] (https://kb.avinetworks.com/avi-controller-sizing/)**

**It is recommended you adjust these parameters based on the implementation desired.**

```

- hosts: servers
  roles:
    - role: avinetworks.avicontroller
      controller_ip: 10.10.27.101
      con_cores: 4                     # If not specified core count is 4
      con_memory_gb: 12                 # If not specified memory count is 12
```

The following is an example with minimum parameters.
```

- hosts: servers
  roles:
    - role: avinetworks.avicontroller
```


## License

MIT

## Author Information

Eric Anderson  
[Avi Networks](http://avinetworks.com)
