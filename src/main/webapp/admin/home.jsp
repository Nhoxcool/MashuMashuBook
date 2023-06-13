<%@page import="com.entity.Book_Order"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@page import="com.entity.User"%>
<%@page import="com.DAO.UserDAOImpl"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
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
<title>Admin</title>
<link>
<link rel="stylesheet" href="Adminhome.css?version=1">
<script src="https://kit.fontawesome.com/852351e3ff.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div class="content">
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
	<span style="font-size:30px;cursor:pointer; color: #db4633;" class="nav"  >&#9776; Dashboard</span>
	<span style="font-size:30px;cursor:pointer; color: #db4633;" class="nav2"  >&#9776; Dashboard</span>
	</div>
		
	</div>
	
					<%
					int i = 0;
					int i2 = 0;
					int i3 = 0;
					BookDAOImpl dao= new BookDAOImpl(DBConnect.getConn());
					List<BookDtls> list=dao.getAllBooks();
					for(BookDtls b : list){
						i=i+1;
					}
					UserDAOImpl dao2 = new UserDAOImpl(DBConnect.getConn());
					List<User> list2= dao2.getAllUser();
					for(User b : list2){
						i2=i2+1;
					}
					
					BookOrderImpl dao3 = new BookOrderImpl(DBConnect.getConn());
					List<Book_Order> list3 = dao3.getAllBookOrder();
					for(Book_Order b: list3){
						i3=i3+1;
					}
					
					%>
	
			<div class="clearfix"></div>
	    <br/>
	    
	    <div class="col-div-3">
	      <div class="box">
	        <p><%=i2 %><br/><span>Tài Khoản Người Dùng</span></p>
	        <i class="fa fa-users box-icon"></i>
	      </div>
	    </div>
	    <div class="col-div-3">
	      <div class="box">
	        <p><%=i %><br/><span>Sách</span></p>
	        <i class="fa fa-list box-icon"></i>
	      </div>
	    </div>
	    <div class="col-div-3">
	      <div class="box">
	        <p><%=i3 %><br/><span>Đơn đặt hàng</span></p>
	        <i class="fa fa-shopping-bag box-icon"></i>
	      </div>
	    </div>
	    <div class="clearfix"></div>
	    <br/><br/>
	    <div class="col-div-8">
	      <div class="box-8">
	      <div class="content-box">
	        <p>Top Sách bán chạy </p>
	        <br/>
	        <table>
					<tr>
					<th>Tên Sách</th>
					<th>Tác Giả</th>
					<th>Giá</th>
					</tr>
					<%
					BookOrderImpl dao4 = new BookOrderImpl(DBConnect.getConn());
					List<Book_Order> list4 = dao4.getTopBookOrder();
					for (Book_Order b : list4) {
					%>
				    <tr>
				      <td><%=b.getBookName() %></td>
				      <td><%=b.getAuthor() %></td>
				      <td><%=b.getPrice() %></td>
				    </tr>
				<%
				}
	 			%> 
	 		 </table>
	      </div>
	    </div>
	    </div>
	
	    <div class="col-div-4">
	      <div class="box-4">
	      <div class="content-box">
	        <p>Số lượng bán hiện tại </p>
	
	        <div class="circle-wrap">
	      <div class="circle">
	        <div class="mask full">
	          <div class="fill"></div>
	        </div>
	        <div class="mask half">
	          <div class="fill"></div>
	        </div>
	        <div class="inside-circle"> 70% </div>
	      </div>
	    </div>
	      </div>
	    </div>
	    </div>
	      
	    <div class="clearfix"></div>
	  </div>
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
