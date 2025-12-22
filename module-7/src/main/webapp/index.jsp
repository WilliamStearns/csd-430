<%-- 
  William Stearns
  12/20/25
  CSD430 Project 
  Home page for the project.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title> Movie Database Home </title>
    <%-- Link to the external stylesheet --%>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

<div class="container">
    <h1>Home</h1>
    
    <div class="desc-box">
        <strong>Project Description:</strong> This application manages a database of movies 
        using a JavaServer Pages (JSP) frontend and a MySQL backend via JavaBeans. 
        Each module below represents a different phase of the CRUD lifecycle.
    </div>

    <p>Please select a module to interact with the database:</p>

    <ul>
        <li>
            <a href="movie_lookup.jsp">Modules 5 & 6: Search Movies (READ)</a>
        </li>
        <li>
            <a href="movie_add.jsp">Module 7: Add New Movie (CREATE)</a>
        </li>
        <li>
            <strong>Module 8: Edit Movie Details (UPDATE)</strong> - <em>Coming Soon</em>
        </li>
        <li>
            <strong>Module 9: Remove Movie (DELETE)</strong> - <em>Coming Soon</em>
        </li>
    </ul>

    <hr>
    
    <div style="margin-top: 20px; font-size: 0.9em; color: #666;">
        <p>William Stearns<br>
        12/20/2025<br>
        CSD430 - Server-Side Development</p>
    </div>
</div>

</body>
</html>