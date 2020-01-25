import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class Login extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/food","root","root");

			String uname = request.getParameter("name");
			String psw = request.getParameter("password");
			HttpSession session=request.getSession(true);
			
			PreparedStatement stmt = con.prepareStatement("select username,password from users where username = ? and password = ?");
			stmt.setString(1,uname);
			stmt.setString(2,psw);
			ResultSet rs = stmt.executeQuery();

			String j = request.getParameter("name");
			request.setAttribute("user",j);

				if(rs.next()){
					RequestDispatcher rd = request.getRequestDispatcher("index.html");
					rd.forward(request,response);
					return;
				}
				else{
					out.print("No user found");}
			
		}
		catch(Exception e){out.print(e);}
	}
}