<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 처리</title>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");
        String userId = (String) session.getAttribute("id");
        String userPwFromUser = request.getParameter("userPw");

        String db_Driver = "jdbc:mysql://localhost:3306/TripBooster?useSSL=false";
        String db_ID = "root";
        String db_PW = "abcd1234";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(db_Driver, db_ID, db_PW);

            // 사용자 정보 조회
            String sql = "SELECT userPw FROM usertbl WHERE userId = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                String userPwFromDB = rs.getString("userPw");

                if (userPwFromDB.equals(userPwFromUser)) {
                    // 비밀번호 일치, 회원 탈퇴 처리
                    sql = "DELETE FROM usertbl WHERE userId = ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, userId);
                    pstmt.executeUpdate();

                    // 세션 정보 삭제
                    session.invalidate();

                    out.println("<script>alert('회원 탈퇴가 성공적으로 처리되었습니다.')</script>");
                } else {
                    // 비밀번호 불일치
                    out.println("<script>alert('비밀번호가 일치하지 않습니다. 다시 시도해주세요.')</script>");
                }
            }

            pstmt.close();
            conn.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            out.println("<h1>데이터베이스 드라이버를 찾을 수 없습니다.</h1>");
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<h1>데이터베이스 오류가 발생했습니다.</h1>");
        }
    %>
</body>
</html>