<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Laboratórios</title>
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
        <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3 mb-4">
            <div>
                <h1 class="h3 mb-1">Laboratórios</h1>
                <p class="text-muted mb-0">Cadastre e consulte os espaços disponíveis para alocação dos equipamentos.</p>
            </div>
            <div>
                <a href="${pageContext.request.contextPath}/equipamentos" class="btn btn-secondary">Ver equipamentos</a>
                <a href="${pageContext.request.contextPath}/lista-laboratorios.jsp" class="btn btn-outline-primary">Listar laboratórios</a>
            </div>
        </div>

        <div class="card border-0 bg-light mb-5">
            <div class="card-body">
                <h2 class="h5 card-title">Novo laboratório</h2>
                <p class="card-text text-muted">Preencha os campos para identificar onde os equipamentos poderão ser alocados.</p>

                <form action="${pageContext.request.contextPath}/laboratorios" method="post" class="row g-3">
                    <div class="col-md-8">
                        <label for="nome" class="form-label">Nome do laboratório</label>
                        <input type="text" id="nome" name="nome" class="form-control"
                               placeholder="Ex.: Laboratório de Informática 1" required>
                        <div class="form-text">Informe um nome curto que facilite a identificação do local.</div>
                    </div>
                    <div class="col-md-4">
                        <label for="bloco" class="form-label">Bloco</label>
                        <select id="bloco" name="bloco" class="form-select" required>
                            <option value="" selected disabled>Selecione o bloco</option>
                            <option value="A">Bloco A</option>
                            <option value="B">Bloco B</option>
                            <option value="C">Bloco C</option>
                            <option value="D">Bloco D</option>
                            <option value="E">Bloco E</option>
                            <option value="F">Bloco F</option>
                            <option value="G">Bloco G</option>
                            <option value="H">Bloco H</option>

                        </select>
                        <div class="form-text">Escolha o bloco onde o laboratório está localizado.</div>
                    </div>
                    <div class="col-12">
                        <button type="submit" class="btn btn-primary">Cadastrar laboratório</button>
                    </div>
                </form>
            </div>
        </div>

        <h2 class="h5 mb-3">Laboratórios cadastrados</h2>
        <div class="table-responsive">
            <table class="table table-striped table-hover align-middle">
                <thead class="table-light"><tr><th>ID</th><th>Nome</th><th>Bloco</th></tr></thead>
                <tbody>
                    <c:forEach var="lab" items="${laboratorios}">
                        <tr><td>${lab.id}</td><td>${lab.nome}</td><td><span class="badge bg-primary">Bloco ${lab.bloco}</span></td></tr>
                    </c:forEach>
                    <c:if test="${empty laboratorios}">
                        <tr><td colspan="3" class="text-center text-muted">Nenhum laboratório cadastrado.</td></tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</main>
</body>
</html>
