Using Docker Hub
------------------------

Deploying Avi Controller from the Docker Hub is the default action. However it does require the server to have internet access to Docker Hub as it will download the image.

Steps
^^^^^

1. Install the Avi Controller role on the host you are executing from.

  .. code-block:: bash

    sudo ansible-galaxy -f avinetworks.avicontroller

2. Identify how we want to define our hosts. Ansible can accept hosts three ways: command-line, by inventory file, or by dynamic inventory file. We will use an inventory in this case. Ansible by default uses /etc/ansible/hosts as it's default inventory. Lets add this segment to the bottom of the page.

  .. code-block:: text

      [avicontrollers]
      10.120.202.24

  Replace the IP with the IP of your baremetal host you want to deploy to.

3. Create the playbook. It should look similar to this

  .. code-block:: yaml

    # myplaybook.yml
    ---
    - hosts: avicontrollers
      become: true
      roles:
        - role: avinetworks.avicontroller
          con_controller_ip: 10.120.202.24
          con_deploy_type: openshift
          con_cores: 4
          con_memory_gb: 16

  However, there are are many possible values which can be found on the roles README file (https://github.com/avinetworks/ansible-role-avicontroller). Each one allows customization of the deployment.

  In this playbook we are specifying that this "play" should apply to the "avicontrollers" hosts. Which we have previously defined in the inventory file. We are also specifying that the controllers IP is 10.10.27.101, this is used to properly determine the interface that the controller will use. We are then specifying the core count that the controller will use. This is the amount of cores that docker will be permitted to use for the controller. Then we specify the amount of memory in GB that the controller will be permitted to use. We recommend using 16GB or more.

4. Verify your local user has access to the hosts you are deploying the controller to. You will need `sudo` access as well. Login using your current user to make sure you can login. Make sure to logout when done to execute your playbook from your hose.

  .. code-block:: bash

    ssh 10.120.202.24

5. Execute the playbook.

  .. note::
    - If you are not using an ssh-key you will also need to specify `--ask-pass` to ansible.
    - If your current user is different you will need to specify `-u <username>` to ansible.

  .. code:: Bash

    ansible-playbook myplaybook.yml -u <username> --ask-pass
