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
        // Step 1: Register the MySQL JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Step 2: Establish connection to the database
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/satyam", "root", "Loknath@2534");

        // Step 3: Prepare the SQL query to fetch user details by email
        preparedStatement = connection.prepareStatement("SELECT * FROM users WHERE email = ?");
        preparedStatement.setString(1, dbemail);
        
        // Step 4: Execute the query
        rs = preparedStatement.executeQuery();

        // Step 5: Check if user details are found and populate variables
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
    } finally {
        // Close resources in finally block
        try {
            if (rs != null) rs.close();
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
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
        <p id="pro"><%= prof %></p>
    </div>

    <div class="phone">
        <p id="phone"><%= phno %></p>
    </div>

    <div class="email">
        <p id="email"><%= dbemail %></p>
    </div>
</div>

<div class="update">
    <!-- Correct the hidden field to properly pass the email for updating -->
    <form method="post" action="profileupdation.jsp">
        <input type="hidden" name="email" value="<%= dbemail %>">
        <input type="submit" value="Update Profile">
    </form>
</div>

</body>
</html>
