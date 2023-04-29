# Пул Облачной платформы
variable "region" {
  default = "ru-3"
}

# Значение SSH-ключа для доступа к облачному серверу
variable "public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDRiteltHlMtUgxERchkcGf92lbKx8BOmgtmtd+4ILQ30KswtXv1G7M7Lf4E2ydyBVNqIZNH5HJAIhwbBnttinXg7X/yscNYpuV/llmonLOnu4vF/hz+iqnb/LuPh7svVntzFqL3fNWfdH8aoom2E9Rpp2+snxppgxeE1vS9r3HdeyTwvcDjO1+p8d88O8Yd9HxrGtDgHRpIFtohTLZN1UZJ1i0UXDvdDiBcL/DoF9Q0yK5XPgevWXcCf5ThtWpL4EydoaWuLmd+s82OjA1fb4s0NxfsDF27aOsl6RTjCqKOPTc61BOtPXhuxZbO66ffaB0owxJcYTHP9m92B5zxceRH1OJTQBw4DJ5ofyOq12OLNnbNgrFFxNVYBTjdxguaS9EG7jA5AUvlZqCJHpkgrg0PzJDhohzspa936n26/tfOzK3IvQYmK509bgxCYu7kv3t0J/d0h1sYhFhJT5gT/cgkOPriKYj3KPOCTqHfIu11wslSoAGi4VK2KebZtKhjs0= alekseev.aa@selectel.ru"
}

# Сегмент пула
variable "az_zone" {
  default = "ru-3a"
}

# Тип сетевого диска, из которого создается сервер
variable "volume_type" {
  default = "basic.ru-3a"
}

# CIDR подсети
variable "subnet_cidr" {
  default = "10.10.0.0/24"
}