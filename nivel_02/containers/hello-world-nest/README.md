# Comandos
- Imagem
  - Gerar imagem
    ```bash
    docker build -t api-rocket .
    ```
  - Listar imagens
    ```bash
    docker image ls api-rocket
    ```
  - Visualizar histórico dos comandos da imagem
    ```bash
    docker image history api-rocket
    ```
  - Rodar imagem
    ```bash
    docker run --rm -p 3000:3000 -d api-rocket
    docker run -p 3001:3000 -d api-rocket
    ```
    - Parâmetros
      - "--rm" remove a imagem após a finalização da execução
      - "-d" detached, libera o terminal
- Container
  - Listar containers
    ```bash
    docker ps
    docker container ls
    ```
  - Parar container
    ```bash
    docker stop {container id}
    ```
  - Visualizar logs
    ```bash
    docker logs {container id}
    ```