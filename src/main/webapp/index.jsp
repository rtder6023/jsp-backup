<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Insert title here</title>
</head>
<body>
	<header>
		<h2>쇼핑몰 회원관리 ver 1.0</h2>
	</header>
	<nav>
		<ul>
			<li><a target="section_page" href="insert.jsp">회원등록</a></li>
			<li><a target="section_page" href="insert_list.jsp">회원목록조회/수정</a></li>
			<li><a target="section_page" href="insert2.jsp">회원매출조회</a></li>
			<li><a target="section_page" href="main.jsp">홈으로</a></li>
		</ul>
	</nav>
	<section>
		<iframe name="section_page" src="main.jsp"></iframe>
	</section>
	<footer><h4>HRDKORE Copyrightⓒ2016 All rights reserved Human Resources Development Service of Korea.</h4></footer>
</body>
</html>