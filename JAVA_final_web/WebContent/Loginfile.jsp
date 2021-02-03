<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		Connection con = null;
		Statement stmt = null;
		String id = null;
		String passwd = null;
		
		String userid = request.getParameter("loginid");
		String userpw = request.getParameter("loginpw");
		
		if (request.getMethod().equals("POST")){
			try{
				
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false","root","9037");	
				
				stmt = con.createStatement();
				
				ResultSet rs = stmt.executeQuery("select id,passwd from member_info");
				
				//DB에 회원 레코드가 없는 경우
				if(!rs.next()){
					out.print("<script>");
					out.print("alert('회원정보가 없습니다.');");
					out.print("</script>");
					
					stmt.close();
					rs.close();
				}else{
					try{
						id = rs.getString("id"); //DB에서 회원 아이디 가져와서 저장
						passwd = rs.getString("passwd"); //DB에서 회원 패스워드 가져와서 저장
						//DB에 저장된 아이디와 패스워드를 입력한 아이디와 비밀번호를 비교한다
						// 아이디와 비밀번호가 맞지 않는 경우
						if(id.compareTo(userid)!=0 || passwd.compareTo(userpw)!=0){
							out.print("<script>");
							out.print("alert('ID 또는 Password를 잘못 입력하였습니다.');");
							out.print("location.href='real_login.jsp';");
							out.print("</script>");
						}else{ //아이디와 비밀번호가 일치하는 경우
							out.print("<script>");
							out.print("alert('ID와 Password가 일치합니다');");
							out.print("</script>");
							rs.close();
							stmt.close();
							con.close();
							session.setAttribute("id",id);
							response.sendRedirect("showRenderLists.jsp");
						/* 	out.print("<meta http-equiv='refresh' content='1?url=showRenderLists.jsp?userid='"+id+">");
						 */
						}
						rs.close();
						stmt.close();
						con.close();
					}catch(Exception e){
						System.out.println(e);
					}
				}
			}catch(Exception e){
				System.out.println(e);
			}
		}
	%>

</body>
</html>