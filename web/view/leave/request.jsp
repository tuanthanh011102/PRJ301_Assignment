<%-- 
    Document   : request
    Created on : 16 Mar 2025, 00:24:45
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

            /* Khung ngoài */
            .outer-container {
                background-color: #ffffff;
                padding: 30px;
                border-radius: 12px;
                box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
                width: 400px;
                text-align: center;
            }

            .outer-container h2 {
                margin-bottom: 15px;
                color: #007BFF;
            }

            /* Khung form */
            .form-container {
                background-color: #f9f9f9;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.1);
            }

            form {
                display: flex;
                flex-direction: column;
            }

            label {
                font-weight: bold;
                margin-top: 10px;
                text-align: left;
            }

            input[type="text"],
            input[type="date"] {
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
            }

            input[type="submit"]:hover {
                background-color: #0056b3;
            }
        </style>


    </head>
    <body>
        <div class="outer-container">
      
            <div class="form-container">
                <form action="create" method="post">
                    <label for="title">Tiêu đề:</label>
                    <input type="text" id="title" name="title">

                    <label for="from">Từ ngày:</label>
                    <input type="date" id="from" name="from">

                    <label for="to">Tới ngày:</label>
                    <input type="date" id="to" name="to">

                    <label for="reason">Lý do:</label>
                    <input type="text" id="reason" name="reason">

                    <input type="submit" value="Gửi">
                </form>
            </div>
        </div>
    </body>
</html>
