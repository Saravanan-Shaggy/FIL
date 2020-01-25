import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class Register extends HttpServlet{
	protected void service(HttpServletRequest request, HttpServletResponse   response) throws ServletException, IOException {
        doPost(request, response);
	}
	
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		response.setContentType("text/html");
			PrintWriter out=response.getWriter();
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/food","root","root");

			String uname = request.getParameter("name");
			String fname = request.getParameter("firstname");
			String lname = request.getParameter("lastname");
			String gender = request.getParameter("gender");
			String psw = request.getParameter("password");
					PreparedStatement pst = con.prepareStatement("insert into users values(?,?,?,?,?)");
					pst.setString(1,fname);
					pst.setString(2,lname);
					pst.setString(3,gender);
					pst.setString(4,uname);
					pst.setString(5,psw);
					int i = pst.executeUpdate();
					if(i!=0){
						RequestDispatcher rd = request.getRequestDispatcher("Login.html");
						rd.forward(request,response);
						return;
					}
					else{
						out.print("No user found");}
					
		}catch(Exception e){
			out.print(e);
		}
		out.close();
	}
}