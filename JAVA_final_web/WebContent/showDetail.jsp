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





<table class=detail>
	<%
	Connection conn;
	Statement stmt;
	ResultSet rs = null;

	String num = request.getParameter("num");
	
	String SQL = "SELECT * FROM RENDER WHERE NUM = " + num;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false", "root", "9037");
		stmt = conn.createStatement();

		rs = stmt.executeQuery(SQL);

		while (rs.next()){
		%>

		  <tr>
              <th scope="row">번호 </th>
              <td><%= rs.getInt("num") %></td>
          </tr> 
		  <tr>
              <th scope="row">글쓴이 </th>
              <td><%= rs.getString("id") %></td>
          </tr>
          <tr>
              <th scope="row">주소 </th>
			  <td><%= rs.getString("address") %></td>
          </tr>
          <tr>
              <th scope="row">물품</th>
              <td><%= rs.getString("title") %></td>
          </tr>
          <tr>
              <th scope="row">사진 </th>
              <td> <% out.println("<img width='300' src='./uploadImage/"+(rs.getString("fileRealName"))+"'>"); %></td>
          </tr>
          <tr>
              <th scope="row">가격</th>
              <td><%= rs.getString("price") %></td>
          </tr>
          <tr>
              <th scope="row">내용</th>
              <td><%= rs.getString("content") %></td>
          </tr>

	</table>
	
	<% out.println("<a id='okay' href='applyRentalForm.jsp?num="+ num +"' >apply</a>"); %>
	<form action="showRenderLists.jsp" id="golist" method="post" enctype="multipart/form-data">
	 	<button id="gomain" > 목록보기 </button>
	 	<BR>
	 	<BR>
	</form>
	
	
		<%
		}
	} catch(Exception e) {
		e.printStackTrace();
	}

%>

</body>
</html>