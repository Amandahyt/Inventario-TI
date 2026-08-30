<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Novo equipamento</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<nav class="navbar navbar-dark bg-primary shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-semibold" href="${pageContext.request.contextPath}/laboratorios">Inventory-IT</a>
        <span class="navbar-text text-white-50">Cadastro de equipamentos</span>
    </div>
</nav>
<main class="container py-4">
    <div class="bg-white p-4 rounded shadow-sm">
        <h1 class="h3">Cadastrar equipamento</h1>
        <hr>
        <form action="${pageContext.request.contextPath}/equipamentos" method="post" class="row g-3">
            <div class="col-md-6">
                <label for="numeroSerie" class="form-label">Número de série</label>
                <input type="text" id="numeroSerie" name="numeroSerie" class="form-control"
                       inputmode="numeric" maxlength="8" pattern="[0-9]{1,8}"
                       placeholder="Ex.: 00123456" title="Digite de 1 a 8 números" required>
                <div class="form-text">Digite somente números, com no máximo 8 dígitos.</div>
            </div>
            <div class="col-md-6">
                <label for="tipo" class="form-label">Tipo</label>
                <input type="text" id="tipo" name="tipo" class="form-control" placeholder="Ex.: computador ou projetor" required>
            </div>
            <div class="col-12">
                <label for="laboratorio_id" class="form-label">Localização</label>
                <select id="laboratorio_id" name="laboratorio_id" class="form-select" required>
                    <option value="">Selecione um laboratório</option>
                    <c:forEach var="lab" items="${laboratorios}">
                        <option value="${lab.id}">${lab.nome} - Bloco ${lab.bloco}</option>
                    </c:forEach>
                </select>
                <c:if test="${empty laboratorios}">
                    <div class="form-text text-danger">Cadastre um laboratório primeiro.</div>
                </c:if>
            </div>
            <div class="col-12">
                <button type="submit" class="btn btn-primary" ${empty laboratorios ? 'disabled' : ''}>Salvar</button>
                <a href="${pageContext.request.contextPath}/equipamentos" class="btn btn-secondary">Voltar</a>
            </div>
        </form>
    </div>
</main>
</body>
</html>
