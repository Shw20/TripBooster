<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
String userName = (String)session.getAttribute("userName");
%>
<title>TripBooster</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<style>
header {
    margin-bottom: 70px;
}
.container-2{
  width: 750px;
  vertical-align: middle;
  white-space: nowrap;
  position: relative;
}
.container-2 input#search{
  width: 50px;
  height: 50px;
  background: white;
  border: none;
  font-size: 13pt;
  float: left;
  color: #262626;
  padding-left: 50px;
  -webkit-border-radius: 5px;
  -moz-border-radius: 5px;
  border-radius: 5px;
  color: black;
  -webkit-transition: width .55s ease;
  -moz-transition: width .55s ease;
  -ms-transition: width .55s ease;
  -o-transition: width .55s ease;
  transition: width .55s ease;
}
.container-2 .icon{
  position: absolute;
  top: 0%;
  margin-left: 17px;
  margin-top: 17px;
  z-index: 1;
  color: #4f5b66;
}
.container-2 input#search::-webkit-input-placeholder {
   color: #65737e;
}
.container-2 input#search:-moz-placeholder { /* Firefox 18- */
   color: #65737e;  
}
.container-2 input#search::-moz-placeholder {  /* Firefox 19+ */
   color: #65737e;  
}
.container-2 input#search:-ms-input-placeholder {  
   color: #65737e;  
}
.container-2 input#search:focus, .container-2 input#search:active{
  outline:none;
  width: 450px;
}
.container-2:hover input#search{
	width: 500px;
}
.container-2:hover .icon{
  color: #93a2ad;

</style>

<body class="d-flex flex-column h-100">
<header>
  <nav class="navbar navbar-expand-md navbar-light fixed-top bg-info"}>
    <div class="container-fluid">
      <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">TripBooster</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
        <ul class="navbar-nav">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            지역</a>
            <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
	            <li><a class="dropdown-item" href="#">서울</a></li>
	            <li><a class="dropdown-item" href="#">경기도</a></li>
	            <li><a class="dropdown-item" href="#">인천</a></li>
	            <li><a class="dropdown-item" href="#">강원도</a></li>
	            <li><a class="dropdown-item" href="#">대전광역시</a></li>
	            <li><a class="dropdown-item" href="#">부산광역시</a></li>
	            <li><a class="dropdown-item" href="#">울산광역시</a></li>
	            <li><a class="dropdown-item" href="#">대구광역시</a></li>
	            <li><a class="dropdown-item" href="#">광주광역시</a></li>
	            <li><a class="dropdown-item" href="#">충청남도</a></li>
	            <li><a class="dropdown-item" href="#">충청북도</a></li>
	            <li><a class="dropdown-item" href="#">경상북도</a></li>
	            <li><a class="dropdown-item" href="#">경상남도</a></li>
	            <li><a class="dropdown-item" href="#">전라남도</a></li>
	            <li><a class="dropdown-item" href="#">전라북도</a></li>
	            <li><a class="dropdown-item" href="#">제주특별시</a></li>
          	</ul>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            코스</a>
            <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
	            <li><a class="dropdown-item" href="#">서울</a></li>
	            <li><a class="dropdown-item" href="#">경기도</a></li>
	            <li><a class="dropdown-item" href="#">인천</a></li>
	            <li><a class="dropdown-item" href="#">강원도</a></li>
	            <li><a class="dropdown-item" href="#">대전광역시</a></li>
	            <li><a class="dropdown-item" href="#">부산광역시</a></li>
	            <li><a class="dropdown-item" href="#">울산광역시</a></li>
	            <li><a class="dropdown-item" href="#">대구광역시</a></li>
	            <li><a class="dropdown-item" href="#">광주광역시</a></li>
	            <li><a class="dropdown-item" href="#">충청남도</a></li>
	            <li><a class="dropdown-item" href="#">충청북도</a></li>
	            <li><a class="dropdown-item" href="#">경상북도</a></li>
	            <li><a class="dropdown-item" href="#">경상남도</a></li>
	            <li><a class="dropdown-item" href="#">전라남도</a></li>
	            <li><a class="dropdown-item" href="#">전라북도</a></li>
	            <li><a class="dropdown-item" href="#">제주특별시</a></li>
          	</ul>
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
        <div class="container-2">
	      <span class="icon"><i class="fa fa-search"></i></span>
	      <input type="search" id="search" placeholder="Search" />
	  	</div>
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