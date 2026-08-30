package br.com.inventory.servlet;

import java.io.IOException;
import br.com.inventory.dao.EquipamentoDAO;
import br.com.inventory.dao.JPAUtil;
import br.com.inventory.dao.LaboratorioDAO;
import br.com.inventory.modelo.Equipamento;
import br.com.inventory.modelo.Laboratorio;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/equipamentos")
public class EquipamentoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final EquipamentoDAO equipamentoDAO = new EquipamentoDAO();
    private final LaboratorioDAO laboratorioDAO = new LaboratorioDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if ("novo".equals(request.getParameter("acao"))) {
            request.setAttribute("laboratorios", laboratorioDAO.listarTodos());
            request.getRequestDispatcher("/novo-equipamento.jsp").forward(request, response);
        } else {
            request.setAttribute("equipamentos", equipamentoDAO.listarTodos());
            request.getRequestDispatcher("/equipamentos.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String numeroSerie = request.getParameter("numeroSerie");

        if (numeroSerie == null || !numeroSerie.matches("[0-9]{1,8}")) {
            throw new ServletException("O número de série deve conter de 1 a 8 dígitos.");
        }

        EntityManager em = JPAUtil.getEntityManager();
        try {
            Long id = Long.valueOf(request.getParameter("laboratorio_id"));
            Laboratorio laboratorio = em.find(Laboratorio.class, id);
            if (laboratorio == null) throw new ServletException("Laboratório não encontrado.");

            Equipamento equipamento = new Equipamento();
            equipamento.setNumeroSerie(numeroSerie);
            equipamento.setTipo(request.getParameter("tipo"));
            equipamento.setLaboratorio(laboratorio);
            equipamentoDAO.salvar(equipamento);
        } catch (NumberFormatException erro) {
            throw new ServletException("Laboratório inválido.", erro);
        } finally {
            em.close();
        }
        response.sendRedirect(request.getContextPath() + "/equipamentos");
    }
}
