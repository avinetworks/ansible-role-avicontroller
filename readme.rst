avinetworks.avicontroller
=========================

|Build Status| |Ansible Galaxy|

Using this module you are able to install the Avi Vantage Controlller,
to your system. However, minimum requirements must be met.

Requirements
------------

Requires Docker to be installed. We have created ``avinetworks.docker``
to install Docker on a host. Please run that role first, or manually
install Docker.

Role Variables
--------------

Setting Deployment type
~~~~~~~~~~~~~~~~~~~~~~~

+-------------+-------------+------------+-------------------------+
| Variable    | Required    | Default    | Comments                |
+=============+=============+============+=============+
| ``con_deplo | No          | ``docker`` | Sets the    |
| y_type``    |             |            | type of     |
|             |             |            | deployment  |
|             |             |            | that should |
|             |             |            | be          |
|             |             |            | triggered.  |
|             |             |            | Valid       |
|             |             |            | options:    |
|             |             |            | ``docker``, |
|             |             |            | ``csp``     |
+-------------+-------------+------------+-------------+

Standard Parameters
~~~~~~~~~~~~~~~~~~~

+-------------+-------------+------------+-------------+
| Variable    | Required    | Default    | Comments    |
+=============+=============+============+=============+
| ``con_skip_ | No          | ``false``  | Skips any   |
| requirement |             |            | requirement |
| s``         |             |            | s           |
|             |             |            | for disk    |
|             |             |            | space, ram, |
|             |             |            | and cpu.    |
+-------------+-------------+------------+-------------+

Package Deploy Variables
~~~~~~~~~~~~~~~~~~~~~~~~

+-------------+-------------+------------+-------------+
| Variable    | Required    | Default    | Comments    |
+=============+=============+============+=============+
| ``con_packa | No          | ``false``  | Set to true |
| ge_deploy`` |             |            | to deploy   |
|             |             |            | via package |
+-------------+-------------+------------+-------------+
| ``con_packa | No          | ``controll | Source      |
| ge_source`` |             | er_docker. | location of |
|             |             | tgz``      | the docker  |
|             |             |            | tgz         |
+-------------+-------------+------------+-------------+
| ``con_packa | No          | ``/tmp/con | Destination |
| ge_dest``   |             | troller_do | location on |
|             |             | cker.tgz`` | the remote  |
|             |             |            | server      |
+-------------+-------------+------------+-------------+

Docker Hub and Docker Repo Variables
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

+-------------+-------------+------------+-------------+
| Variable    | Required    | Default    | Comments    |
+=============+=============+============+=============+
| ``con_docke | No          | ``None``   | If using a  |
| r_repo``    |             |            | local       |
|             |             |            | repository  |
|             |             |            | please      |
|             |             |            | enter it    |
|             |             |            | here.       |
+-------------+-------------+------------+-------------+
| ``con_versi | No          | ``latest`` | Version of  |
| on``        |             |            | the Avi     |
|             |             |            | Controller  |
|             |             |            | package you |
|             |             |            | want to     |
|             |             |            | deploy.     |
+-------------+-------------+------------+-------------+
| ``con_image | No          | ``avinetwo | Full name   |
| ``          |             | rks/contro | of the      |
|             |             | ller:{{ co | controller  |
|             |             | n_version  | image.      |
|             |             | }}``       |             |
+-------------+-------------+------------+-------------+
| ``con_docke | No          | ``None``   | User to be  |
| r_repo_user |             |            | used for    |
| ``          |             |            | repository  |
|             |             |            | authenticat |
|             |             |            | ion.        |
+-------------+-------------+------------+-------------+
| ``con_docke | No          | ``None``   | Password to |
| r_repo_pass |             |            | be used for |
| word``      |             |            | repository  |
|             |             |            | authenticat |
|             |             |            | ion.        |
+-------------+-------------+------------+-------------+

Docker Deployment Variables
~~~~~~~~~~~~~~~~~~~~~~~~~~~

+-------------+-------------+------------+-------------+
| Variable    | Required    | Default    | Comments    |
+=============+=============+============+=============+
| ``con_cores | No          | ``{{ ansib | How many    |
| ``          |             | le_process | cores the   |
|             |             | or_cores * | controller  |
|             |             |  ansible_p | will use.   |
|             |             | rocessor_c |             |
|             |             | ount }}``  |             |
+-------------+-------------+------------+-------------+
| ``con_memor | No          | ``{{ ansib | How much    |
| y_gb``      |             | le_memtota | memory the  |
|             |             | l_mb // 10 | controller  |
|             |             | 24 }}``    | will use.   |
+-------------+-------------+------------+-------------+
| ``con_desti | No          | ``auto-det | The disk    |
| nation_disk |             | ect based  | that the    |
| ``          |             | on ansible | controller  |
|             |             | _mounts la | data will   |
|             |             | rgest size | be          |
|             |             | d disk``   | installed   |
+-------------+-------------+------------+-------------+
| ``con_disk_ | No          | ``{{ desti | The path    |
| path``      |             | nation_dis | that the    |
|             |             | k }}opt/av | controller  |
|             |             | i/controll | data will   |
|             |             | er/data``  | be          |
|             |             |            | installed.  |
+-------------+-------------+------------+-------------+
| ``con_disk_ | No          | ``30``     | The size of |
| gb``        |             |            | the disk    |
|             |             |            | that will   |
|             |             |            | be used by  |
|             |             |            | controller  |
|             |             |            | data.       |
+-------------+-------------+------------+-------------+
| ``con_metri | No          | ``None``   | The path    |
| cs_disk_pat |             |            | that the    |
| h``         |             |            | controller  |
|             |             |            | metric data |
|             |             |            | will be     |
|             |             |            | stored.     |
+-------------+-------------+------------+-------------+
| ``con_metri | No          | ``None``   | The size of |
| cs_disk_gb` |             |            | the disk    |
| `           |             |            | that will   |
|             |             |            | be used by  |
|             |             |            | metric      |
|             |             |            | data.       |
+-------------+-------------+------------+-------------+
| ``con_logs_ | No          | ``None``   | The path    |
| disk_path`` |             |            | that the    |
|             |             |            | controller  |
|             |             |            | log data    |
|             |             |            | will be     |
|             |             |            | stored.     |
+-------------+-------------+------------+-------------+
| ``con_logs_ | No          | ``None``   | The size of |
| disk_gb``   |             |            | the disk    |
|             |             |            | that will   |
|             |             |            | be used by  |
|             |             |            | log data.   |
+-------------+-------------+------------+-------------+
| ``con_contr | No          | ``{{ ansib | The IP      |
| oller_ip``  |             | le_default | address of  |
|             |             | _ipv4.addr | the         |
|             |             | ess }}``   | controller. |
+-------------+-------------+------------+-------------+
| ``con_dev_n | No          | ``auto-det | The device  |
| ame``       |             | ect based  | name that   |
|             |             | on con_con | will be     |
|             |             | troller_ip | used by the |
|             |             | ``         | controller. |
+-------------+-------------+------------+-------------+
| ``con_setup | No          | ``None``   | The source  |
| _json``     |             |            | location of |
|             |             |            | the         |
|             |             |            | setup.json  |
|             |             |            | file. Used  |
|             |             |            | to          |
|             |             |            | auto-config |
|             |             |            | ure         |
|             |             |            | a           |
|             |             |            | controller. |
+-------------+-------------+------------+-------------+
| ``con_fresh | No          | ``false``  | Erases any  |
| _install``  |             |            | pre-existin |
|             |             |            | g           |
|             |             |            | directories |
|             |             |            | associated  |
|             |             |            | with the    |
|             |             |            | controller. |
+-------------+-------------+------------+-------------+
| ``con_porta | No          | ``80``     | Port used   |
| l_http_port |             |            | for the     |
| ``          |             |            | controllers |
|             |             |            | unsecured   |
|             |             |            | web         |
|             |             |            | interface.  |
+-------------+-------------+------------+-------------+
| ``con_porta | No          | ``443``    | Port used   |
| l_https_por |             |            | for the     |
| t``         |             |            | controllers |
|             |             |            | secured web |
|             |             |            | interface.  |
+-------------+-------------+------------+-------------+
| ``con_sysin | No          | ``8443``   | Port to be  |
| t_port``    |             |            | used by the |
|             |             |            | controller  |
|             |             |            | communicati |
|             |             |            | on          |
|             |             |            | interface.  |
+-------------+-------------+------------+-------------+
| ``con_contr | No          | ``5098``   | Port used   |
| oller_ssh_p |             |            | to connect  |
| ort``       |             |            | directly to |
|             |             |            | the         |
|             |             |            | controllers |
|             |             |            | ssh port.   |
+-------------+-------------+------------+-------------+
| ``con_servi | No          | ``5099``   | Port used   |
| ceengine_ss |             |            | to connect  |
| h_port``    |             |            | directly to |
|             |             |            | the service |
|             |             |            | engines ssh |
|             |             |            | port.       |
+-------------+-------------+------------+-------------+
| ``con_contr | No          | ``5054``   | Port used   |
| oller_cli_p |             |            | to access   |
| ort``       |             |            | the command |
|             |             |            | line        |
|             |             |            | interface   |
|             |             |            | of the      |
|             |             |            | controller. |
+-------------+-------------+------------+-------------+
| ``con_snmp_ | No          | ``161``    | UDP port    |
| port``      |             |            | used to     |
|             |             |            | access the  |
|             |             |            | SNMP        |
|             |             |            | service on  |
|             |             |            | the         |
|             |             |            | controller. |
+-------------+-------------+------------+-------------+
| ``con_mount | No          | ``[]``     | Extra       |
| s_extras``  |             |            | mounting    |
|             |             |            | points to   |
|             |             |            | be used by  |
|             |             |            | the         |
|             |             |            | controller. |
+-------------+-------------+------------+-------------+
| ``con_env_v | No          | ``[]``     | Extra       |
| ariables_ex |             |            | environment |
| tras``      |             |            | variables   |
|             |             |            | to be used  |
|             |             |            | by the      |
|             |             |            | controller. |
+-------------+-------------+------------+-------------+
| ``con_ports | No          | ``[]``     | Extra ports |
| _list_extra |             |            | to be used  |
| s``         |             |            | by the      |
|             |             |            | controller. |
+-------------+-------------+------------+-------------+

CSP Deployment Variables
~~~~~~~~~~~~~~~~~~~~~~~~

These are only marked required, for when you are using CSP Deployment.

+-------------+-------------+------------+-------------+
| Variable    | Required    | Default    | Comments    |
+=============+=============+============+=============+
| ``con_csp_u | Yes         | ``None``   | Username    |
| ser``       |             |            | that will   |
|             |             |            | be used to  |
|             |             |            | connect to  |
|             |             |            | the CSP     |
|             |             |            | server      |
+-------------+-------------+------------+-------------+
| ``con_csp_p | Yes         | ``None``   | Password    |
| assword``   |             |            | required to |
|             |             |            | authenticat |
|             |             |            | e           |
|             |             |            | the user    |
+-------------+-------------+------------+-------------+
| ``con_csp_q | No          | ``controll | Relative or |
| cow_image_f |             | er.qcow``  | absolute    |
| ile``       |             |            | location of |
|             |             |            | the         |
|             |             |            | controller  |
|             |             |            | qcow        |
+-------------+-------------+------------+-------------+
| ``con_csp_m | Yes         | ``None``   | IP of the   |
| gmt_ip``    |             |            | controller  |
|             |             |            | on the      |
|             |             |            | management  |
|             |             |            | network.    |
+-------------+-------------+------------+-------------+
| ``con_csp_m | Yes         | ``None``   | Subnet mask |
| gmt_mask``  |             |            | that the    |
|             |             |            | controller  |
|             |             |            | will        |
|             |             |            | require.    |
+-------------+-------------+------------+-------------+
| ``con_csp_d | Yes         | ``None``   | Default     |
| efault_gw`` |             |            | gateway for |
|             |             |            | the         |
|             |             |            | controller  |
+-------------+-------------+------------+-------------+
| ``con_csp_d | No          | ``64``     | Amount of   |
| isk_size``  |             |            | disk space  |
|             |             |            | in GB for   |
|             |             |            | the         |
|             |             |            | controller  |
+-------------+-------------+------------+-------------+
| ``con_csp_s | No          | ``avi-cont | Name of the |
| ervice_name |             | roller``   | service to  |
| ``          |             |            | be created  |
|             |             |            | on the CSP  |
+-------------+-------------+------------+-------------+
| ``con_csp_n | No          | ``4``      | Number of   |
| um_cpu``    |             |            | CPUs to be  |
|             |             |            | allocated   |
|             |             |            | to the      |
|             |             |            | Controller  |
+-------------+-------------+------------+-------------+
| ``con_csp_m | No          | ``16``     | Amount of   |
| emory_gb``  |             |            | memory in   |
|             |             |            | GB          |
|             |             |            | allocated   |
|             |             |            | to the      |
|             |             |            | Controller  |
+-------------+-------------+------------+-------------+

Parameter Override Variables
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

| However, you are able to provide these parameters another way. Using
  the following variables. This will allow the user to customize all
  values.
| **!!!BEWARE: USING THIS WILL ERASE DEFAULTS - USE WITH CAUTION!!!**

.. code-block:: yaml

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

Example Playbook
----------------

    | **WARNING**
    | Before using this example please make the correct changes required
      for your server.
    | For more information please visit
      [https://kb.avinetworks.com/avi-controller-sizing/]
      (https://kb.avinetworks.com/avi-controller-sizing/)
    | It is recommended you adjust these parameters based on the
      implementation desired.

Docker Deployment Examples
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: yaml

    - hosts: servers
      roles:
        - role: avinetworks.avicontroller
          con_controller_ip: 10.10.27.101
          con_cores: 4                     # If not specified core count is 4
          con_memory_gb: 12                 # If not specified memory count is 12

The following is an example with minimum parameters.

.. code-block:: yaml

    - hosts: servers
      roles:
        - role: avinetworks.avicontroller

CSP Deployment Example
~~~~~~~~~~~~~~~~~~~~~~

.. note::

  When running. ``gather_facts`` needs to be set to ``false``, failure to do so will cause Ansible failure on first step.

.. code-block:: yaml

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

License
-------

BSD

Author Information
------------------

| Eric Anderson
| `Avi Networks <http://avinetworks.com>`__

.. |Build Status| image:: https://travis-ci.org/avinetworks/ansible-role-avicontroller.svg?branch=master
   :target: https://travis-ci.org/avinetworks/ansible-role-avicontroller
.. |Ansible Galaxy| image:: https://img.shields.io/badge/galaxy-avinetworks.avicontroller-blue.svg
   :target: https://galaxy.ansible.com/avinetworks/avicontroller/
