<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>TripBooster</title>
<%@ include file="/resources/layout/head.jsp"%>
</head>
<script>
	function updateformCheck() {
        var pw = document.getElementById('userPw');
        var repwd = document.getElementById('userrePw');
        var name = document.getElementById('userName');
        var mobile = document.getElementById('userTel');

        var pwReg = /^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[@#$%^&+=!]).{5,12}$/; // 영문자와 숫자, 특수기호 5~12자리
        var nameReg = /^[가-힣]+$/; // 한글로만

        if(name.value == "") {
			alert("이름을 입력하세요!");
			name.focus();
    		return false;
    	}
        
        if (!nameReg.test(name.value)) {
            alert('이름은 한글로만 입력해주세요✈');
            return false;
        }

        if (!pwReg.test(pw.value)) {
            alert('비밀번호는 영문자와 숫자, 특수기호 \n 5~12자리로 입력해주세요✈');
            return false;
        }

        if (pw.value !== repwd.value) {
            alert('비밀번호와 비밀번호 확인이 일치하지 않습니다✈');
            return false;
        }

        document.mypageForm.submit();
    }
	 const autoHyphen = (target) => {
	        target.value = target.value
	            .replace(/[^0-9]/g, '')
	            .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	}
</script>
<body class="text-center">
<%@ include file="/resources/layout/adminNav.jsp"%>
<form action="userAction.jsp" name="userForm" method="post">
<main class="form-signin w-100 m-auto">
	<p><h1 class="h3 mb-3 fw-normal"><strong>회원 정보</strong></h1>
	<%
		try {
			Class.forName("com.mysql.jdbc.Driver");
			request.setCharacterEncoding("UTF-8");
			
			String url = "jdbc:mysql://localhost:3306/tripbooster?useSSL=false&verifyServerCertificate=false";
			String user = "root"; // 데이터베이스 사용자 이름
		   	String password = "abcd1234"; // 데이터베이스 비밀번호
		   	
			Connection con = DriverManager.getConnection(url, user, password);
			con.setAutoCommit(false);
			
			String sql = "SELECT * FROM userTbl;";
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userNum);
			
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
                String userNum = rs.getString("userNum");
                String userId = rs.getString("userId");
                String userPw = rs.getString("userPw");
                String userTel = rs.getString("userTel");
                String userRegDt = rs.getString("userRegDt");
                %>
                <form class="d-flex" role="Sign in">
					<input type="text" name="UserId" class="form-control" value="<%= userId %>" disabled>
					<input type="password" name="UserPw" class="form-control" value="<%=userPw%>" disabled>
					<input type="text" name="UserName" class="form-control" value="<%= userName %>" disabled>
					<input type="text" name="UserTel" class="form-control" value="<%= userTel %>" oninput="autoHyphen(this)" disabled>
					<input type="text" name="userRegDt" class="form-control" value="<%=userRegDt%>" disabled>
					
				</form>
				<div class="my-2">
					<input type="button" value="회원정보 수정" class="btn btn-dark" onclick="updateformCheck();">
					<input type="button" value="회원 삭제" class="btn btn-dark" onclick="location.href='deleteUser.jsp'">
				</div>
		
         <%  }else{
         
         }
			
			con.commit();
			rs.close();
			pstmt.close();
			con.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	%>
		
	</form>
</main>
<%@ include file="/resources/layout/footer.jsp"%>
</body>
</html>