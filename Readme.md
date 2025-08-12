# Ansible codebase
To run local geekom.

## Requirements
Assuming python, pip and virtualenv are already installed, you can create a
virtual environment and install the required packages as follows:
```
make install
```

The `requirements.txt` file was created as follows:
```
pip install ansible
pip freeze > requirements.txt
```

SSH access to the hosts defined in the inventory is also requried.

## Repo organization - WIP
I've included two inventory files: `inventory.ini` and `inventory.yaml`. Both of
them have the same content (only one host, for now) so you can assume:
- They are added as example
- You can use any of them

## How to run ansible
```
# Run the "ping" module to the hosts in "local" group
ansible local -m ping -i inventory.{ini,yaml}

# Run the playbook defined
ansible-playbook -i inventory.yaml playbook.yaml

# Same above, but with some extra vars for sudo passwd
ansible-playbook -i inventory.yaml playbook.yaml --extra-vars 'ansible_sudo_pass=f00b4r,.-!@#'

# Same of above, but with extra verbosity
ansible-playbook -i inventory.yaml playbook.yaml --extra-vars 'ansible_sudo_pass=f00b4r,.-!@#' --verbose
```
