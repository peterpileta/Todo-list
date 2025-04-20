package org.example.module6;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import java.util.List;


public class TodoDAO {
    private static EntityManagerFactory factory = Persistence.createEntityManagerFactory("todo-unit");

    public List<ToDoItem> getToDoItems() {
        EntityManager em = factory.createEntityManager();
        List<ToDoItem> list = em.createQuery("SELECT t FROM ToDoItem t", ToDoItem.class).getResultList();
        em.close();
        return list;
    }

    public List<ToDoItem> searchToDoItems(String keyword) {
        EntityManager em = factory.createEntityManager();
        String query = "SELECT t FROM ToDoItem t WHERE t.task = :kw";
        List<ToDoItem> list = em.createQuery(query, ToDoItem.class).setParameter("kw", keyword.toLowerCase()).getResultList();
        return list;
    }

    public void addToDoItem(ToDoItem item) {
        EntityManager em = factory.createEntityManager();
        em.getTransaction().begin();
        em.persist(item);
        em.getTransaction().commit();
        em.close();
    }

    public void deleteToDoItem(int id) {
        EntityManager em = factory.createEntityManager();
        try {
            em.getTransaction().begin();

            // Find the ToDoItem by ID
            ToDoItem item = em.find(ToDoItem.class, id);
            if (item != null) {
                em.remove(item); // Delete the entity
                System.out.println("ToDoItem with ID " + id + " was deleted.");
            } else {
                System.out.println("ToDoItem with ID " + id + " not found.");
            }

            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    public void close() {
        factory.close();
    }
}
