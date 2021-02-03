<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*" %>

<html>
<head>
<meta charset="UTF-8">
<title>The Sharing</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql="";
		int updateCount=0;
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String num = request.getParameter("num");

		String address = request.getParameter("address");
	
		
		System.out.println(num);
		
		sql = "INSERT INTO member_info (ID,NAME,PASSWD,PHONE,ADDRESS) values(?,?,?,?,?)";

		System.out.println(sql);
	
		try{
			
	    	Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false","root","9037");	
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1,id);
			pstmt.setString(2,name);
			pstmt.setString(3,passwd);
			pstmt.setString(4,num);
			pstmt.setString(5,address);
			
			updateCount = pstmt.executeUpdate();
			
			if(updateCount != 0){
				System.out.println("회원가입 성공");
			}else{
				System.out.println("회원가입 실패");
			}
	    }catch(Exception e){
	    	System.out.println("연결에 실패하였습니다.");
	    }finally{
	    	try{
	    		pstmt.close();
	    		con.close();
	    	}catch(Exception e){
	    		e.printStackTrace();
	    	}
	    } 
		
		response.sendRedirect("real_login.jsp");
	%>	
	회원가입 성공! 
	
</body>
</html>
	