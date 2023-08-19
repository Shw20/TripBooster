<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
    // 현재 세션을 무효화하여 로그아웃
    session.invalidate();
    response.sendRedirect("../index.jsp"); // 로그아웃 후 메인 화면으로 이동
%>
	
</body>
</html>