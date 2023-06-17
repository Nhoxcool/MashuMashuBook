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
		<c:if test="${not empty succMsgcomfirmorder }">
			<div class="alert alert-success text-center fs-2">
			  <strong>${succMsgcomfirmorder}</strong>
			</div>
			<c:remove var="succMsgcomfirmorder" scope="session"/>
		</c:if>
		
		<c:if test="${not empty failedMsgcomfirmorder }">
			<div class="alert alert-danger text-center fs-2">
			  <strong>${failedMsgcomfirmorder}</strong>
			</div>
			<c:remove var="failedMsgcancelorder" scope="session"/>
		</c:if>	
		<c:if test="${not empty succMsgcancelorder }">
			<div class="alert alert-success text-center fs-2">
			  <strong>${succMsgcancelorder}</strong>
			</div>
			<c:remove var="succMsgcancelorder" scope="session"/>
		</c:if>
		
		<c:if test="${not empty failedMsgcancelorder }">
			<div class="alert alert-danger text-center fs-2">
			  <strong>${failedMsgcancelorder}</strong>
			</div>
			<c:remove var="failedMsgcancelorder" scope="session"/>
		</c:if>	
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
		      <th scope="col">Hành Động</th>
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
		      <%
			  if (b.getOrderStatus().equals("Đang xử lí") || b.getOrderStatus().equals("Đã tiếp nhận")) {
			  %>
			  	<td>	
				<form action="cancelorderbooks?orderid=<%=b.getId() %>" method="post">
					<button class="btn btn-sm btn-danger fs-4" type="submit">Hủy Đơn Hàng</button>
				</form>
				</td>
			  <%
			  } else if (b.getOrderStatus().equals("Đang giao hàng")){
			  %>
			  	<td>	
				<form action="comfirmorderbooks?orderid=<%=b.getId() %>" method="post">
					<button class="btn btn-sm btn-success fs-4" type="submit">Xác nhận giao hàng</button>
				</form>
				</td>
			  <%
			  } else {
			  %>
				 <td>
				 </td>
			  <%
			  }
		      %>
		    </tr>	  
		  <%
		  }
		  %>
		  </tbody>
		</table>
	</div>
	<div style="margin-top: 15%"></div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>