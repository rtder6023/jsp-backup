<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>

<%
	request.setCharacterEncoding("UTF-8");
	Connection conn = Util.getConnection();
	Statement stmt = conn.createStatement();

	String custno = request.getParameter("custno");
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String joindate = request.getParameter("joindate");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	
	String sql = " INSERT INTO member_tbl_02 VALUES (	" +
				 " 							  '" + custno + "', "   + 
				 " 							  '" + custname + "', " +
				 " 							  '" + phone + "', "    +
				 " 							  '" + address + "', "  +
				 " 							  '" + joindate + "', " +
				 " 							  '" + grade + "', "    +								 
				 " 							  '" + city + "') ";
	ResultSet rs = stmt.executeQuery(sql);
	response.sendRedirect("main.jsp");
%>
