<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.module6.ToDoItem" %>
<%@ page import="org.example.module6.TodoDAO" %>
<%
  TodoDAO dao = new TodoDAO();
  List<ToDoItem> todoList = dao.getToDoItems();
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>To-Do List App</title>
  <link rel="stylesheet" href="styles.css">
</head>
<body style="text-align: center">
<h1 style="font-family: cursive">To-Do List App by Peter Pileta</h1>

<form action="addToDo.jsp" method="post">
  <input type="text" name="task" placeholder="New Task" required>
  <button type="submit">Add Task</button>

  <form action="showToDoList.jsp">
    <button type="submit">Show To-Do List</button>
  </form>

  <form action="search.jsp" method="get">
    <input type="submit" value="Search Tasks" />
  </form>
</form>



<ul style="list-style-type: none">
  <% for (ToDoItem item : todoList) { %>
  <li style="margin-top: 5px; font-size: 24px">
    <span><%= item.getTask() %></span>
    <form action="deleteToDo.jsp" method="post" style="display:inline;">
      <input type="hidden" name="id" value="<%= item.getId() %>">
      <button type="submit">Delete</button>
    </form>
  </li>
  <% } %>
</ul>
</body>
</html>
