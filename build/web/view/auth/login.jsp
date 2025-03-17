<%-- 
    Document   : login
    Created on : 11 Mar 2025, 01:36:58
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    /* 🚀 KHUNG NGOÀI KHÔNG VIỀN XANH */
    .outer-container {
        background-color: #ffffff;
        padding: 25px;
        border-radius: 12px;
        box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.15); /* Chỉ có bóng đổ */
        width: 350px;
        text-align: center;
    }

    .outer-container h2 {
        margin-bottom: 15px;
        color: #333;
        font-size: 22px;
        text-transform: uppercase;
    }

    /* 🚀 KHUNG FORM */
    .form-container {
        background-color: #f9f9f9;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    }

    form {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    label {
        font-weight: bold;
        text-align: left;
        width: 100%;
        margin-top: 10px;
    }

    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 14px;
    }

    input[type="submit"] {
        background-color: #007BFF;
        color: white;
        border: none;
        padding: 12px;
        font-size: 16px;
        border-radius: 5px;
        cursor: pointer;
        margin-top: 15px;
        font-weight: bold;
        width: 100%;
    }

    input[type="submit"]:hover {
        background-color: #0056b3;
    }
</style>

    </head>
    <body>
        <div class="outer-container">
            <h2>Đăng Nhập</h2>
            <div class="form-container">
                <form action="login" method="post">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username">

                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password">

                    <input type="submit" value="Login">
                </form>
            </div>
        </div>
    </body>
</html>
