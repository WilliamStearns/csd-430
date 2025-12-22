<%-- 
  William Stearns
  12/21/25
  CSD430 Project Part 3 - Success Display
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="movieBean" class="com.stearns.csd430.MovieBean" scope="session" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Confirmed</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<div class="container">
    <h1>Updated Database Record</h1>

    <% 
        int updateId = Integer.parseInt(request.getParameter("id"));
        String t = request.getParameter("title");
        String d = request.getParameter("director");
        int y = Integer.parseInt(request.getParameter("year"));
        String g = request.getParameter("genre");
        double r = Double.parseDouble(request.getParameter("rating"));

        boolean success = movieBean.updateMovie(updateId, t, d, y, g, r);
        
        if (success) {
            ResultSet rs = movieBean.getAllMovies();
    %>
            <table>
                <thead>
                    <tr>
                        <th>ID (INT)</th>
                        <th>Title (VARCHAR)</th>
                        <th>Director (VARCHAR)</th>
                        <th>Year (INT)</th>
                        <th>Genre (VARCHAR)</th>
                        <th>Rating (DECIMAL)</th>
                    </tr>
                </thead>
                <tbody>
                <% while (rs.next()) { 
                    String rowStyle = (rs.getInt("movie_id") == updateId) ? "class='new-row'" : ""; 
                %>
                    <tr <%= rowStyle %>>
                        <td><%= rs.getInt("movie_id") %></td>
                        <td><%= rs.getString("title") %></td>
                        <td><%= rs.getString("director") %></td>
                        <td><%= rs.getInt("release_year") %></td>
                        <td><%= rs.getString("genre") %></td>
                        <td><%= rs.getDouble("rating") %></td>
                    </tr>
                <% } %>
                </tbody>
            </table>
    <% 
            rs.getStatement().getConnection().close(); 
        } 
    %>

    <div class="button-group">
        <a href="index.jsp" class="nav-link">Return to Home</a>
    </div>
</div>
</body>
</html>