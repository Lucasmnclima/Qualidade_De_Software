# Projeto de Testes: Módulo de Autenticação e Usuários 🚀

Este repositório centraliza toda a documentação e especificação dos testes para o fluxo de vida de um usuário dentro do sistema, desde seu cadastro inicial até o gerenciamento avançado de sua conta e permissões.

O objetivo é fornecer uma visão clara e unificada da estratégia de qualidade para este módulo crítico, servindo como uma fonte de verdade para QAs, desenvolvedores e gerentes de produto.

-----

## 🎯 Funcionalidades Cobertas

Este projeto abrange o ciclo de vida completo do usuário, detalhado nas seguintes funcionalidades:

  * **Cadastro de Usuário:** Criação de novas contas.
  * **Login de Usuário:** Autenticação e acesso ao sistema.
  * **Recuperação de Senha:** Fluxo de redefinição de senhas esquecidas.
  * **Gerenciamento de Perfil:** Edição de dados pessoais e alteração de senha.
  * **Controle de Acesso:** Validação de permissões baseada em papéis de usuário.

-----

## 📂 Estrutura do Projeto

A estratégia de testes está dividida em dois tipos de artefatos principais:

1.  **Planos de Teste (Planilhas):** Documentação formal e detalhada de cada cenário, incluindo passos, dados de teste e resultados esperados. São a base para a execução de testes manuais e para o planejamento da automação.
2.  **Cenários BDD (`.feature`):** Especificações executáveis escritas em Gherkin. Estes arquivos servem como documentação viva e são a base para a suíte de testes automatizados, garantindo que o software se comporte exatamente como o esperado.

### Planos de Teste Detalhados

| Plano de Teste | Prefixo ID | Descrição Resumida |
| :--- | :--- | :--- |
| Cadastro de Usuário | `CT-XXX` | Valida a criação de novos usuários, cobrindo regras de negócio e validações de campo. |
| Login de Usuário | `LGT-XXX` | Garante a autenticação segura, incluindo tratamento de erros e casos de borda. |
| Recuperação de Senha | `RSN-XXX` | Cobre o fluxo de redefinição de senha, focando na segurança e usabilidade do processo. |
| Gerenciamento de Perfil | `GPC-XXX` | Testa a edição de dados pessoais, alteração de senha e gerenciamento da conta. |
| Controle de Acesso | `CAP-XXX` | Valida as regras de permissão para diferentes papéis de usuário (Visitante, Comum, Admin). |

\<br\>

### Arquivos de Especificação BDD (`.feature`)

| Arquivo Feature | Funcionalidade Coberta | Plano de Teste Associado |
| :--- | :--- | :--- |
| `cadastro_usuario.feature` | Cadastro de Usuários | Cadastro de Usuário |
| `login_de_usuario.feature` | Login de Usuário | Login de Usuário |
| `recuperacao_senha.feature` | Recuperação de Senha | Recuperação de Senha |
| `gerenciamento_perfil_conta_usuario.feature`| Gerenciamento de Perfil/Conta | Gerenciamento de Perfil/Conta |
| `controle_acesso_permissoes.feature` | Controle de Acesso e Permissões | Controle de Acesso e Permissões |

-----

## 🛠️ Tecnologias Utilizadas
  * **Linguagem de Especificação:** Gherkin

🎯 Objetivos do Projeto
Centralizar a Documentação: Unificar todos os planos de teste e cenários de comportamento em um único local.

Fonte Única da Verdade (SSoT): Servir como referência para QAs, Desenvolvedores e Gerentes de Produto sobre como as funcionalidades devem se comportar.

Facilitar a Colaboração: Promover o desenvolvimento guiado por comportamento (BDD), permitindo que todos validem as regras de negócio antes da implementação.

Base para Automação: Criar uma fundação sólida e bem estruturada para a futura implementação de testes automatizados.

🗺️ Escopo dos Testes
✅ Em Escopo
Testes Funcionais e de Regra de Negócio: Validação de todos os fluxos descritos nas funcionalidades abaixo.

Testes de Validação de Campos: Verificação de entradas válidas e inválidas nos formulários.

Testes de Segurança de Acesso: Cenários de controle de permissão baseados em papéis de usuário.

Especificação em BDD: Escrita de cenários em Gherkin para documentação e futura automação.

❌ Fora do Escopo (Neste Momento)
Testes de Performance, Carga e Estresse.

Testes de Usabilidade (UX/UI).

Testes de Segurança aprofundados (Pentest).

Testes de Compatibilidade entre múltiplos navegadores e sistemas operacionais.

🧭 Como Utilizar Este Repositório
Este repositório é uma ferramenta de colaboração e planejamento. Veja como cada perfil pode tirar o máximo proveito dele:

Para Quality Analysts (QAs)
Use os Planos de Teste como roteiro para a execução de testes manuais regressivos e funcionais.

Valide se os arquivos .feature cobrem todos os critérios de aceite das novas funcionalidades.

Utilize este material como base para estimar o esforço de automação.

Para Desenvolvedores(as)
Leia os arquivos .feature antes de começar a codificar para entender claramente os critérios de aceite. O Gherkin descreve o comportamento esperado do código que você vai escrever.

Use os cenários para guiar a criação de seus próprios testes unitários e de integração.

Para Gerentes de Produto e Stakeholders
Os arquivos .feature são escritos em linguagem natural e podem ser usados para validar se as regras de negócio implementadas correspondem às necessidades do produto.

Utilize a documentação como uma visão clara e transparente da qualidade e da cobertura dos testes planejados para o módulo.