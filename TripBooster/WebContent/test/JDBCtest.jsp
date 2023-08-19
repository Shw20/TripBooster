<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>TripBooster</title>
</head>
<body>
<%
   try {
      Class.forName("com.mysql.jdbc.Driver");
      request.setCharacterEncoding("UTF-8");
      
      String url = "jdbc:mysql://localhost:3306/tripbooster?useSSL=false&verifyServerCertificate=false";
      String user = "root";
         String password = "abcd1234";
         
      Connection con = DriverManager.getConnection(url, user, password);
%>
<h1>연결 성공</h1>
<%
   } catch(Exception e) {
      e.printStackTrace();
%>
<h1>연결 실패</h1>
<%
   }
%>
</body>
</html>