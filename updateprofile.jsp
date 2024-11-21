<%@ page import="java.sql.*" %>
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

<%
    String dbemail = request.getParameter("email");
    
    // Initialize variables
    String name = "Unknown";
    String country = "Unknown";
    String dob = "Unknown";
    String prof = "Unknown";
    String state = "Unknown";
    String phno = "Unknown";
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/satyam", "root", "Loknath@2534");

        preparedStatement = connection.prepareStatement("SELECT * FROM users WHERE email = ?");
        preparedStatement.setString(1, dbemail);
        
        rs = preparedStatement.executeQuery();

        
        if (rs.next()) {
            name = rs.getString("name");
            country = rs.getString("country");
            dob = rs.getString("dob");
            prof = rs.getString("profession");
            state = rs.getString("state");
            phno = rs.getString("phno");
        } else {
            out.println("<p>No user details found for this email</p>");
        }
    } catch (Exception e) {
        e.printStackTrace(); // Print error if any occurs during SQL processing
    }
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
      <p><strong>Profession:</strong> <%= prof %></p>
      <p><strong>State:</strong> <%= state %></p>
      <p><strong>Phone:</strong> <%= phno %></p>
      <p><strong>Email:</strong> <%= dbemail %></p>
    </div>
  </div>
</div>

<div class="update">
    <!-- Correct the hidden field to properly pass the email for updating -->
    <form method="post" action="profileupdation.jsp">
        <input type="hidden" name="email" value="<%=dbemail%>">
        <input type="submit" value="Update Profile">
    </form>
</div>

</body>
</html>
