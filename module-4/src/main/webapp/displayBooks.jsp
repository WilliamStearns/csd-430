<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.stearns.beans.Book, java.util.ArrayList" %>
<%-- 
    William Stearns
    December 20, 2025
    CSD430 Module 4
    Description: Using JavaBeans to display book records in a table.
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Module 4: JavaBean Data Display</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

    <h1>Library Catalog (JavaBean Implementation)</h1>
    <p>This page retrieves data stored in Java objects (JavaBeans) and renders them using a JSP table.</p>

    <% 
        // Create a list to hold our JavaBean records
        ArrayList<Book> bookList = new ArrayList<>();

        // Record 1
        Book b1 = new Book();
        b1.setTitle("The Great Gatsby"); b1.setAuthor("F. Scott Fitzgerald");
        b1.setGenre("Classic"); b1.setYearPublished(1925); b1.setIsbn("978-0743273565");
        bookList.add(b1);

        // Record 2
        Book b2 = new Book();
        b2.setTitle("The Hobbit"); b2.setAuthor("J.R.R. Tolkien");
        b2.setGenre("Fantasy"); b2.setYearPublished(1937); b2.setIsbn("978-0547928227");
        bookList.add(b2);

        // ... repeat for 5 records total ...
        Book b3 = new Book();
        b3.setTitle("1984"); b3.setAuthor("George Orwell");
        b3.setGenre("Dystopian"); b3.setYearPublished(1949); b3.setIsbn("978-0451524935");
        bookList.add(b3);

        Book b4 = new Book();
        b4.setTitle("Project Hail Mary"); b4.setAuthor("Andy Weir");
        b4.setGenre("Sci-Fi"); b4.setYearPublished(2021); b4.setIsbn("978-0593135204");
        bookList.add(b4);

        Book b5 = new Book();
        b5.setTitle("The Silent Patient"); b5.setAuthor("Alex Michaelides");
        b5.setGenre("Thriller"); b5.setYearPublished(2019); b5.setIsbn("978-1250301697");
        bookList.add(b5);
    %>

    <table>
        <thead>
            <tr>
                <th>Title</th>
                <th>Author</th>
                <th>Genre</th>
                <th>Year</th>
                <th>ISBN-13</th>
            </tr>
        </thead>
        <tbody>
            <% for(Book book : bookList) { %>
                <tr>
                    <td><%= book.getTitle() %></td>
                    <td><%= book.getAuthor() %></td>
                    <td><%= book.getGenre() %></td>
                    <td><%= book.getYearPublished() %></td>
                    <td><%= book.getIsbn() %></td>
                </tr>
            <% } %>
        </tbody>
    </table>

    <hr>
    <footer>William Stearns | CSD430 Module 4</footer>
</body>
</html>