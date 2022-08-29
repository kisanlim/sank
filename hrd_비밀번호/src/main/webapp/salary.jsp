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
<title>salary</title>
<link href="main.css" rel="stylesheet">
</head>
<body>
	<%
	DBmanager.getConnection();
	%>

	<%@ include file="/header.jsp"%>
	<%@ include file="/nav.jsp"%>



	<section>
		<div>
			<h2>회원 매출 조회</h2>
		</div>
		<div>
			<form action="" style="">
				<table border="1">
					<tr>
						<td>회원번호</td>
						<td>회원성명</td>
						<td>고객등급</td>
						<td>매 출</td>
					</tr>
					<%
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String grade = ""; 
					try{
						conn = DBmanager.getConnection(); 
						String sql = "select me.custno , me.custname , me.grade , sum(mo.price) price from money_tbl_02 mo , member_tbl_02 me where me.custno = mo.custno group by me.custno , me.custname , me.grade order by sum(mo.price) desc";
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery(); 
						while(rs.next()){
							grade = rs.getString("grade");
							if(grade.equals("A")){
								grade = "VIP";
							}else if(grade.equals("B")){
								grade = "일반";
							}else{
								grade = "직원";
							}
							System.out.print(rs.getString("custname"));
							%>
							<tr>
								<td><%=rs.getString("custno") %></td>
								<td><%=rs.getString("custname") %></td>
								<td><%=grade%></td>
								<td><%=rs.getString("price") %></td>
							</tr>
						<%	
						}
					}catch(Exception e){
						e.printStackTrace();
					}
					%>
				</table>
			</form>
		</div>
	</section>

	<%@ include file="/footer.jsp"%>


</body>
</html>