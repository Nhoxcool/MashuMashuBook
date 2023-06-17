<%@page import="com.entity.Book_Order"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chỉnh sửa đơn hàng</title>
<link>
<%@include file="allCss.jsp"%>
<link rel="stylesheet" href="Adminhome.css?version=1">
<script src="https://kit.fontawesome.com/852351e3ff.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<div id="mySidenav" class="sidenav">
	<p class="logo"><a href="../index.jsp"><img src="adminimg/logo-removebg-preview.png" alt=" "></a>
  <a href="home.jsp" class="icon-a"><i class="fa fa-dashboard icons"></i> &nbsp;&nbsp;Dashboard</a>
  <a href="add_books.jsp"class="icon-a"><i class="fa-solid fa-book-medical icons"></i> &nbsp;&nbsp;Thêm Sách</a>
  <a href="AllBook.jsp"class="icon-a"><i class="fa-solid fa-book icons"></i> &nbsp;&nbsp;Tất cả sách</a>
  <a href="AllOldBook.jsp"class="icon-a"><i class="fa-solid fa-book-bookmark icons"></i> &nbsp;&nbsp;Sách Cũ</a>
  <a href="orders.jsp"class="icon-a"><i class="fa fa-shopping-bag icons"></i> &nbsp;&nbsp;Đơn Hàng</a>
  <a href="User.jsp"class="icon-a"><i class="fa-solid fa-user icons"></i> &nbsp;&nbsp;Người Dùng</a>
  <a href="../logout"class="icon-a"><i class="fa-solid fa-right-from-bracket icons"></i> &nbsp;&nbsp;Đăng xuất</a>
</div>
<div id="main">

	<div class="head">
		<div class="col-div-6">
<span style="font-size:30px;cursor:pointer; color: #46aef7;" class="nav"  >&#9776; Chỉnh Sửa Đơn Hàng</span>
<span style="font-size:30px;cursor:pointer; color: #46aef7;" class="nav2"  >&#9776; Chỉnh Sửa Đơn Hàng</span>
</div>
	
	<div class="clearfix"></div>
</div>
	<div class="container">'
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class ="text-center">Chỉnh Sửa Đơn Hàng</h4>
							
							<%
							int orderid =Integer.parseInt(request.getParameter("orderid"));
							BookOrderImpl dao =new BookOrderImpl(DBConnect.getConn());
							Book_Order b= dao.getOrderbyId(orderid);						
							%>					
						<form action="../editorderbooks" method="post" enctype="multipart/form-data">
							<input type="hidden" name="orderid" value="<%=b.getId() %>">							
							<div class="form-group">
								<p><span style="font-weight: bold;">Mã Đơn Hàng:</span> <%=b.getOrderId() %></p>
							</div>
							<div class="form-group">
								<img src="../book/<%=b.getPhotoname()%>" style="width: 200px; hegiht: 100px; margin-left: 25%;">
							</div>
							<div class="form-group">
								<p><span style="font-weight: bold;">Email Người Đặt Hàng:</span> <%=b.getEmail() %></p>
							</div>
							<div class="form-group">
								<p><span style="font-weight: bold;">Tên Người Đặt Hàng:</span> <%=b.getUserName() %></p>
							</div>
							<div class="form-group">
								<p><span style="font-weight: bold;">Số Điện Thoại:</span> <%=b.getPhno() %></p>
							</div>
							<div class="form-group">
								<p><span style="font-weight: bold;">Địa Chỉ Người Đặt Hàng: </span> <%=b.getFulladd() %></p>
							</div>
							<div class="form-group">
								<label for = "inputState">Trạng thái đơn hàng</label>
								<%
								if (b.getOrderStatus().equals("Đang xử lí")) {
								%>	
									<select id="inputState" name="orderstatus" class="form-control">
									<option value="Đang xử lí">Đang xử lí</option>	
									<option value="Đã tiếp nhận">Đã Tiếp Nhận</option>				
									</select>
								<%
								} else if (b.getOrderStatus().equals("Đã tiếp nhận")){
								%>
									<select id="inputState" name="orderstatus" class="form-control">
									<option value="Đã tiếp nhận">Đã Tiếp Nhận</option>										
									<option value="Đang lấy hàng">Đang lấy hàng</option>							
									</select>
								<%
								} else if (b.getOrderStatus().equals("Đang lấy hàng")){
								%>
									<select id="inputState" name="orderstatus" class="form-control">
									<option value="Đang lấy hàng">Đang lấy hàng</option>	
									<option value="Đang giao hàng">Đang giao hàng</option>	
									</select>
								<%
								}
								 else if (b.getOrderStatus().equals("Đang giao hàng"))
								 {
								%>
									<select id="inputState" name="orderstatus" class="form-control">
									<option value="Đang giao hàng">Đang giao hàng</option>
									<option value="Giao Hàng Thành Công">Giao Hàng Thành Công</option>												
									</select>
								<%
								}
								%>
							</div>
							<button type="submit" class="editbutton">Thay Đổi</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


 
      
    <div class="clearfix"></div>
  </div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

  $(".nav").click(function(){
    $("#mySidenav").css('width','70px');
    $("#main").css('margin-left','70px');
    $(".logo").css('visibility', 'hidden');
    $(".logo span").css('visibility', 'visible');
     $(".logo span").css('margin-left', '-10px');
     $(".icon-a").css('visibility', 'hidden');
     $(".icons").css('visibility', 'visible');
     $(".icons").css('margin-left', '-8px');
      $(".nav").css('display','none');
      $(".nav2").css('display','block');
  });

$(".nav2").click(function(){
    $("#mySidenav").css('width','300px');
    $("#main").css('margin-left','300px');
    $(".logo").css('visibility', 'visible');
     $(".icon-a").css('visibility', 'visible');
     $(".icons").css('visibility', 'visible');
     $(".nav").css('display','block');
      $(".nav2").css('display','none');
 });

</script>

</body>


</html>

</body>
</html>