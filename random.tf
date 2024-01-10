locals {
  time_string = "${timestamp()}"
}

resource "random_id" "server1" {
    keepers = {
        name = local.time_string
    }
    byte_length = 18
}
resource "random_id" "server2" {
    keepers = {
        name = local.time_string
    }
    byte_length = 18
    prefix = "server-"
}
resource "terraform_data" "nothing" {
  provisioner "local-exec" {
    command = "echo 'Hello world ${random_id.server1.id}!'"
  }
}