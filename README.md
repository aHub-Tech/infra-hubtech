<h1 align="center">
    HubTech Infra
</h1>
<details>
  <summary>🇺🇸 English version</summary>

  <p align="center"> Infrastructure - HubTech </p>

  <p align="center">
  <a href="#objective">Objective</a> •
  <a href="#technologies">Technologies</a> •
  <a href="#structure">Config structure</a> •
  <a href="#applying">Applying config</a> •
  <a href="#author">Author</a> •
  </p>

  <h4 align="center">
    🎨 Project alias
  </h4>

  <h2 id="objective" > 🎯 Objectives </h2>

  Use the IaC (Infrastructure as code) approach to manage and provision all HubTech infrastructure in a easy way using the best practices.

  <h2 id="technologies"> 🛠 Technologies </h2>

  The tools used in the construction of the project were:

  - [Terraform](https://www.terraform.io/)
  - [YAML](https://www.redhat.com/en/topics/automation/what-is-yaml)

  <h3 id="structure" > 👷 Config structure: </h3>

  Directory structure:
  ```shell
    ├── environments
    │   ├── dev # ambiente de desenvolvimento
    │   └── prod # ambiente de produção
    └── terraform # src do terraform
        └── modules # estrutura de módulos
            ├── compute # Agrupamento por tipo de recurso
            │   └── vm # O próprio recurso.
            ├── context # Modulo para leitura dos YAMLs dado o workspace escolhido.
            ├── networking
            └── rg
  ```
  <br>
  For each environment `environments/(dev|prod)`, you will have a group of YAMLs with input variables for terraform modules.
  <br>

  ```sh
  ./environments
    ├── dev
    │   ├── compute.yaml
    │   ├── default-env-config.yaml
    │   └── networking.yaml
    └── prod
        ├── compute.yaml
        ├── default-env-config.yaml
        └── networking.yaml
  ```
  <h3 id="applying" > 🔨 Applying infra: </h3>

  - You have to be authenticated via [Azure-CLI](https://docs.microsoft.com/pt-br/cli/azure/install-azure-cli) and have the needed permissions to create/delete azure resources on that subscription.
  - You have to use terraform version >= 1.1.4 [here](https://learn.hashicorp.com/tutorials/terraform/install-cli)

  - Select the workspace environment to deploy resources

  ```bash
  terraform workspace set <dev|prod>
  terraform plan|apply
  ```

  <h2 id="author"> 💻 Author </h2>

  By HubTech ❤

</details>

<details open>
  <summary>🇧🇷 Versão em português</summary>

  <p align="center"> Informações do Projeto - Hub Tech </p>

  <p align="center">
  <a href="#objetivos">Objetivos</a> •
  <a href="#tecnologia">Tecnologias</a> •
  <a href="#structure">Estrutura de configuração</a> •
  <a href="#applying">Aplicando a infra</a> •
  <a href="#autor">Autor</a> •
  </p>

  <h4 align="center">
    🎨 Pseudônimo do projeto
  </h4>

  <h2 id="objetivos" > 🎯 Objetivos </h2>

  Uma breve descrição sobre o projeto e como ele funciona

  <h2 id="tecnologia"> 🛠 Tecnologias </h2>

  As ferramentas utilizadas na construção do projeto foram:

  - [Terraform](https://www.terraform.io/)
  - [YAML](https://www.redhat.com/en/topics/automation/what-is-yaml)

  <h3 id="structure" > 👷 Estrutura de configuração: </h3>

  Segue a estrutura de diretorios:
  ```shell
    ├── environments
    │   ├── dev # ambiente de desenvolvimento
    │   └── prod # ambiente de produção
    └── terraform # src do terraform
        └── modules # estrutura de módulos
            ├── compute # Agrupamento por tipo de recurso
            │   └── vm # O próprio recurso.
            ├── context # Modulo para leitura dos YAMLs dado o workspace escolhido.
            ├── networking
            └── rg
  ```
  <br>
  Para cada ambiente dentro de `environments/(dev|prod)`, você terá um conjunto de configurações que serão valores de inputs para dentro dos modulos do terraform.
  <br>

  Cada YAML vai ser adicionado por agrupamento pelo tipo de recurso necessario para o environment.

  ```sh
  ./environments
    ├── dev
    │   ├── compute.yaml
    │   ├── default-env-config.yaml
    │   └── networking.yaml
    └── prod
        ├── compute.yaml
        ├── default-env-config.yaml
        └── networking.yaml
  ```
  <h3 id="applying" > 🔨 Aplicando a infra: </h3>

  - Você precisa estar autenticado usando o [Azure-CLI](https://docs.microsoft.com/pt-br/cli/azure/install-azure-cli) e ter permissões necessárias para realizar o deploy
  - Você precisa ter o terraform >= 1.1.4 [here](https://learn.hashicorp.com/tutorials/terraform/install-cli)

  - Para subir recursos em um ambiente específico você precisará selecionar o workspace do ambiente e enfim rodar a execução do plano

  ```bash
  terraform workspace set <dev|prod>
  terraform plan|apply
  ```

  <h2 id="autor"> 💻 Autor </h2>

  By HubTech ❤
</details>
