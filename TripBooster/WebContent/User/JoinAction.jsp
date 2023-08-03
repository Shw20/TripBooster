<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<%
	request.setCharacterEncoding("UTF-8"); 
	String uId = request.getParameter("UserId");
	String uPw = request.getParameter("UserPw");
	String uName = request.getParameter("UserName");
	String uTel = request.getParameter("UserTel");
	String name = "";
	
	String db_Driver = "jdbc:mysql://localhost:3306/TripBooster?useSSL=false";
	String db_ID = "root";
	String db_PW = "abcd1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		
		Class.forName("com.mysql.jdbc.Driver");
		
		conn = DriverManager.getConnection(db_Driver, db_ID, db_PW);
		pstmt = conn.prepareStatement("INSERT INTO usertbl(userId, userPw, userName, userTel) VALUES(?, ?, ?, ?)");
		pstmt.setString(1, uId);
		pstmt.setString(2, uPw);
		pstmt.setString(3, uName);
		pstmt.setString(4, uTel);
		
		int result = pstmt.executeUpdate();
		
		if(result == 1){
			session.setAttribute("userName", name);
			out.println("<script>alert('회원가입 성공');</script>");
			out.println("<script>location.href='LoginForm.jsp';</script>");
		} else {
			out.println("<script>alert('회원정보를 다시 입력해주세요');</script>");
			out.println("<script>location.href='JoinForm.jsp';</script>");
		}
	} catch(Exception e){
		e.printStackTrace();
	}
%>