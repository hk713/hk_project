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
<link rel="preconnect" href
="https://fonts.gstatic.com">
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
		쉐어 물품 등록
	</h1>
</div>
<div class="borrow_night">
	<input id="night_day_b" type="button" value="night" onclick="nightDayHandler(this);">
</div>	
	<br>
	<br>

	<form action="uploadAction.jsp"  method="post" enctype="multipart/form-data">
	<table class="borrow">
          <tr>
              <th>주소  </th>
              <td><input type="text" name="address"/></td>
          </tr>
          <tr>
              <th>물품 </th>
              <td><input type="text" name="title"/></td>
          </tr>
          <tr>
              <th>사진  </th>
              <td> <input type="file" name="file"></td>
          </tr>
          <tr>
              <th>가격 </th>
              <td><input type="text" name="price"/></td>
          </tr>
          <tr>
              <th>내용 </th>
              <td>
              	<textarea id="wr_content" name="wr_content" class="" maxlength="65536" style="width:100%;height:300px" placeholder="상세 내용">
				</textarea>
              </td>
          </tr>   
    </table>
    <br>
    <div class="b_accept">
    <button id="borrowbutton">registration</button>
    </div>
    <br><br>
      
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