# Inventário TI

Projeto desenvolvido para a atividade prática de Java Web utilizando Servlets, JSP, JPA e Bootstrap.

O sistema permite cadastrar laboratórios e equipamentos, mantendo cada equipamento relacionado a um laboratório.

## Funcionalidades

- Cadastro de laboratórios
- Listagem dos laboratórios cadastrados
- Cadastro de equipamentos
- Listagem dos equipamentos
- Associação de um equipamento a um laboratório

## Tecnologias

- Java
- Servlets
- JSP / JSTL
- JPA / Hibernate
- Banco H2
- Bootstrap 5
- Maven
- Tomcat

## Estrutura do projeto

O projeto segue um fluxo simples:

JSP → Servlet → DAO / JPA → Banco de dados

- **JSP:** páginas e formulários
- **Servlet:** recebe e controla as requisições
- **DAO:** realiza o acesso aos dados
- **JPA / Hibernate:** realiza a persistência no banco

## Como executar

1. Baixar a pasta "inventory-it-executavel
2. Abra o projeto em uma IDE Java.
3. Configure o Tomcat.
4. Execute o projeto no servidor.
5. Acesse a aplicação pelo navegador.

Os dados são armazenados utilizando o banco H2 configurado no projeto.
