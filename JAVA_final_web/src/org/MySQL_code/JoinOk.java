package org.MySQL_code;

import java.sql.*;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JoinOk
 */
@WebServlet("/JoinOk")
public class JoinOk extends HttpServlet {
	
	//db connect
	Connection conn = null;
	Statement statement;
	ResultSet resultSet;
	
	String post_name;
	String post_id;
	String post_passwd;
	String post_num1;
	String post_num2;
	String post_num3;
	String post_address;
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinOk() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		request.setCharacterEncoding("UTF-8");
		System.out.println("doPost");
		
		//request info
		post_name = request.getParameter("name");
		post_id = request.getParameter("id");
		post_passwd = request.getParameter("passwd");
		post_num1 = request.getParameter("num1");
		post_num2 = request.getParameter("num2");
	    post_num3 = request.getParameter("num3");
	    post_address = request.getParameter("address");
	    
	    //db
	    String query_select = "select * from member_info";
	    String query_insert = "insert into member_info(id,name,passwd,phone,address) values('"+ post_id +"','"+post_name+"','"+post_passwd+"','"+post_num1+"-"+post_num2+"-"+post_num3+"','"+post_address+"')";

	    try {
	    	System.out.println("try 시작");
	    	Class.forName("com.mysql.jdbc.Driver");
	    	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false","root","9037");
	    	statement = conn.createStatement();
	    	resultSet = statement.executeQuery(query_select);
	    	boolean id_exist = true;
	    	
	    	//db비교
	    	while(resultSet.next()){
	    		String orgin_id = resultSet.getString("id");
	    		
	    		//아이디 비교
	    		if(orgin_id.equals(post_id)){
	    			//비밀번호 비교
	    			id_exist = false;
	    		}
	    	}
	    	
	    	//만약 아이디가 없다면
	    	if(id_exist){
	    		//아이디 추가
	    		resultSet = statement.executeQuery(query_insert);
	    		System.out.println("가입완료!");
	    		
	    		//가입완료후 페이지
	    		response.sendRedirect("joinResult.jsp");
	    	}else {
	    		System.out.println("가입 실패!");
	    		response.sendRedirect("join.html");
	    	}
	    		    	
	    }catch(SQLException e) {
	    	e.printStackTrace();
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