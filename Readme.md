# Estudos de Devops

## Comandos
### Imagem
  - Gerar imagem
    ```bash
    docker build -t api-rocket:v2 .
    ```
  - Listar imagens
    ```bash
    docker image ls api-rocket:v2
    ```
  - Visualizar histórico dos comandos da imagem
    ```bash
    docker image history api-rocket:v2
    ```
### Container
  - Criar container
    ```bash
    docker run --rm -p 3000:3000 -d api-rocket:v2
    docker run -p 3000:3000 --name novo-container -d api-rocket:v2
    ```
    Parâmetros
      - "--rm" remove a imagem após a finalização da execução
      - "-d" detached, libera o terminal
      - "--name" atribui um nome

    Observação: parâmetros com traço duplo têm que vir antes do traço simples para terem efeito.
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
Conceito: uma rede pode ter vários containers.
  - Listar redes
    ```bash
    docker network ls
    ```
    Observação: o default de um container é a rede "bridge"
  - Criar rede
    ```bash
    docker network create primeira-rede
    docker network create --driver bridge primeira-rede-bridge
    ```
  - Associar uma rede a um container existente
    ```bash
    docker network connect primeira-rede novo-container
    ```
    Observações:
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
    docker run --rm --network=primeira-rede --name novo-container -p 3000:3000 -d api-rocket:v2
    ```
    Observação: diferentemente de quando o container é criado e somente depois uma rede é associada, neste caso, como o container foi criado com uma rede especificada, ele só terá essa rede.

### Arquivo
  - Executar o bash dentro do container (WORKDIR)
    ```bash
    docker exec -it novo-container bash
    ```
  - Criar arquivo
    ```bash
    touch src/file.log
    ```
  - Sair do bash
    ```bash
    exit
    ```

### Volume
Conceito: por padrão um container é efêmero. Mas quando há uma necessidade especial de se guardar algo dentro do container, surge a utilização dos volumes.

  - Criar volume
    ```bash
    docker volume create primeiro-volume
    ```
  - Inspecionar volume
    ```bash
    docker volume inspect primeiro-volume
    ```
  - Associar volume a um container existente
    ```bash
    docker run --rm --network=primeira-rede --name novo-container -v primeiro-volume:/usr/src/app -p 3000:3000 -d api-rocket:v2
    ```
    Observações:
      - É importante que o volume esteja apontando para o WORKDIR, que neste caso é "/usr/src/app"
      - Após associado ao container, o comando "inspect" não mostra diferenças. Para ver realmente se o volume está associado ao container, temos que inspecionar o container e verificar se a propriedade "Mounts" está preenchida.
        ```bash
        docker container inspect novo-container
        ```
      - Se a gente rodar o comando de "docker run" sem passar o volume, numa segunda execução, esse volume não aparecerá dentro do container, mas ele continuará a existir.