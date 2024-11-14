# Desafio Go

#### Click no link abaixo para acessar a imagem no Docker Hub:
* [Imagem fullcycle](https://hub.docker.com/r/werricsson/fullcycle)


#### Solução:
* CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -ldflags="-w -s" -o main .
     * Compila o código Go como um binário estático, ou seja, sem dependências externas, e compatível com Linux.
     * Uso da flag -ldflags "-w -s" para remover a tabela de símbolos e informações de depuração, o que ajuda a reduzir o tamanho do binário.
* Uso de multi-stage build usando a imagem scratch, uma imagem vazia que não contém nada além do binário que copiamos do Go.
* Uso da ferramenta upx para comprimir o binário, reduzindo ainda mais o tamanho da imagem
