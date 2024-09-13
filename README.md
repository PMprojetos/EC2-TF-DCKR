# Deploy AWS ECS com Terraform e GitLab Runner

Este repositório contém os arquivos necessários para configurar e executar pipelines usando o Terraform e o GitLab Runner em uma máquina virtual criada na AWS ECS.

## Passos para Utilização

### 1. Clonar o Repositório

Clone o repositório para a sua máquina local usando o seguinte comando:

```bash
git clone https://gitlab.com/avanti-bootcamp1/desafio02
cd Desafio02
2. Navegar até a Pasta AWS_ECS
Entre na pasta onde os arquivos Terraform estão localizados:

cd AWS_ECS
3. Executar os Comandos do Terraform
Inicialize o Terraform e aplique as configurações para criar a infraestrutura na AWS:

terraform init
terraform plan
terraform apply
4. Acessar a Máquina Virtual Recém-Criada
Após a criação da infraestrutura, obtenha o endereço IP da máquina virtual criada e acesse-a via SSH:

ssh -i <SEU_ARQUIVO_PEM> ec2-user@<ENDERECO_IP_DA_INSTANCIA>
5. Habilitar o GitLab Runner
Na máquina virtual, execute os comandos necessários para instalar e configurar o GitLab Runner:

# Baixe e instale o GitLab Runner
curl -L --output /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64
chmod +x /usr/local/bin/gitlab-runner

# Registre o GitLab Runner
gitlab-runner register

# Inicie o GitLab Runner
gitlab-runner start
Durante o processo de registro, você precisará fornecer a URL do GitLab e o token do projeto. Siga as instruções interativas para completar a configuração.

6. Executar a Pipeline
Com o GitLab Runner configurado, você pode iniciar a pipeline diretamente do GitLab. Certifique-se de que o arquivo .gitlab-ci.yml está corretamente configurado no repositório. Vá até o seu projeto no GitLab e inicie a pipeline:

Acesse o seu projeto no GitLab.
Vá para CI / CD > Pipelines.
Clique em Run pipeline.

Notas
Certifique-se de ter as permissões necessárias na AWS e no GitLab.
Verifique se as variáveis de ambiente necessárias estão configuradas corretamente tanto no Terraform quanto no GitLab Runner.
Para mais detalhes sobre a configuração do GitLab Runner, consulte a documentação oficial.
Contribuição
Se você encontrar problemas ou tiver sugestões, sinta-se à vontade para abrir uma issue ou enviar um pull request.