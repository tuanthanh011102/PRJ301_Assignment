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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
            <c:forEach var="feature" items="${feature}">
                <tr>
                    <td>
                        <a href="<c:url value='${feature.url}' />">${feature.name}</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
