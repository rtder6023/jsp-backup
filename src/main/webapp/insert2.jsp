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
	String sql = " SELECT 	me.custno AS 회원번호, " +
		   		 " 			me.custname AS 회원성명, " +
		   		 " 			(CASE grade " +
		   		 " 				WHEN 'A' THEN 'VIP' " +
		   		 " 				WHEN 'B' THEN '일반' " +
		   		 " 				WHEN 'C' THEN '직원' " +
		   		 " 			END) AS 고객등급, " +
		   		 " 			SUM(mo.price) AS 매출 " +
			 	 " FROM 	member_tbl_02 me " +
				 " JOIN 	money_tbl_02 mo	ON me.custno = mo.custno " +
			 	 " GROUP BY me.custno, me.custname, me.grade " +
				 " ORDER BY 매출 DESC ";
	
	ResultSet rs = stmt.executeQuery(sql);			
%>
</head>


<body>
<h3>홈쇼핑 회원등록</h3>
	<table border="1">
		<tr>
			<th>회원번호</th>
			<th>회원성명</th>
			<th>고객등급</th>	
			<th>매출</th>
		</tr>
		
<% while(rs.next()){ %>
		<tr>
			<td><%=rs.getString("회원번호") %></td>
			<td><%=rs.getString("회원성명") %></td>
			<td><%=rs.getString("고객등급") %></td>
			<td><%=rs.getString("매출") %></td>
<% } %>
	</table>
	
</body>
</html>