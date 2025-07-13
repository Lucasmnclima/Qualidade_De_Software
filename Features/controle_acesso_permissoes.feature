# language: pt

Funcionalidade: Controle de Acesso e Permissões por Papel de Usuário
  Para garantir a integridade e a segurança dos dados do sistema,
  Como o dono do sistema,
  Eu quero que cada usuário só possa visualizar e executar as ações permitidas para o seu papel (Visitante, Usuário Comum, Administrador).

@acesso @seguranca
Esquema do Cenário: Validar acesso a páginas com base no papel do usuário
  Dado que eu sou um usuário com o papel de "<papel>"
  Quando eu tento acessar a URL "<url_alvo>"
  Então eu devo ser direcionado para a página "<pagina_destino>" ou ver um erro apropriado

  Exemplos:
    | papel           | url_alvo                   | pagina_destino         | cenario_teste                               |
    | "Visitante"     | "/perfil"                  | "/login"               | "Visitante não pode ver perfil"             |
    | "Visitante"     | "/admin/dashboard"         | "/login"               | "Visitante não pode ver painel admin"       |
    | "Usuário Comum" | "/admin/dashboard"         | "/acesso-negado"       | "Usuário comum não pode ver painel admin"   |
    | "Usuário Comum" | "/login"                   | "/dashboard"           | "Usuário logado é redirecionado do login"   |
    | "Administrador" | "/admin/dashboard"         | "/admin/dashboard"     | "Admin pode ver painel admin"               |

@acesso @ui
Cenário: Validar visibilidade de elementos de menu para Usuário Comum
  Dado que eu faço login como um "Usuário Comum"
  Quando eu inspeciono o menu principal de navegação
  Então o link para o "Painel Administrativo" não deve estar visível

@acesso @seguranca @critico
Cenário: Tentativa de acesso a dados de outro usuário (Escalação de Privilégio Horizontal)
  Dado que eu sou o usuário "Usuário A" com id "123" e estou logado
  E existe outro usuário "Usuário B" com id "456"
  Quando eu tento acessar a URL de edição do perfil do outro usuário "/perfil/editar/456"
  Então eu devo ser redirecionado para a página de "Acesso Negado"
  E nenhuma informação do "Usuário B" deve ser exibida

@acesso @admin
Cenário: Administrador executa uma ação privilegiada com sucesso
  Dado que eu faço login como um "Administrador"
  E eu estou na página de "Gerenciamento de Usuários"
  Quando eu clico no botão "Desativar" para o usuário "helena.gomes@email.com"
  Então eu devo ver a mensagem "Usuário desativado com sucesso"
  E o status do usuário "helena.gomes@email.com" deve ser "Inativo" na lista