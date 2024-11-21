<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Profile Page</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #e0f7fa;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    .profile {
      background-color: #ffffff;
      width: 80%;
      max-width: 800px;
      border-radius: 15px;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
      overflow: hidden;
      display: flex;
      flex-wrap: wrap;
    }
    .profile .icon {
      background-color: #0077b6;
      color: white;
      padding: 20px;
      display: flex;
      align-items: center;
      justify-content: center;
      width: 100%;
    }
    .profile .icon i {
      font-size: 80px;
    }
    .profile .details {
      flex: 1;
      padding: 20px;
    }
    .profile .details p {
      font-size: 22px;
      font-weight: bold;
      color: #333;
      margin-bottom: 5px;
    }
    .profile .details span {
      display: block;
      font-size: 18px;
      font-weight: normal;
      color: #666;
      margin-bottom: 10px;
    }
    .profile .info {
      display: flex;
      flex-direction: column;
      gap: 10px;
      margin-top: 20px;
    }
    .profile .info p {
      font-size: 18px;
      color: #555;
    }
  </style>
</head>
<body>

<%-- Fetch email and retrieve all other information from the database --%>
<%
  String name = request.getParameter("name");
  String country = request.getParameter("country");
  String dob = request.getParameter("dob");
  String pro = request.getParameter("profession");
  String email = request.getParameter("email");
  String state = request.getParameter("state");
  String phone = request.getParameter("phno");
%>

<div class="profile">
  <div class="icon">
    <i class="fa-solid fa-user-graduate"></i>
  </div>

  <div class="details">
    <p><%= name %></p>
    <span id="country"><%= country %></span>
    <div class="info">
      <p><strong>DOB:</strong> <%= dob %></p>
      <p><strong>Profession:</strong> <%= pro %></p>
      <p><strong>State:</strong> <%= state %></p>
      <p><strong>Phone:</strong> <%= phone %></p>
      <p><strong>Email:</strong> <%= email %></p>
    </div>
  </div>
</div>

</body>
</html>
