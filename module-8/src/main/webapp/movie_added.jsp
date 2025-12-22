<%-- 
  William Stearns
  12/21/25
  CSD430 Module 7
  This page displays all table data after a new record is added for verification.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="movieBean" class="com.stearns.csd430.MovieBean" scope="session" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Record Added</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<div class="container">
    <h1>Database Transaction Complete</h1>

    <% 
        int newlyAddedId = -1;
        String t = request.getParameter("title");
        
        // Processing the input from the form
        if (t != null) {
            try {
                String d = request.getParameter("director");
                int y = Integer.parseInt(request.getParameter("year"));
                String g = request.getParameter("genre");
                double r = Double.parseDouble(request.getParameter("rating"));
                
                // Call the bean to insert and return the new ID
                newlyAddedId = movieBean.addMovieAndGetId(t, d, y, g, r);
    %>
                <div class="desc-box" style="border-left-color: #28a745; background-color: #f0fff4;">
                    <strong>Success!</strong> The movie "<%= t %>" has been added. The new record is highlighted in green below.
                </div>
    <% 
            } catch (Exception e) {
                out.print("<div class='desc-box' style='border-left-color: red;'>Error processing input: " + e.getMessage() + "</div>");
            }
        } 
    %>

    <h3>Current Movie Inventory</h3>
    
    <%-- Overall Description for Rubric --%>
    <p><strong>Overall Data Description:</strong> This table displays the full collection of cinematic entries within the <em>will_movies_data</em> table. It serves as a visual verification that the CREATE operation was successful.</p>

    <table>
        <thead>
            <tr>
                <th>Movie ID</th>
                <th>Title</th>
                <th>Director</th>
                <th>Release Year</th>
                <th>Genre</th>
                <th>Rating</th>
            </tr>
        </thead>
        <tbody>
        <% 
            try {
                ResultSet rs = movieBean.getAllMovies();
                while (rs.next()) { 
                    int currentId = rs.getInt("movie_id");
                    // Apply highlight class if the ID matches the one just created
                    String rowStyle = (currentId == newlyAddedId) ? "class='new-row'" : "";
        %>
                    <tr <%= rowStyle %>>
                        <td><%= currentId %></td>
                        <td><%= rs.getString("title") %></td>
                        <td><%= rs.getString("director") %></td>
                        <td><%= rs.getInt("release_year") %></td>
                        <td><%= rs.getString("genre") %></td>
                        <td><%= rs.getDouble("rating") %></td>
                    </tr>
        <% 
                } 
                rs.getStatement().getConnection().close();
            } catch (Exception e) {
                out.print("<tr><td colspan='6'>Error loading data: " + e.getMessage() + "</td></tr>");
            }
        %>
        </tbody>
    </table>

    <div class="button-group">
        <a href="movie_add.jsp" class="nav-link" style="background-color: #3498db;">Add Another Movie</a>
        <a href="index.jsp" class="nav-link">Return to Home Menu</a>
    </div>
</div>
</body>
</html>