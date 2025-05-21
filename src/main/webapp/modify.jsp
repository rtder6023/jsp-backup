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
<script>
	function go_list() {
		window.location = "insert_list.jsp";
	}
	function check() {
		var custname = document.frm.custname.value;
		if(custname == ''){
			alert('회원성명이 입력되지 않았습니다.');
			frm.custname.focus();
			return false;
		}
		var phone = document.frm.phone.value;
		if(phone == ''){
			alert('회원전화 입력되지 않았습니다.');
			frm.phone.focus();
			return false;
		}
		var address = document.frm.address.value;
		if(address == ''){
			alert('회원주소가 입력되지 않았습니다.');
			frm.address.focus();
			return false;
		}
		var joindate = document.frm.joindate.value;
		if(joindate == ''){
			alert('가입일자가 입력되지 않았습니다.');
			frm.joindate.focus();
			return false;
		}
		var grade = document.frm.grade.value;
		if(grade == ''){
			alert('고객등급이 입력되지 않았습니다.');
			frm.grade.focus();
			return false;
		}
		var city = document.frm.city.value;
		if(city == ''){
			alert('도시코드가 입력되지 않았습니다.');
			frm.city.focus();
			return false;
		}
		alert('회원등록이 완료되었습니다.');
		return true;
	}
</script>
<%
	request.setCharacterEncoding("UTF-8");
	Connection conn = Util.getConnection();
	Statement stmt = conn.createStatement();
	String custno = request.getParameter("mod_custno");
	String sql = "SELECT * FROM member_tbl_02 WHERE custno =" + custno;
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
%>
</head>


<body>
<h3>홈쇼핑 회원 수정</h3>
<form name="frm" action="update.jsp">
	<table border="1">
		<tr>
			<th>회원번호(자동발생)</th>
			<td width="400px" align="left">
				<input style="width: 100px" name='custno' id='custno' value='<%=rs.getInt("custno")%>' readonly>
			</td>
		</tr>
		<tr>
			<th>회원성명</th>
			<td align="left">
				<input style="width: 100px" name='custname' id='custname' value='<%=rs.getString("custname")%>' >
			</td>
		</tr>
		<tr>
			<th>회원전화</th>
			<td align="left">
				<input name='phone' id='phone' value='<%=rs.getString("phone")%>'>
			</td>
		</tr>
		<tr>
			<th>회원주소</th>
			<td align="left">
				<input style="width: 250px" name='address' id='address' value='<%=rs.getString("address")%>'>
			</td>
		</tr>
		<tr>
			<th>가입일자</th>
			<td align="left">
				<input style="width: 100px" name='joindate' id='joindate' value='<%=rs.getString("joindate")%>' readonly>
			</td>
		</tr>
		<tr>
			<th>고객등급 [A:VIP,B:일반,C:직원]</th>
			<td align="left">
				<input style="width: 100px" name='grade' id='grade' value='<%=rs.getString("grade")%>'>
			</td>
		</tr>
		<tr>
			<th>도시코드</th>
			<td align="left">
				<input style="width: 100px" name='city' id='city' value='<%=rs.getString("city")%>'>
			</td>
		</tr>
		<tr>
			<td colspan=2>
				<input type="submit" value="수 정">
				<input type="button" value="조 회" onclick="go_list()">
			</td>
		</tr>
	</table>
</form>
<script>
	document.forms["frm"].onsubmit = check;
</script>
</body>
</html>
