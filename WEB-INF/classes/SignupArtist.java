import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


@WebServlet("/SignupArtist")
public class SignupArtist extends HttpServlet {
        private static final long serialVersionUID = 1L;

        protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                Connection con;
                try{
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/satyam","root","Loknath@2534");


                        String username=request.getParameter("Name");
                        String country=request.getParameter("Country");
                        String dob=request.getParameter("dob");
                        String profession=request.getParameter("Profession");
                        String email=request.getParameter("email");
                        String password=request.getParameter("Password");
                        String state=request.getParameter("state");
                        String phone=request.getParameter("phone");
                        String secques=request.getParameter("securityquestion");
                        String ans=request.getParameter("answer");
                        
                        try{    
                                PreparedStatement st3=con.prepareStatement("delete from users where email=?;");
                                st3.setString(1,email);
                                st3.executeUpdate();
                              
                                        PreparedStatement st= con.prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?,?);");
                                        st.setString(1, username);
                                        st.setString(2, country);
                                        st.setString(3, dob);
                                        st.setString(4, profession);
                                        st.setString(5, email);
                                        st.setString(6, password);
                                        st.setString(7, state);
                                        st.setString(8, phone);
                                        st.setString(9, secques);
                                        st.setString(10, ans);

                                        int n=st.executeUpdate();
                                        if(n>0){
                                                redirectUser(response,"successfully created...........Proceeding to homepage","dummy.jsp");
                                        }
                                        else {
                                                redirectUser(response,"Error occured.....Confirm Resubmission?","dummy.jsp#arts-field");
                                        }
                                
                                
                        }catch(SQLException e){
                        	redirectUser(response,"Error interacting with database.....Confirm Resubmission?","dummy.jsp#arts-field");
                        }

                }catch (Exception e){
                	redirectUser(response,"An unknown error occured.....Proceeding to home page","dummy.jsp");
                }
        }
        


        // public static void redirectUser(HttpServletResponse response,String msg,String page)throws IOException{
        //         int boxResponse = JOptionPane.showConfirmDialog(null, msg, "Confirm", JOptionPane.YES_NO_OPTION);
        //         if (boxResponse == JOptionPane.YES_OPTION) {
        //             response.sendRedirect(page);
        //         } else {
        //             redirectUser(response,"Action terminated....Proceeding to signup page","signup");
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