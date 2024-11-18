import java.io.*;
import java.sql.*;
import javax.swing.JOptionPane;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


@WebServlet("/FilterResults")
public class FilterResults extends HttpServlet {
        private static final long serialVersionUID = 1L;

        protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                Connection con;
                try{
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/satyam","root","Loknath@2534");

                        PrintWriter out=response.getWriter();
                        response.setContentType("text/html");

                        String state=request.getParameter("state");
                        String profession=request.getParameter("Profession");
                        
                        try{
                                PreparedStatement st=con.prepareStatement("select email from users where state=? and profession=?;");
                                st.setString(1, state);
                                st.setString(2, profession);
                                ResultSet rs=st.executeQuery();
                                if(rs.next()){
                                        //display users in a table
                                }
                                else{
                                        promptUser("No such user found");
                                }
                                
                        }catch(Exception e){
                                //redirect user to chose state and profession page
                        }

                }catch (SQLException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                }catch (Exception e){
                        // TODO Auto-generated catch block
                        System.out.println("Unkown error");
                }
        }
        public static void promptUser(String msg){
                JOptionPane.showMessageDialog(null, msg, "Info", JOptionPane.INFORMATION_MESSAGE);
        }
        
        


}
