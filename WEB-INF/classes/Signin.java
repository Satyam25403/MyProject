import java.io.*;
import java.sql.*;
import javax.swing.JOptionPane;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


@WebServlet("/Signin")
public class Signin extends HttpServlet {
        private static final long serialVersionUID = 1L;

        protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                Connection con;
                try{
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/satyam","root","Loknath@2534");

                        String email=request.getParameter("email1");
                        String password=request.getParameter("password1");
                       
                        
                        try{
                                PreparedStatement test= con.prepareStatement("select email from users where email=?;");
                                test.setString(1, email);
                                ResultSet r=test.executeQuery();
                                if(r.next()) {
                                	//if that mail is already in database: check for email and password
                                
                                
                                

                                	PreparedStatement st= con.prepareStatement("select email from users where email=? and password=?;");
                                	st.setString(1,email);
                                	st.setString(2, password);
                                
                                	ResultSet rs=st.executeQuery();
                                	if(rs.next()){
                                                redirectUser(response,"successfully Loggedin...........Proceeding to home page","dummy.html");
                        		}
                        		else {
                                                redirectUser(response,"username password mismatch.....we recommend relogin","signin.html");
                        		}
                                        
                        		st.close();
                        	}else {
                        		redirectUser(response,"Unregistered email.........Proceeding to Signup page","signup.html");
                        	}
                                
                        }catch(SQLException e){
                        	redirectUser(response,"Error while verifying email........Proceeding again to Signin page","signin.html");
                        }

                }catch (Exception e){
                	redirectUser(response,"An unknown error occured........Confirm resubmission to Signup page","signin.html");
                }
        }
        


        // public static void redirectUser(HttpServletResponse response,String msg,String page)throws IOException{
        //         int boxResponse = JOptionPane.showConfirmDialog(null, msg, "Confirm", JOptionPane.YES_NO_OPTION);
        //         if (boxResponse == JOptionPane.YES_OPTION) {
        //             response.sendRedirect(page);
        //         }else {
        //             redirectUser(response,"Back to signinPage?","signin.html");
        //         }
        // }
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