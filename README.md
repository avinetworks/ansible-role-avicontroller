# avinetworks.avicontroller

[![Build Status](https://travis-ci.org/avinetworks/ansible-role-avicontroller.svg?branch=master)](https://travis-ci.org/avinetworks/ansible-role-avicontroller)
[![Ansible Galaxy](https://img.shields.io/badge/galaxy-avinetworks.avicontroller-blue.svg)](https://galaxy.ansible.com/avinetworks/avicontroller/)

Using this module you are able to install the Avi Vantage Controlller, to your system. However, minimum requirements must be met.

> **Warning:**  
This Ansible role is not meant to be ran repeatedly on the host. It's meant for deployment only. Once deployed the configuration for Avi is managed by Avi.

## Requirements

Requires Docker to be installed. We have created `avinetworks.docker` to install Docker on a host. Please run that role first, or manually install Docker.

## Role Variables
### Setting Deployment type
| Variable | Required | Default | Comments |
|----------|----------|---------|----------|
| `con_deploy_type` | No | `docker` | Sets the type of deployment that should be triggered. Valid options: `docker`, `csp`, `openshift` |

### Standard Parameters
| Variable | Required | Default | Comments |
|----------|----------|---------|----------|
| `con_skip_requirements` | No | `false` | Skips any requirements for disk space, ram, and cpu. |

### Package Deploy Variables
| Variable | Required | Default | Comments |
|----------|----------|---------|----------|
| `con_package_deploy` | No | `false` | Set to true to deploy via package   |
| `con_package_source` | No | `controller_docker.tgz` | Source location of the docker tgz |
| `con_package_dest` | No | `/tmp/controller_docker.tgz` | Destination location on the remote server |

### Docker Hub and Docker Repo Variables
| Variable | Required | Default | Comments |
|----------|----------|---------|----------|
| `con_docker_repo` | No | `None` | If using a local repository please enter it here. |
| `con_version` | No | `17.2.4-9024-20171127.023607` | Version of the Avi Controller package you want to deploy. |
| `con_image` | No | `avinetworks/controller:{{ con_version }}` | Full name of the controller image. |
| `con_docker_repo_user` | No | `None` | User to be used for repository authentication. |
| `con_docker_repo_password` | No | `None` | Password to be used for repository authentication. |

### Docker Deployment Variables
| Variable | Required | Default | Comments |
|----------|----------|---------|----------|
| `con_cores` | No | `{{ ansible_processor_cores * ansible_processor_count }}` | How many cores the controller will use. |
| `con_memory_gb` | No | `{{ ansible_memtotal_mb // 1024 }}` | How much memory the controller will use.  |
| `con_destination_disk` | No | `auto-detect based on ansible_mounts largest sized disk` | The disk that the controller data will be installed |
| `con_disk_path` | No | `{{ destination_disk }}opt/avi/controller/data` | The path that the controller data will be installed. |
| `con_disk_gb` | No | `30` | The size of the disk that will be used by controller data. |
| `con_metrics_disk_path` | No | `None` | The path that the controller metric data will be stored. |
| `con_metrics_disk_gb` | No | `None` | The size of the disk that will be used by metric data. |
| `con_logs_disk_path` | No | `None` | The path that the controller log data will be stored. |
| `con_logs_disk_gb` | No | `None` | The size of the disk that will be used by log data. |
| `con_controller_ip` | No | `{{ ansible_default_ipv4.address }}` | The IP address of the controller. |
| `con_dev_name` | No | `auto-detect based on con_controller_ip` | The device name that will be used by the controller. |
| `con_setup_json` | No | `None` | The source location of the setup.json file. Used to auto-configure a controller. |
| `con_setup_json_raw` | No | `None` | Allows a user to input the setup.json data in YAML or JSON format directly in Ansible. |
| `con_fresh_install` | No | `false` | Erases any pre-existing directories associated with the controller. |
| `con_portal_http_port` | No | `80` | Port used for the controllers unsecured web interface. |
| `con_portal_https_port` | No | `443` | Port used for the controllers secured web interface. |
| `con_sysint_port` | No | `8443` | Port to be used by the controller communication interface. |
| `con_ssh_port` | No | `5098` | Port used to connect directly to the controllers ssh port. |
| `con_serviceengine_ssh_port` | No | `5099` | Port used to connect directly to the service engines ssh port. |
| `con_cli_port` | No | `5054` | Port used to access the command line interface of the controller. |
| `con_snmp_port` | No | `161` | UDP port used to access the SNMP service on the controller. |
| `con_mounts_extras` | No | `[]` | Extra mounting points to be used by the controller. |
| `con_env_variables_extras` | No | `[]` | Extra environment variables to be used by the controller. |
| `con_ports_list_extras` | No | `[]` | Extra ports to be used by the controller. |
| `con_force_deploy` | No | `false` | Forces Ansible to run on the host, does not skip tasks. |

### CSP Deployment Variables
These are only marked required, for when you are using CSP Deployment.

| Variable | Required | Default | Comments |
|----------|----------|---------|----------|
| `con_csp_user` | Yes | `None` | Username that will be used to connect to the CSP server |
| `con_csp_password` | Yes | `None` | Password required to authenticate the user |
| `con_csp_qcow_image_file` | No | `controller.qcow` | Relative or absolute location of the controller qcow |
| `con_csp_mgmt_ip` | Yes | `None` | IP of the controller on the management network. |
| `con_csp_mgmt_mask` | Yes | `None` | Subnet mask that the controller will require. |
| `con_csp_default_gw` | Yes | `None` | Default gateway for the controller |
| `con_csp_disk_size` | No | `64` | Amount of disk space in GB for the controller |
| `con_csp_service_name` | No | `avi-controller` | Name of the service to be created on the CSP |
| `con_csp_num_cpu` | No | `4` | Number of CPUs to be allocated to the Controller |
| `con_csp_memory_gb` | No | `16` | Amount of memory in GB allocated to the Controller |
| `con_csp_hsm_ip` | No | `None` | IP Address and Subnet for Dedicated HSM interface, ex. 10.160.100.221/24 |
| `con_csp_hsm_mask` | No | `None` | Netmask of the interface that will talk to HSM |
| `con_csp_hsm_static_routes` | No | `None` | Static routes for HSM, ex. 10.128.1.0/24 via 10.160.100.1 |
| `con_csp_hsm_vnic_id` | No | `None` | VNIC id, of the HSM interface configured on this interface ex. 1 |
| `con_csp_bond_ifs` | No | `None` | Bonds the listed interfaces together. Ex. '1,2 3,4' bonds 1 with 2, and 3 with 4 |

### Parameter Override Variables
However, you are able to provide these parameters another way. Using the following variables. This will allow the user to customize all values.  
**!!!BEWARE: USING THIS WILL ERASE DEFAULTS - USE WITH CAUTION!!!**

```

con_env_variables_all:
  - "CONTAINER_NAME=avicontroller"
  - "MANAGEMENT_IP={{ con_controller_ip | string}}"
  - "NUM_CPU={{ con_cores }}"
  - "NUM_MEMG={{ con_memory_gb }}"
  - "DISK_GB={{ con_disk_gb }}"

con_mounts_all:
  - "/:/hostroot/"
  - "/var/run/docker.sock:/var/run/docker.sock"
  - "{{ con_disk_path }}:/vol/"

con_ports_list_all:
  - "5098:5098"
  - "80:80"
  - "443:443"
  - "8443:8443"
  - "5054:5054"
  - "161:161/udp"
```

## Example Playbook

> **WARNING:**  
Before using this example please make the correct changes required for your server.  
For more information please visit [https://kb.avinetworks.com/avi-controller-sizing/](https://kb.avinetworks.com/avi-controller-sizing/)  
It is recommended you adjust these parameters based on the implementation desired.


### Docker Deployment Examples
```

- hosts: servers
  roles:
    - role: avinetworks.avicontroller
      con_controller_ip: 10.10.27.101
      con_cores: 4                     # If not specified core count is 4
      con_memory_gb: 12                 # If not specified memory count is 12
```

The following is an example with minimum parameters.
```

- hosts: servers
  roles:
    - role: avinetworks.avicontroller
```

### CSP Deployment Example

> **Note:**  
When running. `gather_facts` needs to be set to `false`, failure to do so will cause Ansible failure on first step.

```
---
- hosts: csp_devices
  gather_facts: false
  roles:
    - role: avinetworks.avicontroller
      con_deploy_type: csp
      con_csp_user: admin
      con_csp_password: password
      con_csp_qcow_image_file: avi-controller.qcow2
      con_csp_mgmt_ip: 10.128.2.20
      con_csp_mgmt_mask: 255.255.255.0
      con_csp_default_gw: 10.128.2.1
      con_csp_service_name: avi-controller
      con_csp_memory_gb: 32
      con_csp_num_cpu: 16
      con_csp_vnics:
        - nic: '0'
          type: access
          tagged: 'false'
          network_name: enp1s0f0
      con_csp_bond_ifs: '1,2'
```

## License

BSD

## Author Information

Eric Anderson  
[Avi Networks](http://avinetworks.com)
