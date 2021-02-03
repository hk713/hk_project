<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*" %>

<html>
<head>
<meta charset="UTF-8">
<title>회원가입_60180874김하경</title>
<link rel="stylesheet" href="style.css" >
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql="";
		int updateCount=0;
	
		String name = request.getParameter("member_name");
		String school_num = request.getParameter("school_num");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String email_h = request.getParameter("email_h");
	    String email_t = request.getParameter("email_t");
	    String email_tt = request.getParameter("mail");
	    String mobile = request.getParameter("mobile");
	    String mobile_h = request.getParameter("mobile_h");
	    String mobile_t = request.getParameter("mobile_t");
	    String phone = request.getParameter("phone");
	    String phone_h = request.getParameter("phone_h");
	    String phone_t = request.getParameter("phone_t");
	    String home_number = request.getParameter("home_number");
	    String home = request.getParameter("home_h");
	    String news = request.getParameter("news");
	    
	    sql = "INSERT INTO membership (name,id,password,home) values(?,?,?,?)";
	    
	    System.out.println(sql);
	    try{
	    			
	    	Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false","root","9037");	
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1,name);
			pstmt.setString(2,id);
			pstmt.setString(3,password);
			pstmt.setString(4,home);
			
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
	%>	
	회원가입 성공! 
	membership 테이블에 저장됨!	

</body>
</html>