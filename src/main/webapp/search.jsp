<%@ page import="org.example.module6.TodoDAO" %>
<%@ page import="org.example.module6.ToDoItem" %>
<%@ page import="java.util.*" %>
<%
    String query = request.getParameter("query");
    List<ToDoItem> results = new ArrayList<>();
    if (query != null && !query.isEmpty()) {
        TodoDAO dao = new TodoDAO();
        results = dao.searchToDoItems(query);
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Search Tasks</title>
</head>
<body>
<h2>Search To-Do Tasks</h2>
<form action="search.jsp" method="get">
    <input type="text" name="query" placeholder="Search task..." value="<%= (query != null) ? query : "" %>"/>
    <input type="submit" value="Search" />
</form>

<%
    if (!results.isEmpty()) {
%>
<ul>
    <%
        for (ToDoItem item : results) {
    %>
    <li><%= item.getTask() %></li>
    <%
        }
    %>
</ul>
<%
} else if (query != null) {
%>
<p>No results found.</p>
<%
    }
%>
</body>
</html>
