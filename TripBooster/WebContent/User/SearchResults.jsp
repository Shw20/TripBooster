<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/Search.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/Dropdown.css" rel="stylesheet" type="text/css">
    <meta charset="UTF-8">
    <title>검색 결과</title>
</head>
<body>
    <% 
    request.setCharacterEncoding("UTF8");
    response.setCharacterEncoding("UTF-8");
    String keyword = request.getParameter("keyword");
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/tripbooster?useSSL=false&verifyServerCertificate=false";
        String user = "root";
        String password = "abcd1234";
        
        Connection con = DriverManager.getConnection(url, user, password);
        con.setAutoCommit(false);
        
        String SearchSql = "SELECT * FROM triptbl WHERE tripName LIKE ? OR tripCode LIKE ? ";

        PreparedStatement pstmt = con.prepareStatement(SearchSql);
        pstmt.setString(1, "%" + keyword + "%");  // '%'는 와일드카드 어떤 문자열이든 매치되게
        pstmt.setString(2, "%" + keyword + "%"); // tripCode에 검색어 포함
        
        ResultSet rs = pstmt.executeQuery();
        
        while(rs.next()){
            // 검색 결과를 표시하는 HTML 코드 작성
        }

        String userNum = (String) session.getAttribute("userNumSession");
        String userName = (String) session.getAttribute("userNameSession");
        
            if (userName == null) {
    %>
        <jsp:include page="/resources/layout/nav.jsp"></jsp:include>
    <%
            }

            if (userName != null) {
    %>
        <%
            if (userName.equals("관리자")) {
        %>
                <jsp:include page="/resources/layout/adminNav.jsp"></jsp:include>
        <%
            } else {
        %>
                <jsp:include page="/resources/layout/userNav.jsp"></jsp:include>
        <%
            }
        }
    %>
    <div class="album py-5 bg-light">
        <div class="container">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <div class="text-left">
        		<br><h1 class="display-5"><b><%=keyword%>✈</b></h1>
        		<br><h5><%=keyword%>와 연관된 검색정보입니다.</h5>
    		</div>
    <% 
    	while (rs.next()) {
    %>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225"
                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
                             preserveAspectRatio="xMidYMid slice" focusable="false">
                            <a href="/Trip/tripChoice.jsp?tripNum=<%= rs.getString("tripNum") %>">
                            <image href="/resources/images/<%= rs.getString("tripImg") %>" width="100%" height="100%" />
                        </svg>
                        <div class="card-body">
                            <p class="card-text"><%= rs.getString("tripName") %></p>
                            <p class="card-text"><%= rs.getString("tripLoca") %></p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                	<%if (userName != null) {
                                		if (userName.equals("관리자")){ %>
                                			<button type="button" class="btn btn-sm btn-outline-secondary" onclick="location.href='/User/userLikeAction.jsp?tripNum=<%= rs.getString("tripNum") %>'">수정</button>
    					                <button type="button" class="btn btn-sm btn-outline-secondary" onclick="location.href='/Admin/tripDeleteAction.jsp?tripNum=<%= rs.getString("tripNum") %>'">삭제</button>
    					            <% } else { %>
    					                <button type="button" class="btn btn-sm btn-outline-secondary" onclick="location.href='/User/userLikeAction.jsp?tripNum=<%= rs.getString("tripNum") %>'">❤</button>
    					            <% } 
                                	}%>
                                    
                                </div>
                                <small class="text-muted">✈ <%= rs.getString("likeCount") %></small>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </div>
       <% }
        rs.close();
        pstmt.close();
        con.close();
    } catch(Exception e) {
        e.printStackTrace();
    }
    %>

</html>
</body>
<%@ include file="/resources/layout/footer.jsp"%>
</html>
