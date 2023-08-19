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
<style>
        #content{
            width: 960px; margin: 0 auto;
            margin-bottom: 10px;
            box-sizing: border-box;
            padding: 10px;
            text-align: center;
        }
        #main_header{ 
            width: 960px;  
            margin: 0 auto; 
            height: 100px;
            position: relative;
        }
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<div id="main_header">
<%@include file="/resources/layout/head.jsp" %>
</div>
<body>
	<%
		String userNamee = (String) session.getAttribute("userName");
        request.setCharacterEncoding("utf-8");

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
<div id="content">
	<form action="ChangeAction.jsp" name="JoinForm" method="post">
		<input type="text" name="UserId" class="form-control" value="<%= userId %>">
		<input type="password" name="UserPw" class="form-control" placeholder="비밀번호 입력">
		<input type="text" name="UserName" class="form-control" value="<%= userName %>">
		<input type="text" name="UserTel" class="form-control" value="<%= userTel %>" oninput="autoHyphen(this)">
		<input type="submit" class="btn btn-primary btn-xs" value="변경하기" onclick="checkform()">
		<input type="reset" class="btn btn-primary btn-xs">
	</form>
</div>
</nav>
	<%
	        rs.close();
	        pstmt.close();
	        conn.close();
	    } 
    }catch (Exception e) {
        out.println("오류가 발생했습니다: " + e.getMessage());
        e.printStackTrace();
   	 }
     %>
<script type="text/javascript">
	function checkform(){
		
		var Id = document.JoinForm.UserId;
		var Pw = document.JoinForm.UserPw;
		var Nm = document.JoinForm.UserName;
		var Te = document.JoinForm.UserTel;
			
		if(Id.value == ""){
			alert("아이디를 입력해주세요");
			Id.focus();
			return false;
		} else if(Pw.value == ""){
			alert("비밀번호를 입력해주세요");
			Pw.focus();
			return false;
		} else if(Nm.value == ""){
			alert("이름을 입력해주세요");
			Nm.focus();
			return false;
		} else if(Te.value == ""){
			alert("전화번호를 입력해주세요");
			Te.focus();
			return false;
		}
			document.JoinForm.submit();
		}
		const autoHyphen = (target) => {
		 target.value = target.value
		   .replace(/[^0-9]/g, '')
		  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	}
</script>
</body>
</html>