<%-- 
  William Stearns
  12/21/25
  CSD430 Module 7
  This page provides the input form to create a new movie record.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Movie</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<div class="container">
    <h1>Add New Movie Record</h1>
    
    <div class="desc-box">
        <strong>Create Operation:</strong> Use this form to add a new cinematic entry to the database. 
        All fields are required.
    </div>

    <%-- The action points directly to movie_added.jsp results page --%>
    <form method="POST" action="movie_added.jsp">
        <label for="title">Movie Title:</label>
        <input type="text" id="title" name="title" placeholder="e.g. Interstellar" required>
        
        <label for="director">Director:</label>
        <input type="text" id="director" name="director" placeholder="e.g. Christopher Nolan" required>
        
        <label for="year">Release Year:</label>
        <input type="number" id="year" name="year" min="1888" max="2030" placeholder="YYYY" required>
        
        <label for="genre">Genre:</label>
        <input type="text" id="genre" name="genre" placeholder="e.g. Sci-Fi" required>
        
        <label for="rating">Rating (0.0 - 10.0):</label>
        <input type="number" id="rating" name="rating" step="0.1" min="0" max="10" placeholder="8.5" required>
        
        <div class="button-group">
            <button type="submit">Save Movie Record</button>
            <a href="index.jsp" class="nav-link" style="background-color: #7f8c8d;">Cancel</a>
        </div>
    </form>
</div>
</body>
</html>