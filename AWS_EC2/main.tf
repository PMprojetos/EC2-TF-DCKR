module "ec2_instance" {
  source = "./ec2-module"
  ami                     = "ami-09040d770ffe2224f" #Your AMI here, note that AMI IDs differ between regions
  instance_type           = "t2.micro"
  key_name                = "desafio01"
  subnet_id               = "subnet-03ea63b26b87a74e2"
  vpc_security_group_ids  = ["sg-02c1efb95c3e6cab0"]
  tags = {
    name = "desafio01"
  }
  user_data = <<-EOF
    #!/bin/bash
    # Atualizar pacotes do sistema
    
    sudo apt-get update -y
    sudo apt-get upgrade -y

    # Instalar dependências
    sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release

    # Adicionar a chave GPG oficial do Docker
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

    # Configurar o repositório Docker
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # Atualizar a lista de pacotes novamente
    sudo apt-get update -y

    # Instalar Docker
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io

    # Adicionar usuário atual ao grupo docker
    sudo usermod -aG docker ubuntu

    # Reiniciar o Docker (certifique-se de que está em execução)
    sudo systemctl restart docker
    EOF
}