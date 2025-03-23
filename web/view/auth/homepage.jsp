<%-- 
    Document   : homepage
    Created on : 23 Mar 2025, 22:17:23
    Author     : Lenovo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Homepage</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                text-align: center;
                margin: 0;
                padding: 0;
            }
            .container {
                max-width: 600px;
                margin: 50px auto;
                background: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .feature-list {
                list-style: none;
                padding: 0;
            }
            .feature-list li {
                background: #007bff;
                margin: 10px 0;
                padding: 15px;
                border-radius: 5px;
                transition: background 0.3s;
            }
            .feature-list li:hover {
                background: #0056b3;
            }
            .feature-list a {
                color: #fff;
                text-decoration: none;
                font-size: 18px;
                display: block;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Welcome to Homepage</h2>
            <ul class="feature-list">
                <c:forEach var="feature" items="${feature}">
                    <li>
                        <a href="<c:url value='${feature.url}' />">${feature.name}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </body>
</html>