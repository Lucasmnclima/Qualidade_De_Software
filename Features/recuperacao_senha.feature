# language: pt

@recuperacao
Funcionalidade: Recuperação de Senha
  Para garantir que eu possa reaver o acesso à minha conta caso esqueça minhas credenciais,
  Como um usuário cadastrado,
  Eu quero poder solicitar a redefinição da minha senha de forma segura.

  Contexto:
    Dado que eu estou na página de login

  @critico
  Cenário: Solicitação de recuperação de senha para e-mail válido
    Dado que eu sou um usuário cadastrado com o e-mail "bruno.costa@email.com"
    Quando eu solicito a recuperação de senha para este e-mail
    Então eu devo ver uma mensagem de confirmação e receber um e-mail com o link para redefinir a senha

  @critico
  Cenário: Redefinição de senha com link válido
    Dado que eu possuo um link válido para redefinição de senha
    Quando eu acesso o link e defino a nova senha como "NovaSenha#2025"
    Então eu devo ser redirecionado para a página de login com a mensagem "Senha alterada com sucesso!"

  @critico
  Cenário: Login com a nova senha após redefinição
    Dado que minha senha foi redefinida com sucesso para "NovaSenha#2025"
    Quando eu tento efetuar login com o e-mail "bruno.costa@email.com" e a nova senha
    Então o login deve ser realizado com sucesso

  @seguranca
  Cenário: Solicitação de recuperação para um e-mail não cadastrado
    Quando eu solicito a recuperação de senha para o e-mail não cadastrado "fantasma@email.com"
    Então eu devo ver uma mensagem genérica de segurança e nenhum e-mail deve ser enviado

  @erros
  Cenário: Tentativa de redefinir senha com um link expirado
    Dado que eu possuo um link de recuperação de senha que já expirou
    Quando eu tento acessar este link de recuperação
    Então eu devo ver uma página de erro informando que o link é inválido ou expirado

  @erros
  Cenário: Tentativa de usar o mesmo link de recuperação duas vezes
    Dado que eu já utilizei um link de recuperação para redefinir minha senha
    Quando eu tento acessar o mesmo link de recuperação novamente
    Então eu devo ver uma página de erro informando que o link é inválido ou expirado

  @erros @validacao
  Esquema do Cenário: Tentativa de definir uma nova senha que não atende aos requisitos
    Dado que eu acessei um link de recuperação de senha válido
    Quando eu tento definir a nova senha como "<senha_invalida>"
    Então eu devo ver a mensagem de erro "<mensagem_erro>" e minha senha não deve ser alterada

    Exemplos:
      | senha_invalida       | mensagem_erro                                          |
      | "123"                | "A senha deve ter no mínimo 8 caracteres."             |
      | "senhasemnumero"     | "A senha deve conter pelo menos um número."            |
      | "SENHASENMINUSCULA1" | "A senha deve conter pelo menos uma letra minúscula."  |
      | "senha sem @"        | "A senha deve conter pelo menos um caractere especial."| # Adicionado para robustez