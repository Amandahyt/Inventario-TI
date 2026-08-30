# Inventory-IT

Projeto desenvolvido para controlar a alocação de equipamentos de TI nos laboratórios de uma instituição.

O sistema permite cadastrar laboratórios e equipamentos. Durante o cadastro de um equipamento, é necessário selecionar o laboratório onde ele está localizado. Essa informação também aparece na tela de listagem, facilitando a consulta pela equipe de suporte.

## Funcionalidades

- Cadastro e listagem de laboratórios;
- Cadastro e listagem de equipamentos;
- Associação obrigatória entre equipamento e laboratório;
- Seleção dinâmica dos laboratórios cadastrados;
- Validação do número de série com até 8 dígitos;
- Padronização dos blocos entre A, B, C e D;
- Interface responsiva utilizando Bootstrap.

## Tecnologias utilizadas

- Java;
- Jakarta Servlets;
- JSP e JSTL;
- JPA e Hibernate;
- Banco de dados H2;
- Bootstrap 5;
- Apache Tomcat 10.

## Organização do projeto

O projeto foi dividido em algumas partes principais:

- `modelo`: contém as entidades `Laboratorio` e `Equipamento`;
- `dao`: contém as classes responsáveis pelo acesso ao banco;
- `servlet`: recebe as requisições das páginas e controla o fluxo do sistema;
- arquivos JSP: contêm os formulários e as tabelas apresentadas ao usuário.

O fluxo básico da aplicação é:

```text
JSP -> Servlet -> DAO -> JPA/Hibernate -> H2
```

## Como executar

Para executar o projeto é necessário ter o Java e o Apache Tomcat 10 instalados.

1. Coloque a pasta `inventory-it` dentro da pasta `webapps` do Tomcat;
2. Inicie o Tomcat pelo arquivo `startup.bat`;
3. Abra o navegador no endereço:

```text
http://localhost:8080/inventory-it/
```

No Windows, o Tomcat pode ser iniciado pelo PowerShell:

```powershell
cd C:\tomcat\apache-tomcat-10.1.57\bin
.\startup.bat
```

## Banco de dados

O projeto utiliza o H2 configurado em memória. Por esse motivo, os dados cadastrados são apagados quando o Tomcat é encerrado ou reiniciado.

Essa configuração foi utilizada para facilitar os testes e evitar a instalação de um banco de dados externo.

## Relacionamento entre as entidades

Cada equipamento deve pertencer a um laboratório. Esse relacionamento foi criado com `@ManyToOne`, pois um laboratório pode possuir vários equipamentos, mas cada equipamento possui apenas um laboratório atual.

Na tela de cadastro, os laboratórios são carregados do banco e exibidos em um campo de seleção. O ID selecionado é enviado ao Servlet, que busca o laboratório completo antes de salvar o equipamento.
