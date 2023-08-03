<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("UserId");
	String pw = request.getParameter("UserPw");
	
	
	String db_Driver = "jdbc:mysql://localhost:3306/TripBooster?useSSL=false";
	String db_ID = "root";
	String db_PW = "abcd1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		
		Class.forName("com.mysql.jdbc.Driver");
		
		conn = DriverManager.getConnection(db_Driver, db_ID, db_PW);
		pstmt = conn.prepareStatement("SELECT userNum, userId,userPw,userName FROM usertbl WHERE userId = ? AND userPw = ?");
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		rs = pstmt.executeQuery();
		
		
		if(rs.next()){
			String dbId = rs.getString(2);
			String dbPw = rs.getString(3);
			if(pw.equals(dbPw)){
				int userNum = rs.getInt("userNum");
		        String userName = rs.getString("userName");
		        //HttpSession session = request.getSession();
		        session.setAttribute("userId", id);
		        session.setAttribute("userName", userName);
		        session.setAttribute("userNum", userNum);
		        
				out.println("<script>alert('로그인 성공');</script>");
				out.println("<script>location.href='../index.jsp';</script>");
				
				}else{
					out.print("<script>alert('다시 입력');</script>");
					out.println("<script>location.href='LoginForm.jsp';</script>");
				}
		} else{
			out.print("<script>alert('다시 입력');</script>");
			out.println("<script>location.href='LoginForm.jsp';</script>");
		}
	} catch(Exception e){
		e.printStackTrace();
	}
	
%>