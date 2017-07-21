Cisco CSP Avi Deployment
==========================

Requirements
------------

- You will need to have available memory and storage for both the image, and the service on your Cisco CSP device.

Using QCOW image
----------------

Steps
^^^^^

1. Install the Avi Controller role on the host you are executing from.

  .. code-block:: bash

    sudo ansible-galaxy -f avinetworks.avicontroller

2. Identify how we want to define our hosts. Ansible can accept hosts three ways: command-line, by inventory file, or by dynamic inventory file. We will use an inventory in this case. Ansible by default uses /etc/ansible/hosts as it's default inventory. Lets add this segment to the bottom of the page.

  .. code-block:: text

      [csp_devices]
      10.120.222.56

  Replace the IP with the IP of your CSP host you want to deploy to.

3. Make sure you are able to SSH into the CSP device. To verify login, then logout.

  .. code-block:: bash

    ssh user@10.120.222.56

4. Create the playbook. It should look similar to this

  .. code-block:: yaml

    # myplaybook.yml
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
          con_csp_num_cpu: 4
          con_csp_memory_gb: 16

  con_deploy_type:
      Sets the type of deployment that should be triggered.
  con_csp_user:
      Username that will be used to connect to the CSP server
  con_csp_password:
      Password required to authenticate the user
  con_csp_qcow_image_file:
      is the relative, or absolute location of the qcow file that will be uploaded to the CSP device.
  con_csp_mgmt_ip:
      IP of the controller on the management network.
  con_csp_mgmt_mask:
      Subnet mask that the controller will require.
  con_csp_default_gw:
      Default gateway for the controller
  con_csp_service_name:
      Name of the service to be created on the CSP
  con_csp_num_cpu:
      Number of CPUs to be allocated to the Controller
  con_csp_memory_gb:
      Amount of memory in GB allocated to the Controller

  .. note:: There are are many possible values which can be found on the roles README file (https://github.com/avinetworks/ansible-role-avicontroller). Each one allows customization of the deployment.

  .. _CSP Deployment Variables: https://github.com/avinetworks/ansible-role-avicontroller#csp-deployment-variables

  In this playbook we are specifying that this "play" should apply to the "csp_devices" hosts. Anything not required mentioned here `CSP Deployment Variables`_ can be omitted from your role parameters. Defaults are also noted on that document.

5. Execute the playbook.

  .. note::
    - If you are not using an ssh-key you will also need to specify `--ask-pass` to ansible.
    - If your current user is different you will need to specify `-u <username>` to ansible.

  .. code:: bash

    ansible-playbook myplaybook.yml -u <username> --ask-pass
