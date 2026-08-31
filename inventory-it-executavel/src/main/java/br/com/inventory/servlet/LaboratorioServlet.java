package br.com.inventory.servlet;

import java.io.IOException;
import br.com.inventory.dao.LaboratorioDAO;
import br.com.inventory.modelo.Laboratorio;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/laboratorios")
public class LaboratorioServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final LaboratorioDAO dao = new LaboratorioDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("laboratorios", dao.listarTodos());
        request.getRequestDispatcher("/laboratorios.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        Laboratorio laboratorio = new Laboratorio();
        laboratorio.setNome(request.getParameter("nome"));
        laboratorio.setBloco(request.getParameter("bloco"));
        dao.salvar(laboratorio);
        response.sendRedirect(request.getContextPath() + "/laboratorios");
    }
}
