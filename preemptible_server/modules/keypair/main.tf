# Создание SSH-ключа
resource "openstack_compute_keypair_v2" "key_tf" {
  name       = "new_key_tf"
  region     = var.region
  public_key = var.keypair_public_key
}