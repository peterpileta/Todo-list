<%@ page import="org.example.module6.TodoDAO" %>
<%
    String idStr = request.getParameter("id");
    if (idStr != null) {
        int id = Integer.parseInt(idStr);
        TodoDAO dao = new TodoDAO();
        dao.deleteToDoItem(id);
    }
    response.sendRedirect("showToDoList.jsp");
%>

