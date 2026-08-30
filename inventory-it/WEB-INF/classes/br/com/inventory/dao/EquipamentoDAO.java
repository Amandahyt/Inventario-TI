package br.com.inventory.dao;

import java.util.List;
import br.com.inventory.modelo.Equipamento;
import jakarta.persistence.EntityManager;

public class EquipamentoDAO {
    public void salvar(Equipamento equipamento) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(equipamento);
            em.getTransaction().commit();
        } catch (RuntimeException erro) {
            if (em.getTransaction().isActive()) em.getTransaction().rollback();
            throw erro;
        } finally {
            em.close();
        }
    }

    public List<Equipamento> listarTodos() {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery("SELECT e FROM Equipamento e JOIN FETCH e.laboratorio ORDER BY e.tipo", Equipamento.class).getResultList();
        } finally {
            em.close();
        }
    }
}
