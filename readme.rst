Bare-metal Avi Deployment
=========================

Below are the current methods of deployment supported by this role to deploy the Avi Controller. Please select from the options below to learn how to deploy using each configuration.

.. toctree::
    :maxdepth: 1

    docker_hub
    private_repository
    compressed_image

Requirements
------------

- CentOS/RHEL/OracleLinux 7.x
- Ubuntu 14.04 or higher
- Docker 1.12 or higher

Preparing Your Host
-------------------

Prior to delpoying this role on your servers you may want to also configure the server for your environment. Some tasks you may want to include:

- configure network interfaces
- install Docker, either with another role, or manually from the Docker website
- turn off built-in firewalls (firewalld, ufw, etc.)
- turn off yum-cron if you're using CentOS, Oracle, or RedHat Linux
- subscribe your RedHat host to the Red Hat Subscription Manager
- deploying users, ssh-keys, etc.
- registering the host with another internal tool for tracking or monitoring

There are tons of things I am sure not listed that you may think of, but should be included in preparing a host for deploying the Controller to a baremetal host.

We also want to make sure you don't have multiple items trying to manage this server at the same time. If you must then make sure all entities managing the server aren't managing the same components. You could end up with a conflict where one tool is telling the server to meet one spec, and another is changing it back, and then you have both tools changing each others actions back. (Not good for consistency)
