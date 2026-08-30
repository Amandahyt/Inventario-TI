<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Novo laboratório</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<main class="container py-5">
    <div class="bg-white p-4 rounded shadow-sm">
        <h1 class="h3">Cadastrar laboratório</h1>
        <hr>

        <form action="${pageContext.request.contextPath}/laboratorios" method="post" class="row g-3">
            <div class="col-md-6">
                <label for="nome" class="form-label">Nome</label>
                <input type="text" id="nome" name="nome" class="form-control" required>
            </div>
            <div class="col-md-6">
                <label for="bloco" class="form-label">Bloco</label>
                <input type="text" id="bloco" name="bloco" class="form-control" required>
            </div>
            <div class="col-12">
                <button type="submit" class="btn btn-primary">Salvar</button>
                <a href="${pageContext.request.contextPath}/laboratorios" class="btn btn-secondary">Voltar</a>
            </div>
        </form>
    </div>
</main>
</body>
</html>
