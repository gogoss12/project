<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
  <title>Document</title>
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
    	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <!--  	<link rel="stylesheet" href="../resource/css/bootstrap.css">-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
 
</head>
<body>
  <header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">
          <img src="./resource/image/케어풀 임시 아이콘.png" alt="" width="150px" height="100%">
        </a>

        <div style="padding-left: 100px;"></div>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link" href="#">소개</a>
            </li>

            <div style="padding-left: 100px;"></div>

            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-bs-toggle="dropdown"
                aria-expanded="false">
                매칭
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="#">매칭검색</a></li>
              </ul>
            </li>

            <div style="padding-left: 100px;"></div>

            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-bs-toggle="dropdown"
                aria-expanded="false">
                서비스
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="#">쪽지</a></li>
                <li><a class="dropdown-item" href="#">지도</a></li>
              </ul>
            </li>
          </ul>

          <ul class="nav navbar-nav navbar-right">
            <li><a href="<%=request.getContextPath() %>/member/login"><i class="fas fa-user"></i>로그인</a></li>

            <div style="padding-left: 80px;"></div>

            <li><a href="<%=request.getContextPath() %>/member/enroll"><i class="fas fa-sign-in-alt"></i>가입</a></li>
          </ul>
        </div>
      </div>
    </nav>
  </header>