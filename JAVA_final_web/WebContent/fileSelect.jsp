<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Sharing</title>
</head>
<body>
	<form action="uploadAction.jsp" method="post" enctype="multipart/form-data">
	<table>
		  <tr>
              <td>ID : </td>
              <td><input type="text" name="userid"/></td>
          </tr>
          <tr>
              <td>주소 : </td>
              <td><input type="text" name="address"/></td>
          </tr>
          <tr>
              <td>제목 : </td>
              <td><input type="text" name="title"/></td>
          </tr>
          <tr>
              <td>사진 : </td>
              <td> <input type="file" name="file"></td>
          </tr>
          <tr>
              <td>가격 : </td>
              <td><input type="text" name="price"/></td>
          </tr>
          <tr>
              <td>내용 : </td>
              <td>
              	<textarea id="wr_content" name="wr_content" class="" maxlength="65536" style="width:100%;height:300px" placeholder="상세 내용">
				</textarea>
              </td>
          </tr>
          <tr>
              <td colspan="2"><input type="submit" value="업로드"/></td>
          </tr>
    </table>
	</form>				
</body>
</html>