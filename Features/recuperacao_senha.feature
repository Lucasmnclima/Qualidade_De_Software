# language: pt

Funcionalidade: Recuperação de Senha
  Para garantir que eu possa reaver o acesso à minha conta caso esqueça minhas credenciais,
  Como um usuário cadastrado,
  Eu quero poder solicitar a redefinição da minha senha de forma segura.

  @recuperacao @critico
  Cenário: Fluxo completo de recuperação de senha bem-sucedido
    Dado que eu sou um usuário cadastrado com o e-mail "bruno.costa@email.com"
    E eu estou na página de login
    Quando eu clico no link "Esqueceu a senha?"
    E eu informo o e-mail "bruno.costa@email.com" e solicito a recuperação
    Então eu devo receber um e-mail com um link para redefinir a senha
    Quando eu clico no link de redefinição recebido
    E defino a nova senha como "NovaSenha#2025"
    E confirmo a nova senha como "NovaSenha#2025"
    E clico em "Salvar Nova Senha"
    Então eu devo ser redirecionado para a página de login com a mensagem "Senha alterada com sucesso!"
    E eu consigo fazer login com a nova senha "NovaSenha#2025"

  @recuperacao @seguranca
  Cenário: Solicitação de recuperação para um e-mail não cadastrado
    Dado que eu estou na página de solicitação de recuperação de senha
    Quando eu informo o e-mail "fantasma@email.com" que não está cadastrado
    E clico em "Enviar"
    Então eu devo ver uma mensagem genérica de sucesso, como "Se o e-mail estiver cadastrado, você receberá um link."
    E nenhum e-mail deve ser enviado

  @recuperacao @erros
  Cenário: Tentativa de redefinir senha com um link expirado
    Dado que eu solicitei um link de recuperação para o e-mail "ana.lima@email.com"
    E o link de recuperação expirou
    Quando eu tento acessar o link de recuperação expirado
    Então eu devo ver uma página de erro com a mensagem "Link inválido ou expirado."
    E devo ter a opção de solicitar um novo link

  @recuperacao @erros
  Cenário: Tentativa de usar o mesmo link de recuperação duas vezes
    Dado que eu já utilizei um link de recuperação para redefinir minha senha com sucesso
    Quando eu tento acessar o mesmo link de recuperação novamente
    Então eu devo ver uma página de erro com a mensagem "Link inválido ou expirado."

  @recuperacao @erros @validacao
  Esquema do Cenário: Tentativa de definir uma nova senha que não atende aos requisitos de segurança
    Dado que eu acessei um link de recuperação de senha válido
    Quando eu tento definir a nova senha como "<senha_invalida>"
    E clico em "Salvar Nova Senha"
    Então eu devo ver a mensagem de erro "<mensagem_erro>"
    E minha senha não deve ser alterada

    Exemplos:
      | senha_invalida       | mensagem_erro                                             |
      | "123"                | "A senha deve ter no mínimo 8 caracteres."                |
      | "senhasemnumero"     | "A senha deve conter pelo menos um número."               |
      | "SENHASENMINUSCULA1" | "A senha deve conter pelo menos uma letra minúscula."     |