<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 
    William Stearns | Date: December 19, 2025 | CSD430 Module 3
    Description: Input form for Restaurant Feedback.
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Restaurant Feedback Form</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <h1>DineRight Feedback Survey</h1>
    <p>Please share your experience with us. All fields are required.</p>

    <form action="displayFeedback.jsp" method="POST">
        <label>Customer Name:</label><br>
        <input type="text" name="customerName" required><br><br>

        <label>Meal Type:</label><br>
        <select name="mealType">
            <option value="Breakfast">Breakfast</option>
            <option value="Lunch">Lunch</option>
            <option value="Dinner">Dinner</option>
        </select><br><br>

        <label>Service Rating:</label><br>
        <input type="radio" name="serviceRating" value="Excellent" checked> Excellent
        <input type="radio" name="serviceRating" value="Good"> Good
        <input type="radio" name="serviceRating" value="Average"> Average
        <input type="radio" name="serviceRating" value="Poor"> Poor<br><br>

        <label>Email Address:</label><br>
        <input type="email" name="customerEmail" required><br><br>

        <label>Comments:</label><br>
        <textarea name="comments" rows="4" cols="40"></textarea><br><br>

        <input type="submit" value="Submit Feedback">
    </form>
</body>
</html>