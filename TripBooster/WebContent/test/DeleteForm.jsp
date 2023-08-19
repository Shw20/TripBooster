<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<style>
        #content{
            width: 960px; margin: 0 auto;
            margin-top: 50px;
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
        h1{
        	margin-bottom: 100px;
        	text-align: center;
        }
</style>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<div id="main_header">
<%@include file="/resources/layout/head.jsp" %>
</div>
<body class="text-center">
    <h1>회원 탈퇴</h1>
    <div id="content">
    
	    <div class="input-form-box">
		    <form action="DeleteAction.jsp" name="form" method="post">
		        <label for="userPw">비밀번호:</label>
		        <input type="password" name="userPw" class="form-control" required>
		        <input type="submit" class="btn btn-outline-danger" value="탈퇴하기">
		    </form>
		</div>
	</div>
</body>
<%@include file="/resources/layout/footer.jsp" %>
</html>
