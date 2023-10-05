*** Settings ***
Library    Browser
Library    FakerLibrary
Library    DateTime

*** Variables ***
${BROWSER}            chromium
${HEADLESS}           ${true}
${SITE_SERVE_REST}    https://front.serverest.dev/

*** Keywords ***
Abrir o navegador
    New Browser    browser=${BROWSER}
    ...            headless=${HEADLESS}
    
    ${TRACE_NAME}    FakerLibrary.Uuid 4
    ${NOW}         Get Current Date  result_format=%d-%m-%Y_%H%M%S
    New Context    viewport={'width': 1200, 'height': 800}
    ...            tracing=${OUTPUT_DIR}/evidencies/traces/${NOW}/${TRACE_NAME}.zip
    # ...            recordVideo={'dir':'${OUTPUT_DIR}/evidencies/videos/${NOW}'}
    


Ir para o site Serve Rest Front
    New Page    url=${SITE_SERVE_REST}
    ${title}    Get Title  ==  Front - ServeRest

Preencher os dados do novo usuário e cadastrar
    # Record Selector
    # Click     css=.btn-link
    # Click     text="Cadastre-se"
    Click       css=a[data-testid='cadastrar']
    ${EMAIL}    FakerLibrary.Email
    Set Test Variable    ${EMAIL}
    Fill Text   css=input[data-testid='nome']       Peterson de Lima
    Fill Text   css=input[data-testid='email']      ${EMAIL}
    Fill Text   css=input[data-testid='password']   123456
    Check Checkbox       css=input[data-testid='checkbox']
    Click       css=button[data-testid='cadastrar']

Conferir usuário cadastrado com sucesso
    # Wait For Elements State    h1    visible
    Get Text    h1  ==  Bem Vindo Peterson de Lima
    Get Element States    css=button[data-testid='logout']    validate  value & visible


Conferir se novo usuário é mostrado na listagem de usuário
    Click    css=a[data-testid='listarUsuarios']
    Click    css=table
    ${elemento}  Get Table Cell Element   css=table    "Nome"    "${EMAIL}"
    ${nome}      Get Text     ${elemento}  ==  Peterson de Lima
    Log    ${nome}

Acessar a tela de cadastro de novo produto
    Click    css=a[data-testid='cadastrarProdutos']

Cadastrar novo produto
    Fill Text   css=input[data-testid='nome']    Tv 32 polegadas Philco
    Fill Text   css=input[data-testid='preco']    899.00
    Fill Text   css=textarea[data-testid='descricao']    Smart TV LED 32" HD Philco PTV32G7PR2CSBLH Roku TV, Dolby Audio, Midia Cast, App Mobile, Processador Quad-core
    Fill Text   css=input[data-testid='quantity']    10
    Upload File By Selector    css=input[data-testid='imagem']    image/transferir.webp
    Click    css=button[data-testid='cadastarProdutos']

# Acessar a tela de listagem de produto
#     Click    css=a[data-testid='listarProdutos']

Listar o produto para confirmar seu cadastro
    Click    css=table
    ${elementoProduto}  Get Table Cell Element   css=table    "Nome"    "899"
    ${nomeProduto}      Get Text     ${elementoProduto}  ==  Tv 32 polegadas Philco
    Log    ${nomeProduto}