<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Duyệt đơn nghỉ phép</title>
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
            text-align: left;
        }

        .form-group {
            margin-bottom: 10px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        .info-box {
            background: #ffffff;
            padding: 8px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        /* Nút bấm */
        .btn-container {
            margin-top: 15px;
            display: flex;
            justify-content: space-between;
        }

        .btn {
            width: 48%;
            padding: 10px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
        }

        .approve-btn {
            background-color: #28a745;
            color: white;
        }

        .approve-btn:hover {
            background-color: #218838;
        }

        .reject-btn {
            background-color: #dc3545;
            color: white;
        }

        .reject-btn:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <div class="outer-container">
        <h2>Duyệt đơn nghỉ phép</h2>

        <div class="form-container">
            <div class="form-group">
                <label>Tiêu đề:</label>
                <div class="info-box">${l.title}</div>
            </div>
            <div class="form-group">
                <label>Tạo bởi:</label>
                <div class="info-box">${l.createdby.username}</div>
            </div>

            <div class="form-group">
                <label>Từ ngày:</label>
                <div class="info-box">${l.from}</div>
            </div>
            <div class="form-group">
                <label>Tới ngày:</label>
                <div class="info-box">${l.to}</div>
            </div>
            <div class="form-group">
                <label>Lý do:</label>
                <div class="info-box">${l.reason}</div>
            </div>
            <form action="review" method="post">
                <input type="hidden" name="id" value="${l.id}">
                <div class="btn-container">
                    <button type="submit" name="approved" class="btn approve-btn">Phê duyệt</button>
                    <button type="submit" name="reject" class="btn reject-btn">Từ chối</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
