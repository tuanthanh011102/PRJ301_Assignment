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
      /* Table Styling */
            body {
                font-family: 'Segoe UI', Roboto, Arial, sans-serif;
                background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
                min-height: 100vh;
                display: flex;
                justify-content: center;
                padding: 40px 20px;
                box-sizing: border-box;
            }

            table {
                background-color: white;
                border-collapse: collapse;
                width: 90%;
                max-width: 1200px;
                margin: 0 auto;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                overflow: hidden;
            }

            th {
                background-color: #007BFF;
                color: white;
                font-weight: 600;
                text-align: left;
                padding: 15px 20px;
                font-size: 14px;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }

            td {
                padding: 14px 20px;
                border-bottom: 1px solid #eee;
                font-size: 14px;
                color: #333;
            }

            tr:last-child td {
                border-bottom: none;
            }

            tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            tr:hover {
                background-color: #f0f7ff;
                transition: background-color 0.3s ease;
            }

            /* Link styling */
            a {
                text-decoration: none;
                color: #007bff;
                font-weight: 500;
                display: inline-block;
                position: relative;
                transition: color 0.3s ease;
            }

            a:hover {
                color: #0056b3;
            }

            a::after {
                content: '';
                position: absolute;
                width: 100%;
                transform: scaleX(0);
                height: 2px;
                bottom: -3px;
                left: 0;
                background-color: #0056b3;
                transform-origin: bottom right;
                transition: transform 0.3s ease-out;
            }

            a:hover::after {
                transform: scaleX(1);
                transform-origin: bottom left;
            }

            /* Status styling */
            td:last-child {
                font-weight: 600;
            }

            td:last-child:contains("In Progress") {
                color: #f39c12;
            }

            td:last-child:contains("Rejected") {
                color: #e74c3c;
            }

            td:last-child:contains("Accepted") {
                color: #2ecc71;
            }

            /* Custom status badges */
            td:last-child {
                position: relative;
                padding-left: 15px;
            }

            td:last-child::before {
                content: '';
                position: absolute;
                left: 0;
                top: 50%;
                transform: translateY(-50%);
                width: 8px;
                height: 8px;
                border-radius: 50%;
            }

            td:nth-child(7):contains("In Progress")::before {
                background-color: #f39c12;
            }

            td:nth-child(7):contains("Rejected")::before {
                background-color: #e74c3c;
            }

            td:nth-child(7):contains("Accepted")::before {
                background-color: #2ecc71;
            }

            /* Responsive adjustments */
            @media screen and (max-width: 768px) {
                table {
                    width: 100%;
                }

                th, td {
                    padding: 10px 15px;
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
