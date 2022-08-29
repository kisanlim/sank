<%@page import="util.DBmanager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
	<link href="main.css" rel="stylesheet">
</head>
<body>
	<%DBmanager.getConnection(); %>

	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
		
		<section>
			<div>
				<h2>회원 목록 조회/수정</h2>
			</div> 
			<div>
		
			</div>
		</section>
	
	<%@ include file="/footer.jsp" %>
	
	
</body>
</html>