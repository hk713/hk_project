<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style_first.css">
<title>The Sharing</title>
</head>
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
      alist[i].style.color='blue';
      i=i+1;
      }
    }
  }
    //야간모드


</script>
<body>
  <br>
	<h1><marquee behavior="scroll"scrollamount="8">The Sharing</marquee></h1>
  <div id="login">
				<a href="real_login.jsp" class="login">▶Login◀</a>
</div>
	<p>
		1인 가구를 위한 물건 셰어링 및 배송 사이트<br> <strong>"<u>The Sharing</u>"
		</strong>에 방문하신 것을 환영합니다!
	</p>
<p>	저희 웹 사이트에서 필요한 물건을 대여하시고,<br>필요 없는 물건을 빌려주고 돈도 벌어보세요! :)</p>
	<div id="image">
		<img
			src="https://images.unsplash.com/photo-1574634534894-89d7576c8259?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8NXx8c2hvcHBpbmd8ZW58MHx8MHw%3D&auto=format&fit=crop&w=500&q=60"
			width="50%">
	</div>
  <input id="night_day" type="button" value="night"
    onclick="nightDayHandler(this);">
</body>
</html>