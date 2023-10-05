*** Settings ***
Resource    ../resources/server-rest-front.resource


*** Test Cases ***
Login com sucesso Serve Rest Front
    Abrir o navegador
    Ir para o site Serve Rest Front
    Preencher os dados do novo usuário e cadastrar
    Conferir usuário cadastrado com sucesso

Desafio-01: Conferir se novo usuário é mostrado na listagem de usuário
    Abrir o navegador
    Ir para o site Serve Rest Front
    Preencher os dados do novo usuário e cadastrar
    Conferir usuário cadastrado com sucesso
    Conferir se novo usuário é mostrado na listagem de usuário

Desafio-02: Cadastrar um novo produto e consulta-lo
    Abrir o navegador
    Ir para o site Serve Rest Front
    Preencher os dados do novo usuário e cadastrar
    Conferir usuário cadastrado com sucesso
    Acessar a tela de cadastro de novo produto
    Cadastrar novo produto
    # Acessar a tela de listagem de produto
    Listar o produto para confirmar seu cadastro