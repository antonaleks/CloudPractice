As a final application, I choose a container with todo and a database from the docker tutorial 
- create n=2 virtual machines, one for todo app, the other for mysql DB 

## Terraform
 - openstack provider
![1- provider](https://github.com/souhair/CloudPractice/assets/25878224/bffa9a29-e33c-4737-959a-e671840d9521)

 - servers
 ![servers](https://github.com/souhair/CloudPractice/assets/25878224/7e05e1ea-50ad-40eb-a45a-cfe7ad09e0a2)

![server2](https://github.com/souhair/CloudPractice/assets/25878224/43600f4f-9025-4cba-b2d7-ef194e7a15af)

 - networks
![2 networks](https://github.com/souhair/CloudPractice/assets/25878224/7e01da12-0e6d-4307-ba14-46dc05ab7bca)

![network](https://github.com/souhair/CloudPractice/assets/25878224/1edc7afd-3c38-48f8-a2d9-ff610556d6c6)

 - subnets
![3 subnets](https://github.com/souhair/CloudPractice/assets/25878224/3db75688-f0ea-49b8-b66b-9696dad61f67)

 - Create roures
![22 create route](https://github.com/souhair/CloudPractice/assets/25878224/ffbb4ad1-818f-4495-8f36-bbc0eefcb629)
![22 route](https://github.com/souhair/CloudPractice/assets/25878224/3f006d8b-bc33-4773-b6d8-14ff75bc546b)
 - Create public ssh key and attach to VM
 ![4 ssh](https://github.com/souhair/CloudPractice/assets/25878224/4ffc9328-e18b-4194-9e11-f6d51e6650df)

 - Create bootable disc with ubuntu 20.04
 ![server1](https://github.com/souhair/CloudPractice/assets/25878224/0fce00a7-9388-403a-95b6-2d9ae0d1530a)

 ![server2](https://github.com/souhair/CloudPractice/assets/25878224/7d71b3d2-8837-4c3c-a11c-99e840808dc1)

 - Create flavor 1CPU 1 gb RAM, Disk 5gb per vm (basic hdd) 

![server1-1](https://github.com/souhair/CloudPractice/assets/25878224/f6c2bb87-04b0-43f2-814f-940d679dfcfe)

![server1](https://github.com/souhair/CloudPractice/assets/25878224/659d4f84-7893-46fa-9c95-a6db21909646)

 - fix the public ip address for each VM
![public ip ](https://github.com/souhair/CloudPractice/assets/25878224/5b743dd2-5f99-4f5c-a2c9-349fa9d66771)


 - the output
![8 output](https://github.com/souhair/CloudPractice/assets/25878224/8cf9a28c-6300-4481-b99d-1c80b191f6de)
after running terraform apply: 
![terraform apply output 1](https://github.com/souhair/CloudPractice/assets/25878224/ed37d6b5-8266-4380-aaee-6d7667364bf5)

for webapp VM:

![vm 1ssh 1](https://github.com/souhair/CloudPractice/assets/25878224/e5390c56-5a05-457c-a2c1-45ba334d02ad)

![ip a 1](https://github.com/souhair/CloudPractice/assets/25878224/514306e9-7381-4070-8c00-cf40db35cc20)
for DB VM:

![vm 2ssh 2](https://github.com/souhair/CloudPractice/assets/25878224/883fa548-3cc3-4c35-a4b2-d6bd4ecb421a)

![ip a 2](https://github.com/souhair/CloudPractice/assets/25878224/b8d62aee-c488-4468-8a72-26fcfcb0d71a)

 - an inventory.ini file for ansible, which describes the IP addresses of the created VMs 
![9 inventory file](https://github.com/souhair/CloudPractice/assets/25878224/2732cfd4-6c37-4fe8-bad9-ce7f586ac882)
![91 inventory file](https://github.com/souhair/CloudPractice/assets/25878224/938fa7b3-9743-412a-9ffd-59d985a9c1b0)

 - Use terraform generated inventory file 
![terraform init](https://github.com/souhair/CloudPractice/assets/25878224/24d35d6f-459c-446f-a7ee-ce76ce5b7c7b)
![terraform plan1](https://github.com/souhair/CloudPractice/assets/25878224/72ae7f59-c9df-47f6-9de0-1ec4acb7498c)
![terraform plan2](https://github.com/souhair/CloudPractice/assets/25878224/c3021b23-0c67-46bf-8455-b45af83a74ee)

 - playbooks for deploying the application in docker-compose files
![11 playbook](https://github.com/souhair/CloudPractice/assets/25878224/55924047-9b60-4be2-9cfa-906bbf31a39f)
![playbook](https://github.com/souhair/CloudPractice/assets/25878224/7a4ec214-6902-409a-a561-0f55ab8c8531)

![playbook 1](https://github.com/souhair/CloudPractice/assets/25878224/907ef6e3-2248-470a-90e6-ba3e52641a07)
![playbook 2](https://github.com/souhair/CloudPractice/assets/25878224/14ec8d30-d24e-42bf-ab48-60e57228cd71)

## Outcome
 - running  terraform apply the infrastructure and inventory.ini is generated
![terraform apply](https://github.com/souhair/CloudPractice/assets/25878224/6acc5ac3-14a7-4c2b-9b23-5885cc77b825)
![terraform apply output 1](https://github.com/souhair/CloudPractice/assets/25878224/fee2fc31-c838-4d25-a803-61389486c33c)

 - running ansible-playbook your-playbook.yml  the application is installed on the infrastructure automatically.
![to do ](https://github.com/souhair/CloudPractice/assets/25878224/65569a8b-dc71-4c76-8cd2-eb7f590ea52e)
