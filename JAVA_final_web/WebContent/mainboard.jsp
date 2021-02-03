<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css" >
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gaegu:wght@400;700&family=Jua&family=Noto+Serif+KR:wght@900&display=swap" rel="stylesheet">
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

<div class ="header_HeaderWrapper">
	<h1 class="main_name">
		 THE SHARING 
	</h1>
</div>

<div class ="main_Wrap">
<%
	if(session.getAttribute("id")==null){
		out.println("<h1>로그인이 필요합니다</h1>");
		out.println("<a href='login.html'>로그인</a>");
		out.println("<td><a href='JoinForm.html'>회원가입</a></td>");
	}else{
		%>
		<form id="hi" method="post" action="logout.jsp">	
			<%=session.getAttribute("id") %>님 환영합니다!
			<button id="logout">로그아웃</button>
		</form>
	 <% 
	}
%>

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