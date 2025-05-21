<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css">
<%
	request.setCharacterEncoding("UTF-8");
	Connection conn = Util.getConnection();
	Statement stmt = conn.createStatement();
	String sql = " SELECT 	custno AS 회원번호, 						   " +
		   		 " 			custname AS 회원성명, 						   " +
				 "		   	phone AS 전화번호, 						   " +
				 "		   	address AS 주소, 							   " +
				 "		   	TO_CHAR(joindate, 'YYYY-MM-DD') AS 가입일자, " +
				 "		   	(CASE grade 							   " +
				 "		   		WHEN 'A' THEN 'VIP' 				   " +
				 "		   		WHEN 'B' THEN '일반' 					   " +
				 "		   		WHEN 'C' THEN '직원' 					   " +
				 "		   	END) AS 고객등급, 							   " +
				 "		   	city AS 거주지역 							   " +
				 " FROM 	member_tbl_02							   " ;
	ResultSet rs = stmt.executeQuery(sql);			
%>
</head>


<body>
<h3>홈쇼핑 회원등록</h3>
	<table border="1">
		<tr>
			<th>회원번호</th>
			<th>회원성명</th>
			<th>전화번호</th>
			<th>주소</th>			
			<th>가입일자</th>
			<th>고객등급</th>	
			<th>거주지역</th>
		</tr>
		
<% while(rs.next()){ %>
		<tr>
			<td><a href="modify.jsp?mod_custno=<%=rs.getString("회원번호")%>"><%=rs.getString("회원번호") %></a></td>
			<td><%=rs.getString("회원성명") %></td>
			<td><%=rs.getString("전화번호") %></td>
			<td><%=rs.getString("주소") %></td>
			<td><%=rs.getString("가입일자") %></td>
			<td><%=rs.getString("고객등급") %></td>
			<td><%=rs.getString("거주지역") %></td>
<% } %>
	</table>
	
</body>
</html>