
As a final application, I choose a container with todo and a database from the docker tutorial 
- create n=2 virtual machines, one for todo app, the other for mysql DB 

## Terraform
 - openstack provider
 - networks
 - subnets
 - Create public ssh key and attach to VM
 - Create bootable disc with ubuntu 20.04
 - Create flavor 1CPU 2 gb RAM, Disk 10gb per vm (basic hdd) 
 - fix the public ip address  for each VM
 - the output
 - an inventory.ini file for ansible, which describes the IP addresses of the created VMs 
 - Use terraform generated inventory file 
 - playbooks for deploying the application in docker-compose files

## Outcome
 - running  terraform apply the infrastructure and inventory.ini is generated
 - running ansible-playbook your-playbook.yml  the application is installed on the infrastructure automatically.
