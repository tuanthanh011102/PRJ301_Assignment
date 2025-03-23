<%-- 
    Document   : agenda
    Created on : 24 Mar 2025, 02:14:15
    Author     : Lenovo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
           /* Base styles */
body {
    font-family: 'Segoe UI', Roboto, Arial, sans-serif;
    background-color: #e9eef4;
    margin: 0;
    padding: 20px;
    box-sizing: border-box;
    min-height: 100vh;
}

/* Back link */
a {
    color: #007bff;
    text-decoration: none;
    font-weight: bold;
    font-size: 16px;
    display: block;
    margin-bottom: 20px;
}

/* Table container styling */
table {
    width: 100%;
    max-width: 1200px;
    margin: 0 auto;
    background-color: white;
    border-collapse: separate;
    border-spacing: 0;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    border: none;
}

/* Header styling */
thead {
    background-color: #0277bd;
    color: white;
}

th {
    padding: 12px 8px;
    text-align: center;
    font-weight: 600;
    font-size: 14px;
    border: none;
    white-space: nowrap;
}

th:first-child {
    text-align: left;
    padding-left: 20px;
    width: 150px;
}

/* Cell styling */
td {
    padding: 12px 8px;
    text-align: center;
    border: none;
    position: relative;
    font-size: 14px;
    border-bottom: 1px solid #f0f0f0;
}

td:first-child {
    text-align: left;
    padding-left: 20px;
    font-weight: 500;
    color: #333;
}

tr:last-child td {
    border-bottom: none;
}

/* Status cells */
td.absent, td.present {
    min-width: 40px;
}

/* Status styling - exactly matching your screenshot */
td.present {
    background-color: #d7f0db !important;
}

td.present::after {
    content: '✓';
    color: #43a047;
    font-weight: bold;
}

td.absent {
    background-color: #ffd9d9 !important;
}

td.absent::after {
    content: '✕';
    color: #e53935;
    font-weight: bold;
}

/* Alternating rows */
tbody tr:nth-child(odd) {
    background-color: #ffffff;
}

tbody tr:nth-child(even) {
    background-color: #f9f9f9;
}

/* Responsive adjustments */
@media screen and (max-width: 768px) {
    table {
        width: 100%;
    }
    
    th, td {
        padding: 8px 5px;
    }
}

@media screen and (max-width: 576px) {
    table {
        display: block;
        overflow-x: auto;
    }
}

        </style>

    </head>
    <body>
    <a onclick="history.back()">Back</a>
    <table>
        <thead>
            <tr>
                <th>Name</th>
                <c:forEach var="date" items="${dates}">
                    <th>${date}</th>
                </c:forEach>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="emp" items="${elist}">
                <tr>
                    <td>${emp.name}</td>
                    <c:forEach var="date" items="${dates}">
                        <c:set var="isOff" value="false"/>
                        <c:forEach var="ag" items="${agenda}">
                            <c:if test="${ag.e.id == emp.id}">
                                <c:forEach var="d" items="${ag.d}">
                                    <c:if test="${d eq date}">
                                        <c:set var="isOff" value="true"/>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                        </c:forEach>
                        <td class="${isOff ? 'absent' : 'present'}"></td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
