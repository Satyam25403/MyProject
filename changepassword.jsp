<%@ page import="java.sql.*" %>
<%
String userans = request.getParameter("useranswer");
String actualans = request.getParameter("actualanswer");
String email=request.getParameter("email");

if (!userans.equals(actualans)) {
    response.setContentType("text/html");
    out.println("<html><body><form action='forgotpassword.jsp' method='POST'>");
    out.println("<h1>Wrong answer to security question...retry?</h1>");
    out.println("<button type='submit' class='btn'>Proceed</button>");
    out.println("</form></body></html>");
}
else{
    response.setContentType("text/html");
    out.println("<html><body><form action='UpdateNewPassword' method='POST'>");
    out.println("<input type='hidden' name='email' value='"+email+"'>");
    out.println("New Password:<input type='password' name='pass'>");
    out.println("New Password:<input type='password' name='confpass'>");
    out.println("<button type='submit' class='btn'>Update password</button>");
    out.println("</form></body></html>");
}
%>