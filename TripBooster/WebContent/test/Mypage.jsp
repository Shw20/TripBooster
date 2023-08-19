<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<style>
</style>
<meta charset="UTF-8">
<title>회원정보</title>
</head>
<div id="main_header">
<%@include file="/resources/layout/head.jsp" %>
</div>
<body>
    
    <%
        request.setCharacterEncoding("utf-8");
        String userNamee = (String) session.getAttribute("userName");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String db_Driver = "jdbc:mysql://localhost:3306/TripBooster?useSSL=false";
            String db_ID = "root";
            String db_PW = "abcd1234";
            Connection conn = DriverManager.getConnection(db_Driver, db_ID, db_PW);

            PreparedStatement pstmt = conn.prepareStatement("SELECT userNum, userId, userPw, userTel, userRegDt FROM usertbl WHERE userName = ?");
            pstmt.setString(1, userName);
            ResultSet rs = pstmt.executeQuery();
    
            if (rs.next()) {
                int userNum = rs.getInt("userNum");
                String userId = rs.getString("userId");
                String userPw = rs.getString("userPw");
                String userTel = rs.getString("userTel");
                String userRegDt = rs.getString("userRegDt");

    %>
<nav>    
		<form class="d-flex" role="Sign in">
			<input type="text" name="UserId" class="form-control" value="<%= userId %>" disabled>
			<input type="password" name="UserPw" class="form-control" value="<%=userPw%>" disabled>
			<input type="text" name="UserName" class="form-control" value="<%= userName %>" disabled>
			<input type="text" name="UserTel" class="form-control" value="<%= userTel %>" oninput="autoHyphen(this)" disabled>
			<input type="text" name="userRegDt" class="form-control" value="<%=userRegDt%>" disabled>
			
		</form>
		<form class="d-flex" role="Sign in" style="float: right;">
			<button type="button" class="btn btn-outline-warning" onclick="location.href='ChangeForm.jsp'">회원정보 변경</button>
        	<button type="button" class="btn btn-outline-danger" onclick="location.href='DeleteForm.jsp'">회원탈퇴</button>
		</form> 
    
        
	 
</nav>
    <%
        rs.close();
        pstmt.close();
        conn.close();
    } else {
    %>
    <h2>회원 정보 조회</h2>
    <script type="text/javascript">
    alert('로그인을 해주세요')
    location.href='LoginForm.jsp';</script>");
    <% } %>
    <%
    }catch (Exception e) {
        out.println("오류가 발생했습니다: " + e.getMessage());
        e.printStackTrace();
   	 }
     %>
     
    </script>
</body>
</html>
