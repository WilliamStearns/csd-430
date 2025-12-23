<%-- 
  William Stearns
  12/21/25
  CSD430 Project Part 4
  This page allows for continuous deletion of records using a JavaBean.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.List" %>
<jsp:useBean id="movieBean" class="com.stearns.csd430.MovieBean" scope="session" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Records - Part 4</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<div class="container">
    <h1>Delete Movie Records</h1>

    <%-- PROCESSING SECTION: Runs if a delete was requested --%>
    <% 
        String idToDelete = request.getParameter("id");
        if (idToDelete != null) {
            movieBean.deleteMovie(Integer.parseInt(idToDelete));
    %>
            <div class="desc-box" style="border-left-color: #c0392b; background-color: #fceae9;">
                <strong>Record Deleted:</strong> The movie with ID <%= idToDelete %> has been removed.
            </div>
    <% 
        } 
    %>

    <%-- FORM SECTION: Dropdown of remaining keys --%>
    <div class="desc-box">
        <strong>Overall Data Description:</strong> Use the menu below to select a Primary Key. 
        Submitting will permanently remove the record and refresh the inventory table.
    </div>

    <form method="POST">
        <label>Select Key to Delete:</label>
        <select name="id">
            <% 
                List<Integer> ids = movieBean.getMovieIds();
                for (Integer id : ids) { 
            %>
                <option value="<%= id %>"><%= id %></option>
            <% } %>
        </select>
        <button type="submit" style="background-color: #c0392b; color: white;">Delete Record</button>
    </form>

    <hr>

    <%-- DISPLAY SECTION: Table showing remaining records --%>
    <h3>Remaining Movie Records</h3>
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
            <% 
                try {
                    ResultSet rs = movieBean.getAllMovies();
                    boolean hasData = false;
                    while (rs.next()) { 
                        hasData = true;
            %>
                    <tr>
                        <td><%= rs.getInt("movie_id") %></td>
                        <td><%= rs.getString("title") %></td>
                        <td><%= rs.getString("director") %></td>
                        <td><%= rs.getInt("release_year") %></td>
                        <td><%= rs.getString("genre") %></td>
                        <td><%= rs.getDouble("rating") %></td>
                    </tr>
            <% 
                    }
                    if (!hasData) {
            %>
                    <tr>
                        <td colspan="6" style="text-align:center;">The table is currently empty.</td>
                    </tr>
            <%
                    }
                    rs.getStatement().getConnection().close();
                } catch (Exception e) {
                    out.print("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
                }
            %>
        </tbody>
    </table>

    <p><small><em>Record Description: All remaining fields are displayed. If no records remain, the table structure persists.</em></small></p>

    <div class="button-group">
        <a href="index.jsp" class="nav-link">Return to Home</a>
    </div>
</div>
</body>
</html>