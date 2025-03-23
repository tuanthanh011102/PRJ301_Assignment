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
            /* Reset and base styles */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Segoe UI', Roboto, Arial, sans-serif;
                background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                color: #333;
            }

            /* Back link styling */
            a {
                display: inline-block;
                text-decoration: none;
                font-size: 16px;
                color: #007bff;
                margin-bottom: 20px;
                font-weight: 600;
                transition: all 0.3s ease;
                position: relative;
                padding-left: 20px;
            }

            a:before {
                content: "←";
                position: absolute;
                left: 0;
                transition: transform 0.3s ease;
            }

            a:hover {
                color: #0056b3;
            }

            a:hover:before {
                transform: translateX(-3px);
            }

            /* Outer container styling */
            .outer-container {
                background-color: #ffffff;
                padding: 30px;
                border-radius: 16px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
                width: 450px;
                text-align: center;
                transition: transform 0.3s ease;
            }

            .outer-container:hover {
                transform: translateY(-5px);
                box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
            }

            .outer-container h2 {
                margin-bottom: 20px;
                color: #007BFF;
                font-size: 24px;
                font-weight: 700;
            }

            /* Form container styling */
            .form-container {
                background-color: #f9f9f9;
                padding: 25px;
                border-radius: 12px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            }

            form {
                display: flex;
                flex-direction: column;
            }

            label {
                font-weight: 600;
                margin-top: 15px;
                text-align: left;
                font-size: 14px;
                color: #555;
                margin-bottom: 5px;
                transition: color 0.3s ease;
            }

            input[type="text"],
            input[type="date"] {
                width: 100%;
                padding: 12px 15px;
                margin-top: 5px;
                border: 1px solid #e1e1e1;
                border-radius: 8px;
                font-size: 15px;
                transition: all 0.3s ease;
                background-color: #fff;
            }
            input[type="text"]:focus,
            input[type="date"]:focus {
                outline: none;
                border-color: #007BFF;
                box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.1);
            }

            input[type="submit"] {
                background: linear-gradient(to right, #007BFF, #0056b3);
                color: white;
                border: none;
                padding: 14px;
                font-size: 16px;
                border-radius: 8px;
                cursor: pointer;
                margin-top: 25px;
                font-weight: 600;
                transition: all 0.3s ease;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }

            input[type="submit"]:hover {
                background: linear-gradient(to right, #0056b3, #003d80);
                transform: translateY(-2px);
                box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
            }

            input[type="submit"]:active {
                transform: translateY(0);
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            /* Error handling styles */
            input:invalid {
                border-color: #ff7a7a;
            }

            /* Placeholder styling */
            ::placeholder {
                color: #aaa;
                opacity: 1;
            }
        </style>


    </head>
    <body>

        <div class="outer-container">
            <a onclick="history.back()">Back</a>

            <div class="form-container">
                <form action="create" method="post">
                    <label for="title">Tiêu đề:</label>
                    <input type="text" id="title" name="title" required="">

                    <label for="from">Từ ngày:</label>
                    <input type="date" id="from" name="from" required="">

                    <label for="to">Tới ngày:</label>
                    <input type="date" id="to" name="to" required="">

                    <label for="reason">Lý do:</label>
                    <input type="text" id="reason" name="reason" required="">

                    <input type="submit" value="Gửi">
                </form>
            </div>
        </div>
    </body>
</html>
