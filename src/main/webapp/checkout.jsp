<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giỏ hàng</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #b2dce6">
<%@include file="all_component/Navbar.jsp"%>
<c:if test="${empty user }">
	<c:redirect url="logout"></c:redirect>	
</c:if>

<c:if test="${not empty SuccMsg }">
	<div class="alert alert-success text-center fs-2">
	  <strong>${SuccMsg}</strong>
	</div>
	<c:remove var="SuccMsg" scope="session"/>
</c:if>

<c:if test="${not empty failedMsg }">
	<div class="alert alert-danger text-center fs-2">
	  <strong>${failedMsg}</strong>
	</div>
	<c:remove var="failedMsg" scope="session"/>
</c:if>	
<div class="container fs-3" style="margin-top: 3%">
	<div class="row">
		<div class="col-8" >
			<div class="card bg-white">
				<div class="card-body">
				<h3 class="text-center text-succes">Sản phẩm của bạn</h3>
					<table class="table table-success table-striped">
					  <thead>
					    <tr>
					      <th scope="col">Hình ảnh sách</th>
					      <th scope="col">Tên sách</th>
					      <th scope="col">tên tác giả</th>
					      <th scope="col">giá</th>
					      <th scope="col">Hành động</th>
					    </tr>
					  </thead>
					  <tbody>
					  
					  <%
					  User us = (User)session.getAttribute("user");
					  CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
					  List<Cart> list= dao.getBookByUser(us.getId());
					  Double totalPrice=0.00;
					  for(Cart c: list)
					  {
						  totalPrice =c.getTotalPrice();					  
					  %>
						 <tr>
					      <td><img src="book/<%=c.getPhotoname()%>" style="width: 50px; hegiht: 50px;"></td>
					      <td><%=c.getBookName() %></td>
					      <td><%=c.getAuthor() %></td>
					      <td><%=c.getPrice() %>đ</td>
					      <td
					      ><a href="remove_book?bid=<%=c.getBookid() %>&&uid=<%=c.getUserid() %>&&cartid=<%=c.getCartid() %>" class="btn  btn-danger">XÓA</a>
					      </td>					      
					    </tr>
					  <%
					  }
					  %>
						
					  <tr>
					  <td></td>
					  <td>Giá tổng cộng</td>
					  <td></td>
					  <td><%=totalPrice %>đ</td>
					  <td></td>
					  <td></td>
					  </tr>
					  </tbody>
					</table>
				</div>
			</div>
		</div>
		
		<div class="col-md-4">
			<div class="card">
				<div class="card-body">
					<h3 class="text-center text-success">Điền thông tin giao hàng</h3>
					<form action="order" method="post">
					<input type="hidden" value="${user.id}" name="id">
							<div class="form-row">
							    <div class="form-group col-md-6">
							      <label for="inputEmail4">Tên</label>
							      <input type="text" name="username" class="form-control form-control-lg" id="inputEmail4" value="<%=us.getName()%>" required="required">
							    </div>
							    <div class="form-group col-md-6">
							      <label for="inputPassword4">Email</label>
							      <input type="email" name="email" class="form-control form-control-lg" id="inputPassword4" value="<%=us.getEmail()%>" required="required">
								</div>
							</div>
							<div class="form-row">
							    <div class="form-group col-md-6">
							      <label for="inputEmail4">Số điện thoại</label>
							      <input type="number" name="phno" class="form-control form-control-lg" id="inputEmail4" value="<%=us.getPhno()%>" required="required">
							    </div>
							    <div class="form-group col-md-6">
							      <label for="inputPassword4">Địa chỉ</label>
							      <input type="text" name="address"class="form-control form-control-lg" id="inputPassword4" value="" required="required">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
							      <label for="inputEmail4">Thành Phố</label>
							      <input type="text" name="city" class="form-control form-control-lg" id="inputEmail4" value="" required="required">
								</div>
							    <div class="form-group col-md-6">
							      <label for="inputPassword4">Quận</label>
							      <input type="text" name="quan" class="form-control form-control-lg" id="inputPassword4" value="" required="required">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
							      <label for="inputEmail4">Huyện</label>
							      <input type="text" name="huyen" class="form-control form-control-lg" id="inputEmail4" value="" required="required">
								</div>
							    <div class="form-group col-md-6">
							      <label for="inputPassword4">Mã bưu điện</label>
							      <input type="text" name="pincode" class="form-control form-control-lg" id="inputPassword4" value="" required="required">
								</div>
							</div>
							
							<div class="form-group">
							<label>Hình thức thanh toán</label>
							<select class="form-control form-control-lg" name="payment">
							<option value="noselect">--Vui lòng chọn--</option>
							<option value="Thanh toán khi nhận hàng">Thanh toán khi nhận hàng</option>
							<option value="Thanh toán online">Thanh toán online</option>
							</select>
							</div>
							<div class="order__btn">
							<button class="order__btn-1">Đặt hàng ngay</button>
							</div>
					</form>
				</div>
			</div>
		<div>
	</div>
	</div>
	</div>
</div>
<%@include file="all_component/footer.jsp"%>

</body>
</html>