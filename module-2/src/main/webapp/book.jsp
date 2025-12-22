<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 
    William Stearns
    Date: December 19, 2025
    CSD430 Module 2
    Description: Dynamic JSP page using Scriptlets and an external CSS sheet 
                 to display a collection of favorite books.
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Favorite Books</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

    <h1>Favorite Reads Collection</h1>
    <p>This table displays a list of books that have made a significant impact, categorized by title, author, and genre.</p>

    <% 
        // Java Scriptlet: Defining the data records
        String[][] books = {
            {"The Great Gatsby", "F. Scott Fitzgerald", "Classic"},
            {"The Hobbit", "J.R.R. Tolkien", "Fantasy"},
            {"1984", "George Orwell", "Dystopian"},
            {"Project Hail Mary", "Andy Weir", "Sci-Fi"},
            {"The Silent Patient", "Alex Michaelides", "Thriller"}
        };
    %>

    <table>
        <thead>
            <tr>
                <th>Book Title</th>
                <th>Author Name</th>
                <th>Genre</th>
            </tr>
        </thead>
        <tbody>
            <% 
                // Java Scriptlet: Loop through the records
                for (int i = 0; i < books.length; i++) { 
            %>
                <tr>
                    <td><%= books[i][0] %></td>
                    <td><%= books[i][1] %></td>
                    <td><%= books[i][2] %></td>
                </tr>
            <% 
                } 
            %>
        </tbody>
    </table>

    <hr>
    <footer>
        <p>Prepared by: William Stearns</p>
        <p>Course: CSD-430 | Module 2 Assignment</p>
    </footer>

</body>
</html>