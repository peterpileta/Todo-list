<%@ page import="org.example.module6.TodoDAO, org.example.module6.ToDoItem" %>
<%
    String task = request.getParameter("task");
    if (task != null && !task.trim().isEmpty()) {
        TodoDAO dao = new TodoDAO();
        ToDoItem newItem = new ToDoItem();
        newItem.setTask(task);
        dao.addToDoItem(newItem);
    }
    response.sendRedirect("showToDoList.jsp");
%>