<%@ page import="org.example.module6.TodoDAO, org.example.module6.ToDoItem, java.util.List" %>
<%
    TodoDAO dao = new TodoDAO();
    List<ToDoItem> todoList = dao.getToDoItems();
%>
<!DOCTYPE html>
<html>
<head>
    <title>To-Do List</title>
</head>
<body>
<h1>To-Do List</h1>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Task</th>
        <th>Actions</th>
    </tr>
    <% for (ToDoItem item : todoList) { %>
    <tr>
        <td><%= item.getId() %></td>
        <td><%= item.getTask() %></td>
        <td>
            <form action="deleteToDo.jsp" method="post">
                <input type="hidden" name="id" value="<%= item.getId() %>">
                <button type="submit">Delete</button>
            </form>
        </td>
    </tr>
    <% } %>
</table>
<a href="index.jsp">Back to Home</a>
</body>
</html>
