<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

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
<%
	String num = request.getParameter("num");
%>
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

	<form action="uploadApplyAction.jsp" class="r_form" method="post" enctype="multipart/form-data">
		<table class=rental>
		  <tr>
              <th>번호 </th>
              <td><input type="text" name="num" value = "<%=num %>"/></td>
          </tr>
          <tr>
              <th>가격 </th>
              <td><input type="text" name="price"/></td>
          </tr>
          <tr>
			  <th>배달을 요청하시겠습니까?</th>
              <td>
				<input type = "checkbox" name = "deliveryYN">
              </td>
          </tr>
    
        </table>  
        <BR>
        <button id="r_upload">request</button>
	</form>
	
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
        alist[i].style.color='#f8eae2';
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