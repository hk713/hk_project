<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Sharing</title>
<link rel="stylesheet" href="join_style.css" >
</head>
<body>

	<form action="Joinfile.jsp" method="post" class="joinForm">
		<h2>Join</h2>
		<div class="nameForm">
			<input type="text" class="name" name="name" placeholder="NAME">
		</div>
		<div class="idForm">
       	  	<input type="text" class="id" placeholder="ID" name="id">
        </div>
        <div class="passForm">
        	<input type="password" class="pw" placeholder="PW" name="passwd">
        </div>
        <div class="phoneForm">
			<input type="text" class="num" name="num" placeholder="PHONE">
		</div>
		<div class="addressForm">
			<input type="text" class="address" name="address" placeholder="ADDRESS">
		</div>
		
		<div class="loginbutton">
      		<button  class="btn" > SIGN UP	</button>
        </div>
        <div class="bottomText">
        Already have an account? <a href="real_login.jsp">Sign-In</a>
        </div>
      	<input id="night_day" type="button" value="night" onclick="nightDayHandler(this);">
	
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