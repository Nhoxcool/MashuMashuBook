<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<link>
<%@include file="allCss.jsp"%>
<link rel="stylesheet" href="css/Adminhome2.css?version=1">
<script src="https://kit.fontawesome.com/852351e3ff.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<body>
<div id="mySidenav" class="sidenav">
	<p class="logo"><a href="../index.jsp"><img src="adminimg/logo-removebg-preview.png" alt=" "></a>
  <a href="home.jsp" class="icon-a"><i class="fa fa-dashboard icons"></i> &nbsp;&nbsp;Dashboard</a>
  <a href="add_books.jsp"class="icon-a"><i class="fa-solid fa-book-medical icons"></i> &nbsp;&nbsp;Addbook</a>
  <a href="AllBook.jsp"class="icon-a"><i class="fa-solid fa-book icons"></i> &nbsp;&nbsp;Allbook</a>
  <a href="orders.jsp"class="icon-a"><i class="fa fa-shopping-bag icons"></i> &nbsp;&nbsp;Order</a>
  <a href="../logout"class="icon-a"><i class="fa-solid fa-right-from-bracket icons"></i> &nbsp;&nbsp;LogOut</a>
</div>
<div id="main">

	<div class="head">
		<div class="col-div-6">
<span style="font-size:30px;cursor:pointer; color: #db4633;" class="nav"  >&#9776; Order</span>
<span style="font-size:30px;cursor:pointer; color: #db4633;" class="nav2"  >&#9776; Order</span>
</div>
	
	<div class="clearfix"></div>
</div>
	
			<table class="table table-striped"> 
			  <thead class="bg-info-subtle">
			    <tr>
			      <th scope="col">Order id</th>
			      <th scope="col">Tên</th>
			      <th scope="col">Email</th>
			      <th scope="col">Địa Chỉ</th>
			      <th scope="col">Số điện thoại</th>
			      <th scope="col">Book Name</th>
			      <th scope="col">Tác Giả</th>
			      <th scope="col">Giá</th>
			      <th scope="col">Hình thức thanh toán</th>
			    </tr>
			  </thead>
			  <tbody class="table-group-divider">
			    <tr>
			      <th scope="row">1</th>
			      <td>Mark</td>
			      <td>Otto</td>
			      <td>@mdo</td>
			      <td>@mdo</td>
			      <td>@mdo</td>
			      <td>@mdo</td>
			      <td>@mdo</td>
			      <td>@mdo</td>
			    </tr>
			    <tr>
			      <th scope="row">2</th>
			      <td>Jacob</td>
			      <td>Thornton</td>
			      <td>@fat</td>
			      <td>@mdo</td>
			      <td>@mdo</td>
				  <td>@mdo</td>
				  <td>@mdo</td>
				  <td>@mdo</td>

			    </tr>
			    <tr>
			      <th scope="row">3</th>
			      <td >Larry the Bird</td>
			      <td>@twitter</td>
			      <td>@mdo</td>
			      <td>@mdo</td>
			      <td>@mdo</td>
				  <td>@mdo</td>
				  <td>@mdo</td>
				  <td>@mdo</td>
			    </tr>
			  </tbody>
			</table>


 
      
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