OpenShift Avi Deployment
========================

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

The main components of the Avi Vantage solution, Avi Controllers and Service Engines (SEs), run as containers on OpenShift/Kubernetes minion nodes. For production deployment, a 3-instance Avi Controller cluster is recommended, with the each of the Avi Controller instances running in containers on separate physical nodes. After configuring the Avi Controller cluster for OpensShift/Kubernetes cloud, it deploys one Avi SE container on OpenShift/Kubernetes nodes.

- The system time on all nodes must be synchronized. Use of a Network Time Protocol (NTP) server is recommended.
- The Avi Controller uses password-less sudo SSH to access all the OpenShift nodes in the cluster and create SEs on those nodes. The SSH user must have password-less sudo access to all three OpenShift nodes hosting the Avi Vantage cluster. The SSH method requires a public-private key pair. You can import an existing private key onto the Avi Controller or generate a new key pair. In either case, the public key must be in the “/home/ssh_user/.ssh/authorized_keys” file, where ssh_user is the SSH username on all OpenShift nodes. The Avi Controller setup wizard automatically stores the private key on the Avi Controller node when you import or generate the key.
