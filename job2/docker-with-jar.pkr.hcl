packer {
  required_plugins {
    docker = {
      version = ">= 1.0.1"
      source = "github.com/hashicorp/docker"
    }
  }
}
packer {
  required_plugins {
    ansible = {
      version = "~> 1"
      source = "github.com/hashicorp/ansible"
    }
  }
}


source "docker" "ubuntu" {
  image  = "ubuntu:20.04"
  commit = true
  changes = [
    "EXPOSE 8085",
    "ENTRYPOINT [\"java\", \"-jar\", \"/helloworld.war\"]"
  ]
}

variable "username" {
  type = string
  default = "escreva-aqui-seu-username"
}

variable "password" {
  type = string
  default = "escreva-aqui-seu-password"
}

build {
  name = "job2"
  sources = [
    "source.docker.ubuntu"
  ]

  provisioner "shell" {
    inline = [
      "apt-get update",
      "apt-get install ansible -y",

    ]
  }

  provisioner "file" {
    source      = "./build/libs/helloworld.war"
    destination = "/helloworld.war"
  }

  provisioner "ansible-local" {
    playbook_file = "./job2/playbook.yml"
  }

  post-processors {
    post-processor "docker-tag" {
      repository =  "fq1444/tema-final-01"
      tags = ["0.1"]
    }
    post-processor "docker-push" {
      login = true
      login_username = var.username
      login_password = var.password
    }
  }
}