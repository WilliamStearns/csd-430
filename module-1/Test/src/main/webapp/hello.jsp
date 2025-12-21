<!DOCTYPE html>
<%-- 
    William Stearns
    Date: December 19, 2025
    CSD430 Module 1
    This file verifies a successful Jakarta-Tomcat and Java installation.
--%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Module 1: JSP Environment Setup</title>
</head>
<body>
    <h1>JSP Configuration Success</h1>
    <p>This page demonstrates that Java and Tomcat are working correctly.</p>

    <% 
        // Java Code Block (Scriptlet)
        java.util.Date date = new java.util.Date();
        String serverInfo = application.getServerInfo();
    %>

    <ul>
        <li><strong>Current Server Time:</strong> <%= date %></li>
        <li><strong>Servlet Container:</strong> <%= serverInfo %></li>
    </ul>

    <p>William Stearns
    CSD-430
    </p>
</body>
</html>

