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
<title>The Sharing</title>
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


<div class ="main_Wrap">
	<ul class="main-tab">
		<li class="main-tab_Li">
			<a href="renderForm.jsp" class="main-tab_TabItem">Borrow</a>
			
		</li>
		<li class="main-tab_Li">
			<a href="mypage.jsp" class="main-tab_TabItem">My Page</a>
			
		</li>
		<li class="main-tab_Li">
			<FORM name='mode'>
				<input id="night_day" type="button" value="night" onclick="nightDayHandler(this);">
				
			</FORM>
	</ul>
</div>

	<%
		ServletContext scontext = getServletContext();
		String uploadPath=request.getRealPath("uploadImage");

		int size = 10*1024*1024;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest=new MultipartRequest(request,uploadPath,size,encoding, new DefaultFileRenamePolicy());
		
		String num = multipartRequest.getParameter("num");
		String price = multipartRequest.getParameter("price");
		String deliveryYN = multipartRequest.getParameter("deliveryYN");
		String userid = session.getAttribute("id").toString();
		
		new fileDAO().uploadBorrow(num,userid, price, deliveryYN);
		out.write("<table class=upload>");
		out.write("<tr><th>");
		out.write("번호 </th>");
		out.write("<td>" + num + "</td></tr>");
		
		out.write("<tr><th>");
		out.write("글쓴이 </th>");
		out.write("<td>" + userid + "</td></tr>");
		
		out.write("<tr><th>");
		out.write("가격 </th>");
		out.write("<td>" + price + "</td></tr>");
		
		out.write("<tr><th>");
		out.write("배달 </th>");
		out.write("<td>" + deliveryYN + "</td></tr>");

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