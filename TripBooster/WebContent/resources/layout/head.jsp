<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
String userName = (String)session.getAttribute("userName");
%>
<title>TripBooster</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<body class="d-flex flex-column h-100">
<header>
  <nav class="navbar navbar-expand-md navbar-info fixed-top bg-info">
    <div class="container-fluid">
      <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">TripBooster</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav me-auto mb-2 mb-md-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Link</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="/TripBooster/User/Mypage.jsp">
            <% if ((userName != null) && !userName.equals("관리자")) { %>
    		<%= userName %>님, 환영합니다.
			<% } else { %>
			    로그인하세요.
			<% } %></a>
          </li>
        </ul>
        <form class="d-flex" role="Sign in">
        <% if (userName == null) {%>
          <button type="button" class="btn btn-outline-danger" onclick="location.href='/TripBooster/User/LoginForm.jsp'">Sign in</button>
        <%} else { %>
          <button type="button" class="btn btn-outline-danger" onclick="location.href='/TripBooster/User/Mypage.jsp'">MyPage</button>
          <button type="button" class="btn btn-outline-danger" onclick="location.href='/TripBooster/User/Logout.jsp'">Logout</button>
        <%} %>
        </form>
      </div>
    </div>
  </nav>
</header>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/styles.css">