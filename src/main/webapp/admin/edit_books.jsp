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
<title>Chỉnh sửa sách</title>
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
  <a href="orders.jsp"class="icon-a"><i class="fa fa-shopping-bag icons"></i> &nbsp;&nbsp;Đơn Hàng</a>
  <a href="User.jsp"class="icon-a"><i class="fa-solid fa-user icons"></i> &nbsp;&nbsp;Người Dùng</a>
  <a href="../logout"class="icon-a"><i class="fa-solid fa-right-from-bracket icons"></i> &nbsp;&nbsp;Đăng xuất</a>
</div>
<div id="main">

	<div class="head">
		<div class="col-div-6">
<span style="font-size:30px;cursor:pointer; color: #db4633;" class="nav"  >&#9776; Chỉnh Sửa Sách</span>
<span style="font-size:30px;cursor:pointer; color: #db4633;" class="nav2"  >&#9776; Chỉnh Sửa Sách</span>
</div>
	
	<div class="clearfix"></div>
</div>
	<div class="container">'
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class ="text-center">Edit Books</h4>
							
							<%
							int id =Integer.parseInt(request.getParameter("id"));
							BookDAOImpl dao =new BookDAOImpl(DBConnect.getConn());
							BookDtls b= dao.getBookById(id);						
							%>					
						<form action= "../edditbooks" method="post" enctype="multipart/form-data">
							<input type="hidden" name="id" value="<%=b.getBookID() %>">							
							<div class="form-group">
								<label for="exampleInputBookname">Tên Sách*</label>
								<input name="bname" type="text" class="form-control" id="exampleInpuBookname" value="<%=b.getBookName() %>">
							</div>
							<div class="form-group">
								<label for="exampleInputAuthor">Tên Tác Giả</label>
								<input name="author" type="text" class="form-control" id="exampleInputAuthor" value="<%=b.getAuthor() %>">
							</div>
							<div class="form-group">
								<label for="exampleInputPrice">Price*</label>
								<input name="price" type="Number" class="form-control" id="exampleInputPrice" value="<%=b.getPrice() %>">
							</div>						
							<div class="form-group">
								<label for = "inputState">Trạng thái sách</label>
								<select id="inputState" name="bstatus" class="form-control">
								<% 
								if("Active".equals(b.getStatus())){
								%>
								<option value="Active">Đang hoạt động</option>
								<option value="Inactive">Không hoạt động</option>
								<%	
								}else{%>
								<option value="Inactive">Không hoạt động</option>
								<option value="Active">Đang hoạt động</option>
								<%
								}
								%>
								</select>
							</div>
							<button type="submit" class="btn btn-primary" style="margin-left: 40%">Thay Đổi</button>
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