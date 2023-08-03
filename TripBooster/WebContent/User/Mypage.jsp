<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
</head>
<body>
    
    <%
        request.setCharacterEncoding("utf-8");
        String userName = (String) session.getAttribute("userName");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String db_Driver = "jdbc:mysql://localhost:3306/TripBooster?useSSL=false";
            String db_ID = "root";
            String db_PW = "abcd1234";
            Connection conn = DriverManager.getConnection(db_Driver, db_ID, db_PW);

            // 사용자 정보 조회 쿼리를 실행하는 부분
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
    <h2>회원 정보 조회</h2>
    <%= userName %>님
    
    <table border="1">
        <tr>
            <td>아이디</td>
            <td>비밀번호</td>
            <td>이름</td>
            <td>전화번호</td>
            <td>가입날짜</td>
        </tr>
        <tr>
            <td><%= userId %></td>
            <td><%= userPw %></td>
            <td><%= userName %></td>
            <td><%= userTel %></td>
            <td><%= userRegDt %></td>
        </tr>
    </table>
    <a class="navbar-brand" href="../index.jsp">메인화면</a>
	<a href="Logout.jsp">로그아웃</a>
    <%
        rs.close();
        pstmt.close();
        conn.close();
    } else {
    %>
    <h2>회원 정보 조회</h2>
    해당 사용자 정보를 찾을 수 없습니다.
    <a class="navbar-brand" href="../index.jsp">메인화면</a>
    <% } %>
    <%
    }catch (Exception e) {
        out.println("오류가 발생했습니다: " + e.getMessage());
        e.printStackTrace();
   	 }
     %>
</body>
</html>
