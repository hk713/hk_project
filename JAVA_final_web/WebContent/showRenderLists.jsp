<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<div class="hello">
<%
	if(session.getAttribute("id")==null){
		
		out.print("<script>");
		out.print("alert('로그인이 필요합니다!');");
		out.print("location.href='real_login.jsp';");
		out.print("</script>");
				
	}else{
		%>
		<form id="hi" method="post" action="logout.jsp">	
			<%=session.getAttribute("id") %>님 환영합니다!
			<button id="logout">로그아웃</button>
		</form>
	 <% 
	}
%>
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

<div class= "content">
<%@ page import="java.sql.*"%>
<table>
<tr>
	<th>번호</th>
	<th>물품</th>
	<th>날짜</th>
	<th>글쓴이</th>
	<th>가격</th>
	<th>주소</th>
	<th>사진</th>
</tr>
<%
	Connection conn;
	Statement stmt;
	ResultSet rs = null;
	
	String SQL = "SELECT * FROM RENDER";
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false", "root", "9037");
		stmt = conn.createStatement();

		rs = stmt.executeQuery(SQL);

		while (rs.next()){
			//out.println("<img src='./uploadImage/"+(rs.getString(1))+"'><br>");
		%>
		<tr>
			<td><%= rs.getInt("num") %></td>
			<% out.println("<td><a href='showDetail.jsp?num="+ rs.getInt("num")+"'>"+ rs.getString("title")+"</a></td>"); %>
			<td><%= rs.getString("rend_date") %></td>
			<td><%= rs.getString("id") %></td>
			<td><%= rs.getString("price") %></td>
			<td><%= rs.getString("address") %></td>
			<% out.println("<td><img width='300' src='./uploadImage/"+(rs.getString("fileRealName"))+"'></td>"); %>
			<!-- <td><form action="showDetail.jsp" method="post" enctype="multipart/form-data">
					<input type="submit" value="내용보기"/>
				</form>
			</td> -->
			
		</tr>
		
		<%
		}
	} catch(Exception e) {
		e.printStackTrace();
	}

%>
</table>

</div>

</body>
</html>