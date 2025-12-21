<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 
    William Stearns | Date: December 19, 2025 | CSD430 Module 3
    Description: Displays submitted form data in a table format.
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Feedback Results</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <h1>Feedback Summary</h1>
    <p>The following data was received from the submission form:</p>

    <% 
        // Java Scriptlet to capture form data
        String name = request.getParameter("customerName");
        String meal = request.getParameter("mealType");
        String rating = request.getParameter("serviceRating");
        String email = request.getParameter("customerEmail");
        String notes = request.getParameter("comments");
    %>

    <table>
        <tr>
            <th>Field Description</th>
            <th>Customer Record Data</th>
        </tr>
        <tr>
            <td><strong>Customer Name</strong></td>
            <td><%= (name != null) ? name : "N/A" %></td>
        </tr>
        <tr>
            <td><strong>Meal Category</strong></td>
            <td><%= (meal != null) ? meal : "N/A" %></td>
        </tr>
        <tr>
            <td><strong>Service Quality</strong></td>
            <td><%= (rating != null) ? rating : "N/A" %></td>
        </tr>
        <tr>
            <td><strong>Contact Email</strong></td>
            <td><%= (email != null) ? email : "N/A" %></td>
        </tr>
        <tr>
            <td><strong>Additional Comments</strong></td>
            <td><%= (notes != null && !notes.isEmpty()) ? notes : "No comments provided." %></td>
        </tr>
    </table>

    <br>
    <a href="feedbackForm.jsp">Back to Form</a>

    <hr>
    <footer>William Stearns | CSD430 Module 3</footer>
</body>
</html>