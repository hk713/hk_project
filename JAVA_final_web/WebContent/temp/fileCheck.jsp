<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
request.setCharacterEncoding("euc-kr");
String name = request.getParameter("name");
String subject = request.getParameter("subject");
String filename = request.getParameter("filename");
String price = request.getParameter("price");
String contents = request.getParameter("contents");
%>
<body>
올린사람 : <%=name %><br/>
제목 : <%=subject %><br/>
파일명 : <a href ="upload/<%=filename%>"><%=filename %></a><br/>
가격 : <%=price %><br/>
내용 : <%=contents %><br/>
</body>
</html>