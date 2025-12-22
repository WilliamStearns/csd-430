<%-- 
  William Stearns
  12/21/25
  CSD430 Project Part 3
  Update selection form using JavaBean.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.List" %>
<jsp:useBean id="movieBean" class="com.stearns.csd430.MovieBean" scope="session" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Record - Part 3</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<div class="container">
    <h1>Update Movie Record</h1>

    <%-- Dropdown for selecting Key Value --%>
    <form method="GET">
        <label>Select Movie ID (Key):</label>
        <select name="id">
            <% 
                List<Integer> ids = movieBean.getMovieIds();
                for (Integer id : ids) { 
            %>
                <option value="<%= id %>" <%= (request.getParameter("id") != null && Integer.parseInt(request.getParameter("id")) == id) ? "selected" : "" %>><%= id %></option>
            <% } %>
        </select>
        <button type="submit">Load Data</button>
    </form>

    <% 
        String selectedId = request.getParameter("id");
        if (selectedId != null) {
            ResultSet rs = movieBean.getMovieById(Integer.parseInt(selectedId));
            if (rs.next()) {
    %>
                <hr>
                <%-- Return JSP for editing --%>
                <form method="POST" action="movie_updated.jsp">
                    <label>Movie ID (Non-Updateable Key):</label>
                    <input type="text" name="id" value="<%= rs.getInt("movie_id") %>" readonly class="readonly-field">

                    <label>Title:</label>
                    <input type="text" name="title" value="<%= rs.getString("title") %>" required>

                    <label>Director:</label>
                    <input type="text" name="director" value="<%= rs.getString("director") %>" required>

                    <label>Year:</label>
                    <input type="number" name="year" value="<%= rs.getInt("release_year") %>" required>

                    <label>Genre:</label>
                    <input type="text" name="genre" value="<%= rs.getString("genre") %>" required>

                    <label>Rating:</label>
                    <input type="number" step="0.1" name="rating" value="<%= rs.getDouble("rating") %>" required>

                    <div class="button-group">
                        <button type="submit">Submit Update</button>
                    </div>
                </form>
    <% 
            }
            rs.getStatement().getConnection().close();
        } 
    %>
</div>
</body>
</html>