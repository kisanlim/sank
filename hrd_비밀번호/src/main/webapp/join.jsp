
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.DBmanager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
	<link href="main.css" rel="stylesheet">
</head>
<body>
	<script type="text/javascript" src="main.js"></script>

	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	
	<%
		Connection conn = null ; 
		PreparedStatement pstmt = null ;
		ResultSet rs = null; 
		String custno = null; 
		try{
			conn = DBmanager.getConnection();
			String sql = "select MAX(costno)+1 costno from member_tbl_02 ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); 
			rs.next();
			custno = rs.getString("costno");
		}catch(Exception e){
			e.printStackTrace(); 
		}
	%>
		
		<section>
			<div>
				<h2>홈쇼핑 회원 등록</h2>
			</div> 
			<div>
			<form action="" name=frm>
				<table border="1">
				<tr>
					<td>회원번호(자동발생)</td>
					<td><input type="text" readonly="readonly" name="custno" value="<%=custno%>"></td>				
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="custname"></td>	
				</tr>
				<tr>
					<td>회원전화</td>
					<td><input type="text" name="phone"></td>
				</tr>
				<tr>
					<td>회원주소</td>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="text" name="joinDate"></td>
				</tr>
				<tr>
					<td>고객등급[A:VIP ,B:일반,C:직원]</td>
					<td><input type="text" maxlength="1" name="grade"></td>
				</tr>
				<tr>
					<td>도시코드</td>
					<td><input type="text" maxlength="2" name="city"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="등록" onclick="return joinCheck()">
						<input type="button" value="조회" onclick='location.href="list.jsp";'>
					</td>
				</tr>
				</table>
				</form>
			</div>
		</section>
	
	<%@ include file="/footer.jsp" %>
	
	
</body>
</html>