<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.io.File" %>
<%@ page import ="org.MySQL_code.fileDAO" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css" >
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gaegu:wght@400;700&family=Jua&family=Noto+Serif+KR:wght@900&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Anton&family=Sansita+Swashed&display=swap" rel="stylesheet">
</head>
<body>

<div class ="header_HeaderWrapper">
	<h1  class="main_name">
		<a href = "showRenderLists.jsp" class="the_sharing">
		 The Sharing 
		 </a>
	</h1>
</div>

<div class="head_borrow">
	<h1 class="borrow_title">
		등록 확인
	</h1>
</div>
<div class="borrow_night">
	<input id="night_day_b" type="button" value="night" onclick="nightDayHandler(this);">
</div>	
<br>
<br>

	<%
		ServletContext scontext = getServletContext();
		String uploadPath=request.getRealPath("uploadImage");

		
		int size = 10*1024*1024;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest=new MultipartRequest(request,uploadPath,size,encoding, new DefaultFileRenamePolicy());
		
		// 여기서부터 수행
		String title = multipartRequest.getParameter("title");
		String wr_content = multipartRequest.getParameter("wr_content");
		String fileName = multipartRequest.getOriginalFileName("file");
		String fileRealName = multipartRequest.getFilesystemName("file");
		String price = multipartRequest.getParameter("price");
		String address = multipartRequest.getParameter("address");
		//public int upload(String title , String wr_content, String fileName, String fileRealName, String userid, String price, String address) {
		String userid = session.getAttribute("id").toString();
			
		new fileDAO().upload(title, wr_content, fileName, fileRealName, userid, price, address);
		out.write("<table class=borrowcheck>");
		
		
		out.write("<tr><th>");
		out.write("물품 <th>");
		out.write("<td>"+ title +"</td></tr>");
		
		out.write("<tr><th>");
		out.write("내용 <th>");
		out.write("<td>"+ wr_content +"</td></tr>");
		
		out.write("<tr><th>");
		out.write("파일명 <th>");
		out.write("<td>"+ fileName +"</td></tr>");
		
		out.write("<tr><th>");
		out.write("실제파일명 <th>");
		out.write("<td>"+ fileRealName +"</td></tr>");
		
		out.write("<tr><th>");
		out.write("글쓴이 <th>");
		out.write("<td>"+ userid +"</td></tr>");
		
		out.write("<tr><th>");
		out.write("가격 <th>");
		out.write("<td>"+ price +"</td></tr>");
		
		out.write("<tr><th>");
		out.write("주소 <th>");
		out.write("<td>"+ address +"</td></tr>");
		
		out.write("</table>");
		
	%>
	
	<br>
	<br>
	<form action="showRenderLists.jsp" id="golist" method="post" enctype="multipart/form-data">
	 	<button id="gomain" > 목록보기 </button>
	</form>
	 <script>
function nightDayHandler(self){
    var target = document.querySelector('body')
      if(self.value==='night'){
      target.style.backgroundColor='black';
      target.style.color='white';
      self.value='day'

      var alist = document.querySelectorAll('a');
        var i=0;
        while(i<alist.length){
        alist[i].style.color='white';
        i=i+1;
        }

      } else {
      target.style.backgroundColor='white';
      target.style.color='black';
      self.value='night'

      var alist = document.querySelectorAll('a');
      var i=0;
      while(i<alist.length){
      alist[i].style.color='black';
      i=i+1;
      }
    }
  }
    //야간모드
 </script>		
	</body>
	</html>
