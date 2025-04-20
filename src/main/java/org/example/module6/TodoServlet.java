package org.example.module6;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class TodoServlet extends HttpServlet {
    private TodoDAO TodoDAO = new TodoDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("addToDo.jsp".equals(action)) {
            String task = request.getParameter("task");
            TodoDAO.addToDoItem(new ToDoItem(task));
        } else if ("deleteToDo.jsp".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            TodoDAO.deleteToDoItem(id);
        }
    }
}
