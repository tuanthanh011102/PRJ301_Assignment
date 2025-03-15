<%-- 
    Document   : request
    Created on : 16 Mar 2025, 00:24:45
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="create" method="post">
            Tieu de:<input type="text" name="title"><br/>
            Từ ngày:<input type="date" name="from" ><br/>
            Tới ngày:<input type="date" name="to" ><br/>
            Lýdo:<input type="text" name="reason"><br/>
            <input type="submit" value="send" >
        </form>
    </body>
</html>
