<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<nav>
<div id="content">
	<form action="JoinAction.jsp" name="JoinForm" method="post">
		<input type="text" name="UserId" class="form-control" placeholder="아이디 입력">
		<input type="password" name="UserPw" class="form-control" placeholder="비밀번호 입력">
		<input type="text" name="UserName" class="form-control" placeholder="이름 입력">
		<input type="text" name="UserTel" class="form-control" placeholder="전화번호 입력" oninput="autoHyphen(this)">
		<input type="submit" class="btn btn-primary btn-xs" value="회원가입" onclick="checkform()">
		<input type="reset" class="btn btn-primary btn-xs">
	</form>
</div>
</nav>
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