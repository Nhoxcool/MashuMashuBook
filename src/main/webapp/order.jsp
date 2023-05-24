<%@page import="java.util.ArrayList"%>
<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bán Sách</title>
<script src="https://kit.fontawesome.com/852351e3ff.js" crossorigin="anonymous"></script>
<%@include file="all_component/allCss.jsp"%>
	<%@include file="all_component/Navbar.jsp"%>
</head>
<body>
	<div class="container">
	
		<h3 class="text-center text-primary fs-2" style="margin-top: 5%">Dơn đặt hàng của bạn</h3>
		<table class="table table-striped fs-2" style="margin-top: 2%">
			<thead class="bg-info-subtle">
				<tr>
					<th scope="col">Mã đặt hàng</th>
					<th scope="col">Tên</th>
					<th scope="col">Tên Sách</th>
					<th scope="col">Tác giả</th>
					<th scope="col">Giá</th>
					<th scope="col">hình thức thanh toán</th>
				</tr>
			</thead>
			
			<%
			User us = (User)session.getAttribute("user");
			BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
			List<Book_Order> list = dao.getBook(us.getEmail());
			for(Book_Order b:list)
			{%>						
			<tbody>
				<tr>
					<th scope="row"><%=b.getOrderId() %></th>				
					<td><%=b.getUserName() %></td>
					<td><%=b.getBookName() %></td>
					<td><%=b.getAuthor() %></td>
					<td><%=b.getPrice() %></td>
					<td><%=b.getPaymentType() %></td>
				</tr>
			</tbody>			
			<%}
			%>
		</table>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>