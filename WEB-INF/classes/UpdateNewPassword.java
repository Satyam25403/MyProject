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

@WebServlet("/UpdateNewPassword")
public class UpdateNewPassword extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/satyam","root","Loknath@2534");

                String password = request.getParameter("pass");
                String confirmPassword = request.getParameter("confpass");
                String email=request.getParameter("email");

                if(password.equals(confirmPassword)){
                    try {
                        PreparedStatement ps = con.prepareStatement("update users set password=? WHERE email=?");
                        ps.setString(1, password);
                        ps.setString(2, email);
                        int n= ps.executeUpdate();

                        if (n>0) {
                            redirectUser(response, "password updated successfully.....redirecting to homepage", "dummy.html");
                        } else {
                            redirectUser(response, "Error while updating password....retry?","forgotpassword.html");;
                        }
                    
                    }
                    catch (SQLException e) {
                        redirectUser(response, "Error verifying from database.....confirm resubmission", "forgotpassword.html");
                    }
                }
                else{
                    //passwords dont match
                    redirectUser(response, "Passwords dont match....try updating password again?", "forgotpassword.html");
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