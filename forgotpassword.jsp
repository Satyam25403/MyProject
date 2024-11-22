<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            border: 0;
            font-family: 'Arial', sans-serif;
            box-sizing: border-box;
        }
        body {
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: 'Arial', sans-serif;
        }
        .update {
            width: 100%;
            max-width: 400px;
            padding: 20px;
            background: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 8px;
        }
        .update form {
            display: flex;
            flex-direction: column;
        }
        .update input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            transition: all 0.3s;
        }
        .update input[type="email"]:focus {
            border-color: #333;
            outline: none;
        }
        .update input[type="submit"] {
            width: 100%;
            padding: 10px;
            background: #333;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s;
        }
        .update input[type="submit"]:hover {
            background: #555;
        }
        .update p {
            color: red;
            margin-top: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="update">
        <form method="post" action="ResetPassword">
            Enter Email: <input type="email" name="email" required>
            <input type="submit" value="Reset Password">
        </form>
        <% if (request.getParameter("error") != null) { %>
            <p><%= request.getParameter("error") %></p>
        <% } %>
    </div>
</body>
</html>
