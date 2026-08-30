package br.com.inventory.servlet;

import java.io.IOException;

import br.com.inventory.dao.LaboratorioDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/listar-laboratorios")
public class ListarLaboratoriosServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final LaboratorioDAO dao = new LaboratorioDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("laboratorios", dao.listarTodos());
        request.getRequestDispatcher("/lista-laboratorios.jsp").forward(request, response);
    }
}
