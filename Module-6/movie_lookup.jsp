<%-- 
  William Stearns
  12/20/25
  CSD430 Module 6
  This page allows the user to lookup a record and displays it in a table.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<jsp:useBean id="movieBean" class="com.stearns.csd430.MovieBean" scope="session" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Stearns MovieDB - Lookup</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<div class="container">
    <h1>Movie Database Retrieval</h1>
    
    <div class="desc-box">
        This tool performs a READ operation to fetch specific movie data from the <strong>will_movies_data</strong> table.
    </div>

    <%-- Selection Form --%>
    <form method="POST">
        <label for="movieId">Select a Movie ID:</label>
        <select name="movieId" id="movieId">
            <% 
                List<Integer> idList = movieBean.getMovieIds();
                for (Integer id : idList) { 
            %>
                <option value="<%= id %>"><%= id %></option>
            <% 
                } 
            %>
        </select>
        <button type="submit">View Record</button>
    </form>

    <hr>

    <% 
        String selectedId = request.getParameter("movieId");
        if (selectedId != null) {
            try {
                int id = Integer.parseInt(selectedId);
                ResultSet rs = movieBean.getMovieById(id);
                
                if (rs.next()) {
    %>
                    <h3>Displaying Details for Movie ID: <%= id %></h3>
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Title</th>
                                <th>Director</th>
                                <th>Release Year</th>
                                <th>Genre</th>
                                <th>Rating</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><%= rs.getInt("movie_id") %></td>
                                <td><%= rs.getString("title") %></td>
                                <td><%= rs.getString("director") %></td>
                                <td><%= rs.getInt("release_year") %></td>
                                <td><%= rs.getString("genre") %></td>
                                <td><%= rs.getDouble("rating") %></td>
                            </tr>
                        </tbody>
                    </table>
                    <p style="margin-top:10px;"><em>Description: This record displays the specific metadata associated with the unique primary key selected.</em></p>
    <% 
                }
                rs.getStatement().getConnection().close();
            } catch (Exception e) {
    %>
                <p style="color:red;">Error retrieving record: <%= e.getMessage() %></p>
    <%
            }
        } 
    %>

    <%-- Navigation using the CSS class from the stylesheet --%>
    <a href="index.jsp" class="nav-link">Return to Home Menu</a>

</div>
</body>
</html>