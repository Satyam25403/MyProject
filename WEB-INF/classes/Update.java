import java.io.*;
import java.sql.*;
import javax.swing.JOptionPane;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


@WebServlet("/Update")
public class Update extends HttpServlet {
        private static final long serialVersionUID = 1L;

        protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                Connection con;
                try{
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/satyam","root","Loknath@2534");

                        //get email from session
                        HttpSession s=request.getSession();
                        String email=(String)s.getAttribute("email");
                        System.out.println(email);

                        String username=request.getParameter("Name");
                        String country=request.getParameter("Country");
                        String dob=request.getParameter("dob");
                        String profession=request.getParameter("Profession");
                        String state=request.getParameter("state");
                        String phone=request.getParameter("phone");
                        
                        try{
                            //change command
                            PreparedStatement st= con.prepareStatement("update users set name=?, country=?, dob=?, profession=?, state=?, phno=? where email=?;");
                                st.setString(1, username);
                                st.setString(2, country);
                                st.setString(3, dob);
                                st.setString(4, profession);
                                st.setString(5, state);
                                st.setString(6, phone);
                                st.setString(7,email);
                                int n=st.executeUpdate();
                                if(n>0){
                                        redirectUser(response,"successfully updated...........Proceeding to home page","dummy.html");
                                }
                                else {
                                        redirectUser(response,"Error occured while updating.....Confirm Resubmission?","profileupdation.jsp");
                                }
                            
                                
                        }catch(SQLException e){
                        	redirectUser(response,"Error interacting with database.....Confirm Resubmission?","profileupdation.jsp");
                        }

                }catch (Exception e){
                	redirectUser(response,"An unknown error occured.....Redirecting to home page?","dummy.html");
                }
        }
        


        public static void redirectUser(HttpServletResponse response,String msg,String page)throws IOException{
                int boxResponse = JOptionPane.showConfirmDialog(null, msg, "Confirm", JOptionPane.YES_NO_OPTION);
                if (boxResponse == JOptionPane.YES_OPTION) {
                    response.sendRedirect(page);
                } else {
                    redirectUser(response,"Action terminated....Proceeding to signup page","signup");
                } 
        }



}