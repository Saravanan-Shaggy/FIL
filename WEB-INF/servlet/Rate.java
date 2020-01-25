import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class Rate extends HttpServlet{
	protected void service(HttpServletRequest request, HttpServletResponse   response) throws ServletException, IOException {
        doPost(request, response);
	}
	
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		response.setContentType("text/html");
			PrintWriter out=response.getWriter();
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/food","root","root");
			String rate = request.getParameter("rate");
			String name = request.getParameter("name");
					PreparedStatement pst = con.prepareStatement("update restaurants set rating = ? where name = ?");
					pst.setString(1,rate);
					pst.setString(2,name);
					int i = pst.executeUpdate();
					if(i!=0){
						RequestDispatcher rd = request.getRequestDispatcher("List.jsp?done=true");
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