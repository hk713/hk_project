<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*" %>

<html>
<head>
<meta charset="UTF-8">
<title>60180874 김하경</title>
<link rel="stylesheet" href="style.css" >
</head>
<body>

	<br><h1>check</h1><br>
	
	<table width="600" boder =""  bgcolor="#f8f2ec" cellspacing="1">
		<tr>
			<td> <b>이름</b> </td>
			<td> <b>아이디</b> </td>
			<td> <b>비번</b> </td>
			<td> <b>주소</b> </td>
		</tr>
	<%
	
	response.setContentType("text/html;charset=UTF-8");
	request.setCharacterEncoding("UTF-8");
	
	Connection con;
	Statement stmt;
	ResultSet rs = null;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false","root","9037");
		
		stmt = con.createStatement();
		String sql = "select * from membership";
		rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			do{
				String name = rs.getString("name");
				String id = rs.getString("id");
				String password = rs.getString("password");
				String home = rs.getString("home");
		%>
		
			<tr>
				<td><%=name %></td>
				<td><%=id %></td>
				<td><%=password %></td>
				<td><%=home %></td>
			</tr>
	
	<% 
			}while(rs.next());
		}else{
			out.print("결과가 없습니다.");
		}
		con.close();
	}catch (SQLException e){
		out.print(e);
	}catch (Exception e){
		out.print(e);
	}
	%>
	
 </table>
	
</body>
</html>