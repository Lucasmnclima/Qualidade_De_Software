# language: pt

Funcionalidade: Cadastro de novos usuários
  Para poder acessar as funcionalidades exclusivas do sistema,
  Como um novo visitante,
  Eu quero poder me cadastrar criando uma nova conta de usuário.

# language: pt

Funcionalidade: Criação de Conta de Usuário Detalhada em Múltiplas Etapas
  Para se tornar um membro, o usuário deve conseguir criar uma conta
  através de um fluxo de cadastro detalhado e dividido em passos,
  garantindo a coleta de todas as informações necessárias.

  @cadastro @critico @fluxo-principal
  Cenário: Realizar cadastro com sucesso aceitando uma sugestão de e-mail
    Dado que o usuário inicia o processo de criação de conta
    Quando ele preenche o campo "Nome" com "Ana"
    E preenche o campo opcional "Sobrenome" com "Souza"
    E clica no botão "Avançar"
    Então ele é direcionado para a etapa de informações básicas
    Quando ele preenche a "Data de Nascimento" com "15", "Maio" e "1992"
    And seleciona uma das opções em "Gênero"
      | Masculino            |
      | Feminino             |
      | Não Binário          |
      | Outro                |
      | Prefere não informar |
    And clica no botão "Avançar"

    Então ele é direcionado para a etapa de escolha de endereço de e-mail
    E o sistema exibe sugestões como "anasouza32" ou "souzaana88"
    Quando ele seleciona a primeira sugestão de e-mail da lista
    And clica no botão "Avançar"

    Então ele é direcionado para a etapa de criação de senha
    Quando ele preenche a "Senha" com "SenhaSuperForte$25"
    And confirma a senha com "SenhaSuperForte$25"
    And clica no botão "Avançar"

    Então sua conta deve ser criada com sucesso
    And ele deve ser redirecionado para a página de boas-vindas.

  @cadastro @critico @fluxo-alternativo
  Cenário: Realizar cadastro com sucesso criando um endereço de e-mail personalizado
    Dado que o usuário inicia o processo de criação de conta
    Quando ele preenche o campo "Nome" com "Carlos"
    And preenche o campo opcional "Sobrenome" com "Pereira"
    And clica no botão "Avançar"

    Então ele é direcionado para a etapa de informações básicas
    Quando ele preenche a "Data de Nascimento" com "20", "Agosto" e "1985"
    And seleciona a opção "Gênero" como "Masculino"
    And clica no botão "Avançar"
    
    Então ele é direcionado para a etapa de escolha de endereço de e-mail
    Quando ele seleciona a opção "Criar seu próprio endereço"
    And preenche o novo endereço com "carlos.pereira.dev2025"
    And clica no botão "Avançar"

    Então ele é direcionado para a etapa de criação de senha
    Quando ele preenche a "Senha" com "OutraSenhaForte#25"
    And confirma a senha com "OutraSenhaForte#25"
    And clica no botão "Avançar"

    Então sua conta deve ser criada com sucesso
    And ele deve ser redirecionado para a página de boas-vindas.

   Esquema do Cenário: Tentativa de avançar sem preencher campos obrigatórios na Etapa 1 (Nome)
    Dado que o usuário está na página inicial de criação de conta
    Quando ele deixa o campo "<campo_obrigatorio>" em branco
    And clica no botão "Avançar"
    Então ele deve ver uma mensagem de erro indicando que o campo é obrigatório
    And deve permanecer na etapa de preenchimento do nome.

    Exemplos:
      | campo_obrigatorio |
      | "Nome"            |

  @cadastro @erros @validacao-etapa2
  Esquema do Cenário: Tentativa de avançar sem preencher campos obrigatórios na Etapa 2 (Info Básica)
    Dado que o usuário completou com sucesso a etapa de preenchimento do nome
    And está na etapa de informações básicas
    Quando ele deixa a "<informacao_basica>" sem preencher
    And clica no botão "Avançar"
    Então ele deve ver a mensagem de erro apropriada para o campo ausente
    And deve permanecer na etapa de informações básicas.

    Exemplos:
      | informacao_basica       |
      | "Data de Nascimento"    |
      | "Gênero"                |

@cadastro @erros @validacao-etapa3
  Cenário: Tentativa de criar um endereço de e-mail com formato inválido
    Dado que o usuário completou as etapas de nome e informações básicas
    And está na etapa de escolha de e-mail
    Quando ele seleciona a opção "Criar seu próprio endereço"
    And preenche o novo endereço com "email.invalido-sem-arroba"
    And clica no botão "Avançar"
    Então ele deve ver a mensagem de erro "O formato do e-mail é inválido."
    And deve permanecer na etapa de escolha de e-mail.

  @cadastro @erros @validacao-etapa3
  Cenário: Tentativa de criar um endereço de e-mail que já está em uso
    Dado que o usuário completou as etapas de nome e informações básicas
    And o e-mail "usuario.existente@email.com" já está cadastrado no sistema
    And o usuário está na etapa de escolha de e-mail
    Quando ele seleciona a opção "Criar seu próprio endereço"
    And preenche o novo endereço com "usuario.existente"
    And clica no botão "Avançar"
    Então ele deve ver a mensagem de erro "Este nome de usuário já está em uso. Tente outro."
    And o campo para criação de e-mail deve ficar disponível para nova tentativa.

  @cadastro @erros @validacao-etapa4
  Cenário: Tentativa de cadastro com senhas que não conferem
    Dado que o usuário preencheu com sucesso as etapas de nome, informações básicas e e-mail
    And está na etapa de criação de senha
    Quando ele preenche o campo "Senha" com "SenhaValida123#"
    And preenche o campo "Confirmar Senha" com "SenhaDiferente456$"
    And clica no botão "Avançar"
    Então ele deve ver a mensagem de erro "As senhas não conferem."
    And deve permanecer na etapa de criação de senha.