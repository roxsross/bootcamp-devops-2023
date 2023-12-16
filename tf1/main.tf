resource "local_file" "libros" {
  count    = 3
  filename = "devops-${random_string.libros_random[count.index].id}.txt"
  content  = "DevOps onfire"
}

resource "random_string" "libros_random" {
  count   = 3
  length  = 4
  special = false
  upper   = false
  numeric = false

}