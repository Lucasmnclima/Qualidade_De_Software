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

  Esquema do Cenário: Validando informações de data de nascimento e gênero
    Dado que o usuário já preencheu o nome e sobrenome
    E está na etapa de informações básicas
    Quando ele preenche os campos "dia", "mês" e "ano"
    E seleciona a opção "Gemero" desejada
      | Masculino            |
      | Feminino             |
      | Não Binário          |
      | Outro                |
      | Prefere não informar |
    E clica em 'Avançar'
    Então ele é direcionado para a etapa de escolha de endereço de e-mail
     Exemplos:
      | dia | mês       | ano    |
      | 20  | Agosto    | 1990   |
      | 15  | Janeiro   | 1985   |
      | 30  | Dezembro  | 2000   |
      | 1   | Fevereiro | 1995   |
      | 31  | Julho     | 1992   |


  @cadastro @critico @fluxo-alternativo
  Cenário: Realizar cadastro com sucesso aceitando uma sugestão de e-mail
    Dado que o usuário inicia o processo de criação de conta
    E ele preenche as informações básicas corretamente
    E ele é direcionado para a etapa de escolha de endereço de e-mail
    E o sistema exibe sugestões como "anasouza32" ou "souzaana88"
    Quando ele seleciona a primeira sugestão de e-mail da lista
    E clica no botão "Avançar"
    Então ele é direcionado para a etapa de criação de senha

  @cadastro @critico @fluxo-alternativo
  Cenário: Realizar cadastro com sucesso criando um endereço de e-mail personalizado
    Dado que o usuário inicia o processo de criação de conta
    E ele já preencheu as informações básicas corretamente
    E ele é direcionado para a etapa de escolha de endereço de e-mail
    Quando ele seleciona a opção "Criar seu próprio endereço"
    E preenche o novo endereço com "carlos.pereira.dev2025"
    E clica no botão "Avançar"
    Então ele é direcionado para a etapa de criação de senha

  @cadastro @critico @fluxo-principal
  Esquema do Cenário: Validar criação de senha com diferentes critérios
    Dado que o usuário está na etapa de criação de senha
    Quando ele preenche o campo "Senha" com "<senha>"
    E ele preenche a "Senha" com "SenhaSuperForte$25"
    E confirma a senha com "SenhaSuperForte$25"
    E clica no botão "Avançar"
    Então sua conta deve ser criada com sucesso
    E ele deve ser redirecionado para a página de boas-vindas.
    Exemplos:
      | senha                   |
      | "SenhaForte@123"       |
      | "SenhaSegura#456"      |
      | "SenhaComplexa$789!"   |
      | "SenhaRobusta&101112"  |
      | "SenhaIncrível*131415"  |

@cadastro @erros @validacao-etapa1
   Esquema do Cenário: Tentativa de avançar sem preencher campos obrigatórios na Etapa 1 (Nome)
    Dado que o usuário está na página inicial de criação de conta
    Quando ele deixa o campo "<campo_obrigatorio>" em branco
    E clica no botão "Avançar"
    Então ele deve ver uma mensagem de erro indicando que o campo é obrigatório
    E deve permanecer na etapa de preenchimento do nome.

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
    E está na etapa de escolha de e-mail
    Quando ele seleciona a opção "Criar seu próprio endereço"
    E preenche o novo endereço com "formato-invalido-email"
    E clica no botão "Avançar"
    Então ele deve ver a mensagem de erro "Seu nome de usuário precisa ter entre 6 e 30 caracteres."
    E deve permanecer na etapa de escolha de e-mail.

  @cadastro @erros @validacao-etapa3
  Cenário: Tentativa de criar um endereço de e-mail que já está em uso
    Dado que o usuário completou as etapas de nome e informações básicas
    E o e-mail "usuario.existente@email.com" já está cadastrado no sistema
    E o usuário está na etapa de escolha de e-mail
    Quando ele seleciona a opção "Criar seu próprio endereço"
    E preenche o novo endereço com "usuario.existente"
    E clica no botão "Avançar"
    Então ele deve ver a mensagem de erro "Este nome de usuário já está em uso. Tente outro."
    E o campo para criação de e-mail deve ficar disponível para nova tentativa.

  @cadastro @erros @validacao-etapa4
  Cenário: Tentativa de cadastro com senhas que não conferem
    Dado que o usuário preencheu com sucesso as etapas de nome, informações básicas e e-mail
    E está na etapa de criação de senha
    Quando ele preenche o campo "Senha" com "SenhaValida123#"
    E preenche o campo "Confirmar Senha" com "SenhaDiferente456$"
    E clica no botão "Avançar"
    Então ele deve ver a mensagem de erro "As senhas não são iguais. Tente novamente."
    E deve permanecer na etapa de criação de senha.

@cadastro @erros @validacao-etapa4
  Cenário: Tentativa de cadastro com senhas muito curtas
    Dado que o usuário preencheu com sucesso as etapas de nome, informações básicas e e-mail
    E está na etapa de criação de senha
    Quando ele preenche o campo "Senha" com "123"
    E preenche o campo "Confirmar Senha" com "123"
    E clica no botão "Avançar"
    Então ele deve ver a mensagem de erro "A senha deve ter no mínimo 8 caracteres."
    E deve permanecer na etapa de criação de senha.

@cadastro @erros @validacao-etapa4
  Cenario: Campo senha em branco
    Dado que o usuário preencheu com sucesso as etapas de nome, informações básicas e e-mail
    E está na etapa de criação de senha
    Quando ele deixa o campo "Senha" em branco
    E clica no botão "Avançar"
    Então ele deve ver a mensagem de erro "O campo Senha é obrigatório."
    E deve permanecer na etapa de criação de senha.