<%-- 
    Document   : managerlist
    Created on : 16 Mar 2025, 15:04:32
    Author     : Lenovo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 20px;
        padding: 20px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        background-color: white;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        overflow: hidden;
    }

    th, td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #007BFF;
        color: white;
        font-weight: bold;
        text-transform: uppercase;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    tr:hover {
        background-color: #f1f1f1;
    }

    a {
        text-decoration: none;
        color: #007BFF;
        font-weight: bold;
    }

    a:hover {
        text-decoration: underline;
    }
</style>

    </head>
    <body>
        <table>
            <tr>
                <th>
                    Title
                </th>
                <th>
                    Reason
                </th>
                <th>
                    From
                </th>
                <th>
                    To
                </th>
                <th>
                    Created By
                </th>


                <th>
                    Create date
                </th>
                <th>
                    Status
                </th>

            </tr>

            <c:forEach items="${list}" var="l">
                <tr>

                    <td>
                        <c:url  value="/leaverequest/review" var="reviewUrl">
                            <c:param name="id" value="${l.id}" />
                        </c:url>
                        <a href="${reviewUrl}">
                        ${l.title}
                        </a>
                    </td>
                   
                    <td>${l.reason}</td>
                    <td>${l.from}</td>
                    <td>${l.to}</td>
                    <td>${l.createdby.displayname}</td>
                    <td>${l.createddate}</td>
                    <td>${l.status eq 0?"In Progress":(l.status eq 1)?"Rejected":"Accepted"}</td>
                </tr>
            </c:forEach>

        </table>
    </body>
</html>
