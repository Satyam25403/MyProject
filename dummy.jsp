<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trinity</title>
    <link rel="stylesheet" href="Trinity.css">
</head>
<body>
<%!
String email;
%>
<% email=request.getParameter("email");%>

    <!------------------------------------------------------------------- navigation ------------------------------------------------------------->
    <header>
        <div class="logo">
            <button class="toggle">toggle</button>
            <span>Trinity</span>
        </div>
        <nav>
                <h4><a href="">Home</a></h4>
                <h4><a href="#arts-field">Arts</a></h4>
                <h4><a href="#culture-field">Culture</a></h4>
                <h4><a href="#tradition-field">Tradition</a></h4>
                <h4><a href="#tourism-field">Tourism</a></h4>
        </nav>
        <div class="credentials">
            <form method="post" action="updateprofile.jsp">
            <input type="hidden" name="email2" value=<%=email%>>
            <input type="submit" value="Logged in">
            </form>
        </div>
    </header>

    <!---------------------------------------------------------- introduction to fields ---------------------------------------------------------->
    
    <div class="welcome-page">
        <h1>Welcome to the heart of India</h1>
    </div>

    <div class="arts-field" id="arts-field">
        <h1>Arts section</h1>
        <p>Historical art reflects the culture and values of its time, evolving from symbolic cave paintings to the realism of the Renaissance and the drama of the Baroque. Influenced by society, materials, and patronage, it documented history, expressed beliefs, and paved the way for modern art's experimentation and abstraction.</p>
        <a href="states-arts.jsp"><button class="explore">Explore more</button></a>
        <% 
        response.setContentType("text/html");
        out.println("<html><body>");
        out.println("<form action='signupartist.jsp' method='POST' style='display: flex; flex-direction: column; align-items: center; justify-content: center; height: 100vh; margin: 0;'>");
        // out.println("<h1 style='background-color: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; padding: 20px; border-radius: 5px; font-family: Arial, sans-serif; text-align: center;>Log in successful</h1>");
        // out.println("<input type='hidden' name='email' value='"+email+"'>");
        out.println("<button type='submit' class='btn' style='margin-top: 20px; padding: 10px 20px; font-size: 16px; background-color: #007bff; color: white; border: none; border-radius: 5px; cursor: pointer;'>Register to showcase your talent</button>");
        out.println("</form>");
        out.println("</body></html>");

        %>
    </div>

    <div class="culture-field" id="culture-field">
        <h1>Culture section</h1>
        <p>Culture encompasses the beliefs, practices, art, and traditions of a society, reflecting its identity and values. It evolves through history, influenced by geography, religion, and interaction with other cultures, shaping languages, customs, and ways of life. Culture preserves heritage while adapting to change, bridging the past and present.</p>
        <a href="states-culture.jsp"><button class="explore">Explore more</button></a>
    </div>

    <div class="tradition-field" id="tradition-field">
        <h1>Tradition section</h1>
        <p>Tradition refers to the customs, rituals, and practices passed down through generations, shaping a community’s identity. It reflects a society's values, beliefs, and way of life, often tied to cultural, religious, or historical events. While traditions evolve over time, they help preserve heritage and foster a sense of continuity and belonging.</p>
        <a href="states-tradition.jsp"><button class="explore">Explore more</button></a>
    </div>

    <div class="tourism-field" id="tourism-field">
        <h1>Tourism section</h1>
        <p>Tourism involves traveling for leisure, exploration, or cultural exchange, often to experience new places, traditions, and natural wonders. It drives economic growth, promotes cultural understanding, and fosters global connections. While tourism offers personal enrichment, it can also impact local environments and communities, requiring sustainable practices.</p>
        <a href="states-tourism.jsp"><button class="explore">Explore more</button></a>   
    </div>

    <script src="scripts/Trinity.js"></script>
</body>
</html>