# Отчет

Задание - развернуть две виртуальные машины с помощью Terraform. С помощью Ansible на одной запустить докер образ приложения todo-list из туториала к докеру, на второй запустить базу данных для этого приложения.

## Использование

```bash
cd preemptible_server
terraform init
terraform apply
cd ../ansible
ansible-playbook playbook.yml
```

## Скриншоты
 - openstack provider

 ![alt text](assets/image.png)

 - servers
 ![alt text](assets/image-1.png)

![alt text](assets/image-2.png)

 - networks

![alt text](assets/image-4.png)

 ![alt text](assets/image-3.png)

 ![alt text](assets/image-5.png)

 - Задание ключа для доступа к ВМ

![alt text](assets/image-6.png)

 - Create flavor 1CPU 1 gb RAM, Disk 5gb per vm (basic hdd) 

![alt text](assets/image-7.png)

 - the output

 ![alt text](assets/image-9.png)

- `inventory.tmpl`

![alt text](assets/image-10.png)

after running terraform apply:

![alt text](assets/image-8.png)

 - an inventory.ini file for ansible, which describes the IP addresses of the created VMs 
 
 ![alt text](assets/image-11.png)

 - playbooks for deploying the application in docker-compose files
 
 ![alt text](assets/image-12.png)

![alt text](assets/image-13.png)

## Результат

При переходе по адресу `http://5.188.81.9/` мы попадаем на страницу с приложением todo-list

![alt text](assets/image-14.png)