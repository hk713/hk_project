<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*" %>

<html>
<head>
</head>
<body>
	<%
	Connection con;
	Statement stmt;
	ResultSet rs = null;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false","root","9037");
		
		stmt = con.createStatement();
		String sql = "select * from member";
		rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			do{
				out.print("<br>");
				out.print(rs.getString("id")+" ");
				out.print(rs.getString("name")+" ");
				out.print(rs.getString("passwd"));
			}while(rs.next());
		}else{
			out.print("결과가 없습니다.");
		}
		
		con.close();
	} catch (SQLException e1) {
		out.print(e1);
	} catch (Exception e){
		out.print(e);
	}
	
	%>
</body>
</html>