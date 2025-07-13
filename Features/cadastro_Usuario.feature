# language: pt

Funcionalidade: Cadastro de novos usuários
  Para poder acessar as funcionalidades exclusivas do sistema,
  Como um novo visitante,
  Eu quero poder me cadastrar criando uma nova conta de usuário.

  @cadastro @critico
  Cenário: Realizar cadastro com sucesso utilizando dados válidos
    Dado que eu estou na página de cadastro de usuário
    Quando eu preencho o campo "Nome" com "Maria da Silva"
    E preencho o campo "E-mail" com um e-mail válido e não utilizado
    E preencho o campo "Senha" com "SenhaForte@2025"
    E preencho o campo "Confirmar Senha" com "SenhaForte@2025"
    E clico no botão "Cadastrar"
    Então eu devo ser redirecionado para uma página de sucesso ou para a página de login
    E devo ver a mensagem "Cadastro realizado com sucesso!"

  @cadastro @erros @validacao
  Esquema do Cenário: Tentativa de cadastro com campos obrigatórios em branco
    Dado que eu estou na página de cadastro de usuário
    Quando eu deixo o campo "<campo_obrigatorio>" em branco
    E preencho os outros campos obrigatórios com dados válidos
    E clico no botão "Cadastrar"
    Então eu devo ver uma mensagem de erro indicando que o campo é obrigatório
    E devo permanecer na página de cadastro

    Exemplos:
      | campo_obrigatorio |
      | "Nome"            |
      | "E-mail"          |
      | "Senha"           |

  @cadastro @erros @validacao
  Esquema do Cenário: Tentativa de cadastro com dados inválidos ou inconsistentes
    Dado que eu estou na página de cadastro de usuário
    Quando eu preencho o campo "Nome" com "<nome>"
    E preencho o campo "E-mail" com "<email>"
    E preencho o campo "Senha" com "<senha>"
    E preencho o campo "Confirmar Senha" com "<confirmar_senha>"
    E clico no botão "Cadastrar"
    Então eu devo ver a mensagem de erro específica: "<mensagem_erro>"
    E não devo ser cadastrado no sistema

    Exemplos:
      | nome           | email                  | senha          | confirmar_senha  | mensagem_erro                    |
      | "João Santos"  | "joao.santos@teste.com"| "SenhaValida1" | "SenhaDiferente2"| "As senhas não conferem."        |
      | "Carla Lima"   | "carla.lima@dominio"   | "OutraSenha123"| "OutraSenha123"  | "O formato do e-mail é inválido."|
      | "Pedro Alves"  | joaocadastrado@email.com | "SenhaForte@321"| "SenhaForte@321"| "Este e-mail já está em uso."  |