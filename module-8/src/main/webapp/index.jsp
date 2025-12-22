<%-- 
  William Stearns
  12/21/25
  CSD430 Project Hub
  Central navigation for Movie Database CRUD operations.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Stearns MovieDB - Home</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<div class="container">
    <header>
        <h1>Movie Database Management System</h1>
        <p class="desc-box">
            This application demonstrates full CRUD capabilities using 
            JSP, JavaBeans, and a MySQL backend. Please select a module below to test.
        </p>
    </header>

    <main>
        <ul class="nav-menu">
            <%-- Module 6: READ --%>
            <li>
                <a href="movie_lookup.jsp" class="nav-link">Module 6: Search & View Record (READ)</a>
                <p><small>Search for a specific movie using a dropdown of primary keys.</small></p>
            </li>

            <%-- Module 7: CREATE --%>
            <li>
                <a href="movie_add.jsp" class="nav-link" style="background-color: #28a745;">Module 7: Add New Movie (CREATE)</a>
                <p><small>Add a new record and view the updated database table.</small></p>
            </li>

            <%-- Module 8: UPDATE --%>
            <li>
                <a href="movie_update.jsp" class="nav-link" style="background-color: #f39c12;">Module 8: Update Record (UPDATE)</a>
                <p><small>Select an existing record to modify its details.</small></p>
            </li>

            <%-- Module 9: DELETE (Placeholder for Part 4) --%>
            <li>
                <a href="movie_delete.jsp" class="nav-link" style="background-color: #c0392b;">Module 9: Delete Record (DELETE)</a>
                <p><small>Remove a record from the database permanently.</small></p>
            </li>
        </ul>
    </main>

    <footer>
        <hr>
        <p><em>Student: William Stearns | CSD430 Server-Side Development</em></p>
    </footer>
</div>
</body>
</html>