import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/ResetPassword")
public class ResetPassword extends HttpServlet {
    private static final long serialVersionUID = 1L;
    String secques="";
    String secans="";

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/satyam","root","Loknath@2534");
                String email = request.getParameter("email");

            try {
                PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE email=?");
                ps.setString(1, email);
                ResultSet rs = ps.executeQuery();
                PrintWriter out=response.getWriter();
                response.setContentType("text/html");
                if (rs.next()) {
                    
                    secques=rs.getString("securityquestion");
                    secans=rs.getString("answer");
                    
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<style>");
                    out.println("body, h1, h2, h3, h4, h5, h6, p, ul, ol, li, table, th, td, form, input, select, textarea, button {");
                    out.println("    margin: 0;");
                    out.println("    padding: 0;");
                    out.println("    border: 0;");
                    out.println("    font-family: 'Arial', sans-serif;");
                    out.println("    box-sizing: border-box;");
                    out.println("}");
                    out.println("body {");
                    out.println("    background-color: #f4f4f4;");
                    out.println("    display: flex;");
                    out.println("    justify-content: center;");
                    out.println("    align-items: center;");
                    out.println("    height: 100vh;");
                    out.println("    font-family: 'Arial', sans-serif;");
                    out.println("}");
                    out.println(".container {");
                    out.println("    width: 100%;");
                    out.println("    max-width: 400px;");
                    out.println("    padding: 20px;");
                    out.println("    background: #fff;");
                    out.println("    box-shadow: 0 0 10px rgba(0,0,0,0.1);");
                    out.println("    border-radius: 8px;");
                    out.println("}");
                    out.println(".form-title {");
                    out.println("    margin-bottom: 20px;");
                    out.println("    text-align: center;");
                    out.println("    font-size: 24px;");
                    out.println("    color: #333;");
                    out.println("}");
                    out.println(".input-group {");
                    out.println("    margin-bottom: 15px;");
                    out.println("    position: relative;");
                    out.println("}");
                    out.println(".input-group i {");
                    out.println("    position: absolute;");
                    out.println("    top: 50%;");
                    out.println("    left: 10px;");
                    out.println("    transform: translateY(-50%);");
                    out.println("    color: #999;");
                    out.println("}");
                    out.println(".input-group input,");
                    out.println(".input-group select {");
                    out.println("    width: 100%;");
                    out.println("    padding: 10px 10px 10px 40px;");
                    out.println("    border: 1px solid #ddd;");
                    out.println("    border-radius: 5px;");
                    out.println("    transition: all 0.3s;");
                    out.println("}");
                    out.println(".input-group input:focus,");
                    out.println(".input-group select:focus {");
                    out.println("    border-color: #333;");
                    out.println("    outline: none;");
                    out.println("}");
                    out.println(".input-group label {");
                    out.println("    position: absolute;");
                    out.println("    top: -5px;");
                    out.println("    left: 10px;");
                    out.println("    background: #fff;");
                    out.println("    padding: 0 5px;");
                    out.println("    font-size: 12px;");
                    out.println("    color: #333;");
                    out.println("}");
                    out.println(".btn {");
                    out.println("    width: 100%;");
                    out.println("    padding: 10px;");
                    out.println("    background: #333;");
                    out.println("    color: #fff;");
                    out.println("    border: none;");
                    out.println("    border-radius: 5px;");
                    out.println("    cursor: pointer;");
                    out.println("    transition: background 0.3s;");
                    out.println("}");
                    out.println(".btn:hover {");
                    out.println("    background: #555;");
                    out.println("}");
                    out.println(".links {");
                    out.println("    text-align: center;");
                    out.println("    margin-top: 20px;");
                    out.println("}");
                    out.println(".links p {");
                    out.println("    margin-bottom: 10px;");
                    out.println("    color: #666;");
                    out.println("}");
                    out.println(".links a {");
                    out.println("    color: #333;");
                    out.println("    text-decoration: none;");
                    out.println("}");
                    out.println(".links a:hover {");
                    out.println("    text-decoration: underline;");
                    out.println("}");
                    out.println("</style>");
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<div class='container'>");
                    out.println("<form method='post' action='changepassword.jsp'>");
                    out.println("<div class='form-title'><h1>Answer your security question:</h1></div>");
                    out.println("<div class='input-group'><h3>"+secques+"</h3></div>");
                    out.println("<div class='input-group'><input type='text' name='useranswer' placeholder='Your answer'></div>");
                    out.println("<input type='hidden' name='actualanswer' value='" + secans+ "'>");
                    out.println("<input type='hidden' name='email' value='" + email+ "'>");
                    out.println("<div class='input-group'><button class='btn' type='submit'>Verify answer</button></div>");
                    out.println("</form>");
                    out.println("</div>");
                    out.println("</body>");
                    out.println("</html>");
                    
                } else {
                    redirectUser(response, "This mail is not registered in database","forgotpassword.jsp");;
                }
            }
            catch (SQLException e) {
                redirectUser(response, "Error verifying email from database", "forgotpassword.jsp");
            }
        } catch (Exception e) {
            redirectUser(response, "Unkown error occured.....Proceeding to home page", "dummy.jsp");
        }
    }
    public static void redirectUser(HttpServletResponse response, String msg, String page) throws IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        out.println("<html><body>");
        out.println("<form action='" + page + "' method='POST' style='display: flex; flex-direction: column; align-items: center; justify-content: center; height: 100vh; margin: 0;'>");
        out.println("<h1 style='background-color: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; padding: 20px; border-radius: 5px; font-family: Arial, sans-serif; text-align: center;'>" + msg + "</h1>");
        out.println("<button type='submit' class='btn' style='margin-top: 20px; padding: 10px 20px; font-size: 16px; background-color: #007bff; color: white; border: none; border-radius: 5px; cursor: pointer;'>Ok</button>");
        out.println("</form>");
        out.println("</body></html>");
    }

}