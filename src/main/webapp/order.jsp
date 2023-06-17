<%@page import="com.entity.Book_Order"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sách cũ của bạn</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: rgb(189,228,251)">
	<%@include file="all_component/Navbar.jsp"%>
	<div class="p-5" style="background-color: white; margin-top: 3%">
		<h2 style="text-align: center; font-size: 2.5rem">Đơn đặt hàng của bạn</h2>
	    <table class="table table-striped fs-2">
		  <thead class="bg-info-subtle">
		    <tr>
		      <th scope="col">Mã đặt hàng</th>
		      <th scope="col">Hình ảnh</th>
		      <th scope="col">Tên</th>
		      <th scope="col">Tên Sách</th>
		      <th scope="col">Tác Giả</th>
		      <th scope="col">Giá</th>
		      <th scope="col">Hình thức thanh toán</th>
		      <th scope="col">Trạng Thái</th>
		    </tr>
		  </thead>
		  <tbody>
		  <%
		  BookOrderImpl dao= new BookOrderImpl(DBConnect.getConn());
		  List<Book_Order> list= dao.getBook(us.getEmail());
		  for(Book_Order b : list)
		  {
		  %>
			  <tr>
			  <td><%=b.getOrderId()%></td>
			  <td ><img src="book/<%=b.getPhotoname() %>" alt="" style="width: 50px; hegiht: 50px;"></td>
		      <th scope="row"><%=b.getUserName() %></th>
		      <td><%=b.getBookName()%></td>
		      <td><%=b.getAuthor() %></td>
		      <td><%=b.getPrice() %></td>
		      <td><%=b.getPaymentType() %></td>
		      <td><%=b.getOrderStatus() %></td>
		    </tr>	  
		  <%
		  }
		  %>
		  </tbody>
		</table>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>