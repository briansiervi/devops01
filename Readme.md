# Estudos de Devops

## Comandos
### Imagem
  - Gerar imagem
    ```bash
    docker build -t api-rocket:v1 .
    ```
  - Listar imagens
    ```bash
    docker image ls api-rocket:v1
    ```
  - Visualizar histórico dos comandos da imagem
    ```bash
    docker image history api-rocket:v1
    ```
### Container
  - Criar container
    ```bash
    docker run --rm -p 3000:3000 -d api-rocket:v1
    docker run -p 3000:3000 --name novo-container -d api-rocket:v1
    ```
    - Parâmetros
      - "--rm" remove a imagem após a finalização da execução
      - "-d" detached, libera o terminal
      - "--name" atribui um nome
    - Observação
      - Parâmetros com traço duplo têm que vir antes do traço simples para terem efeito
  - Listar containers
    ```bash
    docker ps
    docker container ls
    ```
  - Parar container
    ```bash
    docker stop novo-container
    ```
  - Visualizar logs
    ```bash
    docker logs novo-container
    ```
  - Inspecionar container
    ```bash
    docker container inspect novo-container
    ```
### Rede
  - Conceito: uma rede pode ter vários containers
  - Listar redes
    ```bash
    docker network ls
    ```
    - Observação: o default de um container é a rede "bridge"
  - Criar rede
    ```bash
    docker network create primeira-rede
    docker network create --driver bridge primeira-rede-bridge
    ```
  - Associar uma rede a um container existente
    ```bash
      docker network connect primeira-rede novo-container
    ```
    - Observações
      - O primeiro e o segundo parâmetros podem ser o "NETWORK ID" e o "CONTAINER ID" respectivamente, ou então os seus respectivos nomes. Para verificá-los, é só executar os comandos abaixo:

        ```bash
          docker network ls
          docker ps
        ```
      - Quando um container é criado sem especificar uma rede, a bridge é criada juntamente com ele. Então ao associar uma nova rede, o container terá 2 redes associadas.

  - Verificar se uma rede está associada a um container
    ```bash
      docker network inspect primeira-rede
    ```
  - Criar container com a rede associada
    ```bash
      docker run --rm --network=primeira-rede --name novo-container -p 3000:3000 -d api-rocket:v1
    ```
    - Observação: diferentemente de quando o container é criado e somente depois uma rede é associada, neste caso, como o container foi criado com uma rede especificada, ele só terá essa rede.