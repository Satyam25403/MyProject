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
                    

                    out.println("<html><body><form method='post' action='changepassword.jsp'>");
                    out.println("<h1>Answer your security question:</h1>");
                    out.println("<h3>"+secques+"</h3>");
                    out.println("<input type='text' name='useranswer'>");
                    out.println("<input type='hidden' name='actualanswer' value='" + secans+ "'>");
                    out.println("<input type='hidden' name='email' value='" + email+ "'>");
                    out.println("<button type='submit'>Verify answer</button>");
                    out.println("</form>");
                    out.println("</body></html>");
                } else {
                    redirectUser(response, "This mail is not registered in database","forgotpassword.jsp");;
                }
            }
            catch (SQLException e) {
                redirectUser(response, "Error verifying email from database", "forgotpassword.jsp");
            }
        } catch (Exception e) {
            redirectUser(response, "Unkown error occured.....Proceeding to home page", "dummy.html");
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