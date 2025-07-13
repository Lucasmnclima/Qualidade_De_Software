# language: pt

Funcionalidade: Gerenciamento de Perfil e Conta de Usuário
  Para manter minhas informações atualizadas e seguras,
  Como um usuário logado no sistema,
  Eu quero poder visualizar, editar meus dados pessoais, alterar minha senha e gerenciar minha conta.

Contexto: Usuário Autenticado
  Dado que eu sou um usuário logado com o e-mail "helena.gomes@email.com" e senha "SenhaAntiga@123"
  E eu navego para a página de "Gerenciamento de Conta"

@perfil
Cenário: Editar informações pessoais com sucesso
  Quando eu altero meu nome para "Helena Gomes de Almeida"
  E clico no botão "Salvar Alterações"
  Então eu devo ver a mensagem de sucesso "Dados atualizados com sucesso!"
  E meu novo nome "Helena Gomes de Almeida" deve ser exibido no meu perfil

@perfil @erros
Cenário: Tentativa de salvar perfil com dados de telefone inválidos
  Quando eu tento alterar o campo "Telefone" para o valor inválido "ABCDE"
  E clico no botão "Salvar Alterações"
  Então eu devo ver a mensagem de erro "Formato de telefone inválido"
  E minhas informações de telefone não devem ser alteradas

@perfil @seguranca
Cenário: Alterar a senha com sucesso
  Quando eu acesso a seção de "Alteração de Senha"
  E preencho o campo "Senha Atual" com "SenhaAntiga@123"
  E preencho a "Nova Senha" com "SenhaNova#456"
  E preencho a "Confirmação da Nova Senha" com "SenhaNova#456"
  E clico em "Alterar Senha"
  Então eu devo ver a mensagem "Senha alterada com sucesso!"
  Quando eu faço logout
  E tento fazer login com o e-mail "helena.gomes@email.com" e a nova senha "SenhaNova#456"
  Então o login deve ser bem-sucedido

@perfil @seguranca @erros
Cenário: Tentativa de alterar a senha informando a senha atual incorreta
  Quando eu acesso a seção de "Alteração de Senha"
  E preencho o campo "Senha Atual" com "senha-totalmente-errada"
  E preencho a "Nova Senha" com "QualquerSenhaNova"
  E clico em "Alterar Senha"
  Então eu devo ver a mensagem de erro "A senha atual está incorreta."

@perfil @upload
Esquema do Cenário: Validar upload de foto de perfil com diferentes arquivos
  Quando eu tento fazer o upload do arquivo "<nome_arquivo>" para a foto de perfil
  Então o sistema deve exibir a "<mensagem>" correspondente

  Exemplos:
    | nome_arquivo        | mensagem                               |
    | "foto_valida.jpg"   | "Foto de perfil atualizada com sucesso." |
    | "documento.pdf"     | "Formato de arquivo não suportado."    |
    | "imagem_grande.png" | "O arquivo excede o tamanho máximo."   |

@conta @critico @destrutivo
Cenário: Excluir a própria conta permanentemente
  Quando eu acesso a seção "Excluir Conta"
  E clico no botão "Excluir minha conta"
  E confirmo minha intenção na janela de aviso
  E informo minha senha "SenhaAntiga@123" para verificação final
  E clico no botão "Excluir Permanentemente"
  Então eu devo ser deslogado automaticamente do sistema
  E ao tentar fazer login com "helena.gomes@email.com", o acesso deve ser negado