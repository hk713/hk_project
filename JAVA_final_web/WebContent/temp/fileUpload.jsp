<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%
	String uploadPath=request.getRealPath("upload");
	int size = 10*1024*1024;
	String name="";
	String subject="";
	String filename="";
	String price="";
	String contents="";

try{
	MultipartRequest multi=new MultipartRequest(request,uploadPath,size,"utf-8", new DefaultFileRenamePolicy());
	
	name = multi.getParameter("name");
	subject=multi.getParameter("subject");
	price=multi.getParameter("price");
	contents=multi.getParameter("contents");
	
	Enumeration files = multi.getFileNames();
	String file = (String)files.nextElement();
	filename = multi.getFilesystemName(file);
}catch (Exception e){
	e.getStackTrace();
}
%>
<body>

<form name="filecheck" action = "fileCheck.jsp" method="post">
	<input type = "hidden" name="name" value="<%=name %>">
	<input type="hidden" name="subjet" value="<%=subject %>">
	<input type="hidden" name="filename" value=<%=filename %>">
	<input type ="hidden" name= "price" value=<%=price %>">
	<input type="hidden" name = "contents" value=<%=contents %>">
	
	</form>
	<a href = "#" onclick="javascript:filechect.submit()"><input type="submit" value="업로드 확인 및 다운로드 페이지 이동"></a>
	</body>
</html>