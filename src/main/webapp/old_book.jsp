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
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@include file="all_component/Navbar.jsp"%>
	<div class="grid p-5">
	    <table class="table table-striped fs-2">
		  <thead class="bg-info-subtle">
		    <tr>
		      <th scope="col">Hình ảnh</th>
		      <th scope="col">Tên Sách</th>
		      <th scope="col">Tác Giả</th>
		      <th scope="col">Giá</th>
		      <th scope="col">Loại</th>
		      <th scope="col">Hành Động</th>
		    </tr>
		  </thead>
		  <tbody>
		  <%
		  String email = us.getEmail();
		  BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
		  List<BookDtls> list = dao.getBookByOld(email,"Cũ");
		  for(BookDtls b:list)
		  {
		  %>
			  <tr>
			  <td ><img src="book/<%=b.getPhotoName() %>" alt="" style="width: 50px; hegiht: 50px;"></td>
		      <th scope="row"><%=b.getBookName() %></th>
		      <td><%=b.getAuthor() %></td>
		      <td><%=b.getPrice() %></td>
		      <td><%=b.getBookCategory() %></td>
		      <td><a href="delete_old_book?email=<%=email%>&&id=<%=b.getBookID() %>" class="btn btn-danger btn-lg">Xóa</a></td>
		    </tr>	  
		  <%
		  }
		  %>
		  </tbody>
		</table>
	</div>
</body>
</html>