package org.MySQL_code;

import java.sql.*;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginOk
 */
@WebServlet("/LoginOk")
public class LoginOk extends HttpServlet {
	
	Connection conn = null;
	Statement statement = null;
	ResultSet resultSet = null;
	String orgin_id;
	String orgin_passwd;
	String orgin_name;
	String orgin_phone;
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginOk() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		String post_id = request.getParameter("id");
		String post_passwd = request.getParameter("passwd");
		
		//db
				String query = "select * from member_info where id='"+post_id+"' and passwd='"+post_passwd+"'";
				boolean login_b = false;
				
				try {
					Class.forName("org.MySQL_code.Driver");
					conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false","root","9037");
					statement = conn.createStatement();
					resultSet = statement.executeQuery(query);
					
					while(resultSet.next()) {
						orgin_id = resultSet.getString("id");
						orgin_passwd = resultSet.getString("passwd");
						orgin_name = resultSet.getString("name");
						orgin_phone = resultSet.getString("phone");
						login_b = true;	
					}
					if(login_b) {
						System.out.println("로그인 성공 하셨습니다!");
						HttpSession httpSession = request.getSession();
						httpSession.setAttribute("name", orgin_name);
						httpSession.setAttribute("id", orgin_id);
						httpSession.setAttribute("passwd", orgin_passwd);
						httpSession.setAttribute("phone", orgin_phone);
						
						response.sendRedirect("loginResult.jsp");
					}else {
						System.out.println("아이디 또는 비밀번호가 다릅니다");
						response.sendRedirect("login.html");
					}
				}catch(SQLException e) {
					e.getStackTrace();
				}catch(ClassNotFoundException e) {
					e.printStackTrace();
				}finally {
					try {
						if(conn != null) conn.close();
						if(statement != null) statement.close();
						if(resultSet != null) resultSet.close();
					}catch(Exception e) {
						e.getStackTrace();
					}
				}
	      }
   }