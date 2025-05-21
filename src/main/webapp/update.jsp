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
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	
	String sql = " UPDATE member_tbl_02 SET       " +
            	 " custname = '" + custname + "', " +
            	 " phone = '" + phone + "',       " +
             	 " address = '" + address + "',   " +  
            	 " grade = '" + grade + "',       " + 
            	 " city = '" + city + "'          " +
            	 " WHERE custno = 				  " + custno;

	// ResultSet rs = stmt.executeQuery(sql);
	stmt.executeUpdate(sql);  
	response.sendRedirect("main.jsp");
%>
