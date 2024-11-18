
import java.io.*;
import java.sql.*;
import javax.swing.JOptionPane;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


@WebServlet("/Signup")
public class Signup extends HttpServlet {
        private static final long serialVersionUID = 1L;

        protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                Connection con;
                try{
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/satyam","root","Loknath@2534");

                        PrintWriter out=response.getWriter();
                        response.setContentType("text/html");

                        String username=request.getParameter("Name");
                        String country=request.getParameter("Country");
                        String dob=request.getParameter("dob");
                        String profession=request.getParameter("Profession");
                        String email=request.getParameter("email");
                        String password=request.getParameter("Password");
                        
                        try{
                                PreparedStatement st1=con.prepareStatement("select email from users where email=?;");
                                st1.setString(1, email);
                                ResultSet rs=st1.executeQuery();
                                if(rs.next()){
                                        redirectUser(response,"Email exists...Wish to sign in?","signin.html");
                                }
                                else{
                                        PreparedStatement st= con.prepareStatement("insert into users values(?,?,?,?,?,?);");
                                        st.setString(1, username);
                                        st.setString(2, country);
                                        st.setString(3, dob);
                                        st.setString(4, profession);
                                        st.setString(5, email);
                                        st.setString(6, password);

                                        out.println("<html><body>");
                                        int n=st.executeUpdate();
                                        if(n>0){
                                                //redirect to homepage
                                        }
                                        else {
                                                redirectUser(response,"Error occured.....Confirm Resubmission?","signup.html");
                                        }
                                        out.println("</body></html>");
                                        st.close();
                                }
                                
                        }catch(Exception e){
                                e.printStackTrace();
                        }

                }catch (SQLException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                }catch (Exception e){
                        // TODO Auto-generated catch block
                        System.out.println("Unkown error");
                }
        }
        


        public static void redirectUser(HttpServletResponse response,String msg,String page)throws IOException{
                int boxResponse = JOptionPane.showConfirmDialog(null, msg, "Confirm", JOptionPane.YES_NO_OPTION);
                if (boxResponse == JOptionPane.YES_OPTION) {
                    response.sendRedirect(page);
                } else if (boxResponse == JOptionPane.NO_OPTION) {
                    System.out.println("User chose NO.");
                } else {
                    System.out.println("User closed the dialog.");
                }
        }



}