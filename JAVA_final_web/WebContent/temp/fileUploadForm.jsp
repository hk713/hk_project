<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="fileUpload.jsp" method="post" enctype="multipart/form-data">
	<table align="center" border="1">
		<tr>
			<td colspan="2"> 파일 업로드 폼</td>
		</tr>
		<tr>
			<td>아이디 : </td>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td>제목:</td>
			<td><input type = "text" name="subject"></td>
		</tr>
		<tr>
			<td>물건 사진:</td>
			<td><input type="file" name="filename"></td>
		</tr>
		<tr>
			<td>가격:</td>
			<td><input type="text" name="price"></td>
		</tr>
		<tr>
			<td>물건 설명:</td>
			<td><input type="text" name="contents"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="글 등록"></td>
		</tr>
	</table>
  </form>
 </body>
</html>
