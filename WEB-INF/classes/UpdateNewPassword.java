import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.annotation.WebServlet;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/UpdateNewPassword")
public class UpdateNewPassword extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/satyam", "root", "Loknath@2534");

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
    public static void redirectUser(HttpServletResponse response,String msg,String page)throws IOException{
        PrintWriter out=response.getWriter();
        response.setContentType("text/html");
        out.println("<html><body><form action='"+page+"' method='POST'>");
        out.println("<h1>"+msg+"</h1>");
        out.println("<button type='submit' class='btn'>Proceed</button>");
        out.println("</form></body></html>");
    }
}

