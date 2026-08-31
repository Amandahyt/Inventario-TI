<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Equipamentos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<nav class="navbar navbar-dark bg-primary shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-semibold" href="${pageContext.request.contextPath}/laboratorios">Inventário TI</a>
        <span class="navbar-text text-white-50">Controle de equipamentos</span>
    </div>
</nav>
<main class="container py-4">
    <div class="bg-white p-4 rounded shadow-sm">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1 class="h3 mb-0">Equipamentos</h1>
            <div>
                <a href="${pageContext.request.contextPath}/laboratorios" class="btn btn-secondary">Laboratórios</a>
                <a href="${pageContext.request.contextPath}/equipamentos?acao=novo" class="btn btn-primary">Novo equipamento</a>
            </div>
        </div>
        <div class="table-responsive">
            <table class="table table-striped table-hover align-middle">
                <thead class="table-light"><tr><th>ID</th><th>Número de série</th><th>Tipo</th><th>Localização</th></tr></thead>
                <tbody>
                    <c:forEach var="equipamento" items="${equipamentos}">
                        <tr>
                            <td>${equipamento.id}</td>
                            <td>${equipamento.numeroSerie}</td>
                            <td><span class="badge bg-secondary">${equipamento.tipo}</span></td>
                            <td>${equipamento.laboratorio.nome}</td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty equipamentos}">
                        <tr><td colspan="4" class="text-center text-muted">Nenhum equipamento cadastrado.</td></tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</main>
</body>
</html>
