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
                Connection con;ResultSet rs;
                try{
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/satyam","root","Loknath@2534");

                        PrintWriter out=response.getWriter();
                        response.setContentType("text/html");

                        String state=request.getParameter("state");
                        String profession=request.getParameter("Profession");
                        out.println("<html><head><title>Data Table</title>");
                        out.println("<style>\r\n" + //
                                                                "    \r\n" + //
                                                                "    table {\r\n" + //
                                                                "        border-collapse: collapse;\r\n" + //
                                                                "        width: 50%;\r\n" + //
                                                                "        margin: 20px auto;\r\n" + //
                                                                "    }\r\n" + //
                                                                "    th, td {\r\n" + //
                                                                "        border: 1px solid #ddd;\r\n" + //
                                                                "        padding: 8px;\r\n" + //
                                                                "    }\r\n" + //
                                                                "    th {\r\n" + //
                                                                "        background-color: #f2f2f2;\r\n" + //
                                                                "    }\r\n" + //
                                                                "    h3 {\r\n" + //
                                                                "        text-align: center;\r\n" + //
                                                                "    }\r\n" + //
                                                                "\r\n" + //
                                                                "    /* Button Styles */\r\n" + //
                                                                "    .btn {\r\n" + //
                                                                "        background-color: #007bff;\r\n" + //
                                                                "        color: white;\r\n" + //
                                                                "        border: none;\r\n" + //
                                                                "        padding: 5px 10px;\r\n" + //
                                                                "        cursor: pointer;\r\n" + //
                                                                "    }\r\n" + //
                                                                "    .btn:hover {\r\n" + //
                                                                "        background-color: #0056b3;\r\n" + //
                                                                "    }\r\n" + //
                                                                "</style>\r\n" + //
                                                                "");
                        out.println("</head><body>");
                        out.println("<table border='1' cellpadding='5' cellspacing='0'>");
                        out.println("<tr><th>Name</th><th>State</th><th>Profession</th><th>More details</th></tr>");
                      
                        try{    
                                PreparedStatement s=con.prepareStatement("select * from users where state=?;");
                                s.setString(1, state);

                                PreparedStatement p=con.prepareStatement("select * from users where profession=?;");
                                p.setString(1, profession);

                                PreparedStatement both=con.prepareStatement("select * from users where state=? and profession=?;");
                                both.setString(1, state);
                                both.setString(2, profession);

                                PreparedStatement noFilter=con.prepareStatement("select * from users;");

                                if(state.equals("Select a State") && !(profession.equals("Select a Profession"))){
                                        rs=p.executeQuery();
                                }
                                else if(profession.equals("Select a Profession") && !(state.equals("Select a State"))){
                                        rs=s.executeQuery();
                                }
                                else if(!(state.equals("Select a State")) && !(profession.equals("Select a Profession"))){
                                        rs=both.executeQuery();
                                }
                                else{
                                        rs=noFilter.executeQuery();
                                }
                                if(rs.next()){
                                        do {
                                                String name = rs.getString("name");
                                                String country = rs.getString("country");
                                                String dob = rs.getString("dob");
                                                String prof = rs.getString("profession");
                                                String email = rs.getString("email");
                                                String stat = rs.getString("state");
                                                String phno = rs.getString("phno");
                        
                                                out.println("<tr>");
                                                out.println("<td>" + name + "</td>");
                                                out.println("<td>" + stat + "</td>");
                                                out.println("<td>" + prof + "</td>");
                                                out.println("<td>");
                                                out.println("<form action='submit.jsp' method='POST'>");
                                                out.println("<input type='hidden' name='name' value='" + name + "'>");
                                                out.println("<input type='hidden' name='country' value='" + country + "'>");
                                                out.println("<input type='hidden' name='dob' value='" + dob + "'>");
                                                out.println("<input type='hidden' name='profession' value='" + prof + "'>");
                                                out.println("<input type='hidden' name='email' value='" + email + "'>");
                                                out.println("<input type='hidden' name='state' value='" + stat + "'>");
                                                out.println("<input type='hidden' name='phno' value='" + phno+ "'>");
                                                out.println("<button type='submit' class='btn'>View User</button>");
                                                out.println("</form>");
                                                out.println("</td>");
                                                out.println("</tr>");

                                        } while (rs.next());
                                        rs.close();
                                
                                }else{
                                        out.println("<h3>No users found</h3>");
                                }
                                
                        }catch(SQLException e){
                                redirectUser(response,"Error fetching data from database...wish to submit again?","arts.jsp");
                        }
                        out.println("</table></body></html>");

                }catch (Exception e){
                	redirectUser(response,"An unknown error occured...confirm resubmission?","arts.jsp");
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