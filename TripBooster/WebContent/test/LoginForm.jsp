<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
</style>
<head>
<title>login</title>
</head>
<%@include file="/resources/layout/head.jsp" %>


<body class="text-center">
<%@include file="/resources/layout/nav.jsp" %>
<nav>
	<div id="content">
		<form action="LoginAction.jsp" name="Form" method="post">
			<div class="input-form-box">아이디 
				<input type="text" name="UserId" class="form-control" placeholder="아이디를 입력해주세요." ></div>
			<div class="input-form-box"><span>비밀번호 </span>
				<input type="password" name="UserPw" class="form-control" placeholder="비밀번호를 입력해주세요"></div>

			<div class="button-login-box" >
				<input type="submit" class="btn btn-primary btn-xs" value="로그인" onclick="checkform()">
				<button type="button" class="btn btn-primary btn-xs" onclick="location.href='JoinForm.jsp'">회원가입</button>
			</div>
		</form>
	</div>
</nav>
</body>

<%@include file="/resources/layout/footer.jsp" %>
<script type="text/javascript">
		function checkform(){
			var Id = document.Form.UserId;
			var Pw = document.Form.UserPw;
			
			if(Id.value == ""){
				alert("아이디를 입력해주세요");
				Id.focus();
				return false;
			} else if(Pw.value == ""){
				alert("비밀번호를 입력해주세요");
				Id.focus();
				return false;
			}
			document.Form.submit();
		}
</script>
</html>