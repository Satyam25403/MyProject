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
      font-family: Arial, sans-serif;
      height: 100vh;
      width: 100vw;
      display: flex;
      justify-content: center;
      align-items: center;
      background-color: #f4f4f9;
    }
    .profile {
      background-color: #ffffff;
      height: 350px;
      width: 800px;
      display: grid;
      grid-template-columns: 1fr 2fr;
      grid-template-rows: 150px 50px 50px 50px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      border-radius: 10px;
      overflow: hidden;
    }
    .profile .icon {
      grid-row: 1 / span 2;
      background-color: #0077b6;
      color: white;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .profile .icon i {
      font-size: 100px;
    }
    .details, .dob, .pro, .phone, .email {
      padding: 10px 20px;
      display: flex;
      flex-direction: column;
      justify-content: center;
    }
    .details {
      grid-row: 1 / 2;
      font-size: 20px;
    }
    .details p {
      font-size: 25px;
      font-weight: bold;
      color: #333333;
      margin-bottom: 5px;
    }
    .details #country {
      font-size: 18px;
      font-weight: normal;
      color: #555555;
    }
    .dob, .pro, .phone, .email {
      font-size: 18px;
      color: #555555;
    }
    .dob p, .pro p, .phone p, .email p {
      margin: 0;
    }
    .dob {
      grid-column: 2 / 3;
      grid-row: 2 / 3;
    }
    .pro {
      grid-column: 2 / 3;
      grid-row: 3 / 4;
    }
    .phone {
      grid-column: 2 / 3;
      grid-row: 4 / 5;
    }
    .email {
      grid-column: 2 / 3;
      grid-row: 5 / 6;
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
    <i class="fa-solid fa-user-graduate" id="graduate"></i>
  </div>

  <div class="details">
    <p id="name"><%= name %></p>
    <p id="country"><%= country %></p>
  </div>

  <div class="dob">
    <p id="dob"><%= dob %></p>
  </div>

  <div class="pro">
    <p id="pro"><%= pro %></p>
  </div>

  <div class="phone">
    <p id="phone"><%= phone %></p>
  </div>

  <div class="email">
    <p id="email"><%= email %></p>
  </div>
</div>

</body>
</html>