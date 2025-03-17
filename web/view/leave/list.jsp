    <%-- 
        Document   : list
        Created on : 16 Mar 2025, 13:55:18
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
        background-color: #fff;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        overflow: hidden;
    }

    th, td {
        padding: 12px;
        text-align: center;
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
        transition: 0.3s ease-in-out;
    }

    td {
        color: #333;
    }

    /* Bo tròn góc cho bảng */
    table, th:first-child, td:first-child {
        border-top-left-radius: 8px;
        border-bottom-left-radius: 8px;
    }

    table, th:last-child, td:last-child {
        border-top-right-radius: 8px;
        border-bottom-right-radius: 8px;
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

                        <td>${l.title}</td>
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
