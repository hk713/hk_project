<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Sharing</title>
<link rel="stylesheet" href="login_style.css" >
</head>

<body>
    <form action="Loginfile.jsp" method="post" class="loginForm" >
      <h2>Login</h2>
      <div class="idForm">
        <input type="text" class="id" placeholder="ID" name="loginid">
      </div>
      <div class="passForm">
        <input type="password" class="pw" placeholder="PW" name="loginpw">
      </div>
     <div class="loginbutton">
      <button  class="btn" >
        LOG IN
      </button>
      </div>
      <div class="bottomText">
        New to The Sharing? <a href="real_join.jsp">Sign-Up</a>
      </div>
      <br>
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
