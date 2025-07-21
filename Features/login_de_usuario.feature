# language: pt

Funcionalidade: Autenticação de Usuário
  Para garantir a segurança e a personalização da experiência,
  Como um usuário do sistema,
  Eu quero poder me autenticar de forma segura para acessar minha conta.

  @login @critico
  Cenário: Login bem-sucedido com credenciais válidas
    Dado que eu sou um usuário cadastrado com o e-mail "joana.silva@email.com" e senha "Senha@Forte123"
    E que eu estou na página de login
    Quando eu preencho o campo de e-mail com "joana.silva@email.com"
    E preencho o campo de senha com "Senha@Forte123"
    E clico no botão "Entrar"
    Então eu devo ser redirecionado para a página de dashboard
    E ver uma mensagem de boas-vindas com meu nome

  @login @erros
  Esquema do Cenário: Tentativas de login com credenciais inválidas
    Dado que eu sou um usuário cadastrado com o e-mail "joana.silva@email.com"
    E que eu estou na página de login
    Quando eu tento fazer login com o e-mail "<email>" e a senha "<senha>"
    Então eu devo ver a mensagem de erro "<mensagem_erro>"
    E eu devo permanecer na página de login

    Exemplos:
      | caso                     | email                        | senha          | mensagem_erro                |
      | Senha incorreta          | "joana.silva@email.com"      | "senha-errada" | "E-mail ou senha inválidos." |
      | E-mail não cadastrado    | "usuario.fantasma@email.com" | "qualquercoisa"| "E-mail ou senha inválidos." |
      | Senha case-sensitive     | "joana.silva@email.com"      | "senha@forte123"| "E-mail ou senha inválidos." |

  @login @erros @validacao
  Esquema do Cenário: Tentativa de login com campos obrigatórios em branco
    Dado que eu estou na página de login
    Quando eu deixo o campo "<campo_vazio>" em branco e clico em "Entrar"
    Então eu devo ver uma mensagem de validação para o campo obrigatório

    Exemplos:
      | campo_vazio |
      | "e-mail"    |
      | "senha"     |

  @login @seguranca
  Cenário: Bloqueio de conta após múltiplas tentativas falhas de login
    Dado que eu sou um usuário cadastrado com o e-mail "carlos.souza@email.com"
    E que eu estou na página de login
    Quando tento fazer login 5 vezes com a senha incorreta "senha-errada"
    E devo ver a mensagem "Conta bloqueada por excesso de tentativas."
    E tento fazer login com a senha correta "Abc$4321"
    Então meu login deve falhar novamente devido ao bloqueio