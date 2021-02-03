<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection conn;
	Statement stmt;
	ResultSet rs = null;

	String SQL = "SELECT fileRealName FROM FILE";
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false", "root", "9037");
		stmt = conn.createStatement();

		rs = stmt.executeQuery(SQL);

		while (rs.next()){
			out.println("<img src='./uploadImage/"+(rs.getString(1))+"'><br>");
		}
	} catch(Exception e) {
		e.printStackTrace();
	}

%>
</body>
</html>