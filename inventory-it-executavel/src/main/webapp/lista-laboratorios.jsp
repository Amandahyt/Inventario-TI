<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<jsp:useBean id="laboratorioDAO" class="br.com.inventory.dao.LaboratorioDAO" />
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Lista de laboratórios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<nav class="navbar navbar-dark bg-primary shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-semibold" href="${pageContext.request.contextPath}/laboratorios">Inventário TI</a>
        <span class="navbar-text text-white-50">Consulta de laboratórios</span>
    </div>
</nav>
<main class="container py-4">
    <div class="bg-white p-4 rounded shadow-sm">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1 class="h3 mb-0">Lista de laboratórios</h1>
            <div>
                <a href="${pageContext.request.contextPath}/laboratorios" class="btn btn-secondary">Cadastro</a>
                <a href="${pageContext.request.contextPath}/equipamentos" class="btn btn-primary">Equipamentos</a>
            </div>
        </div>

        <div class="table-responsive">
            <table class="table table-striped table-hover align-middle">
                <thead class="table-light"><tr><th>ID</th><th>Nome</th><th>Bloco</th></tr></thead>
                <tbody>
                    <c:forEach var="lab" items="${laboratorioDAO.listarTodos()}">
                        <tr><td>${lab.id}</td><td>${lab.nome}</td><td><span class="badge bg-primary">Bloco ${lab.bloco}</span></td></tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</main>
</body>
</html>
