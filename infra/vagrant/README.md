# Vagrantfile

## Setup
```bash
$ git clone git@github.com:boris/vagrant.git
$ cd vagrant
$ vagrant status
Current machine states:

ubuntu_chef               not created (virtualbox)
ubuntu                    not created (virtualbox)
arch                      not created (virtualbox)

This environment represents multiple VMs. The VMs are all listed
above with their current state. For more information about a specific
VM, run `vagrant status NAME`.
$ vagarnt up instance2
```

## Provision
This Vagrantfile contains the configuration for three different instances, each
of them provisioned with different methods.

The first one `instance0` is provisioned using `chef_client`. To use this
provision method, modify the following variables:

- `chef.chef_server_url`
- `chef.node_name`: the name your instance will send to chef server
- `chef.validation_key_path`: where your `.pem` key is
- `chef.validation_client_name`: the used associated to your `.pem` key.

## Add vagrant box
To add the vagrant box for ArchLinux included in this config, run the following
command:

```
$ vagrant box add arch64_2013 https://dl.dropboxusercontent.com/u/31112574/arch64-20130801.box
```
