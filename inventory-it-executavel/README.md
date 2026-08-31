# Inventory IT

Aplicação web para cadastro de laboratórios e equipamentos de TI, desenvolvida com Java, Jakarta Servlets, JSP, Hibernate e banco H2.

## Requisitos

- JDK 17 ou superior
- Apache Maven 3.9 ou superior
- Apache Tomcat 10.1
- Eclipse IDE for Enterprise Java and Web Developers (opcional)

## Importar no Eclipse

1. Clone ou baixe este repositório.
2. No Eclipse, acesse **File > Import > Maven > Existing Maven Projects**.
3. Selecione a pasta que contém o arquivo `pom.xml`.
4. Clique com o botão direito no projeto e selecione **Maven > Update Project**.
5. Configure o Apache Tomcat 10.1 em **Window > Preferences > Server > Runtime Environments**.
6. Adicione o projeto ao servidor pela aba **Servers**.
7. Inicie o Tomcat e acesse `http://localhost:8080/inventory-it/`.

Use a porta configurada no Eclipse caso ela seja diferente de `8080`.

## Gerar o WAR

Execute:

```bash
mvn clean package
```

O arquivo será criado em `target/inventory-it.war`.

## Banco de dados

A aplicação utiliza H2 em memória. Os dados cadastrados são apagados quando a aplicação ou o Tomcat são encerrados.

