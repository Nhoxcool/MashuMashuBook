<%@page import="com.DAO.CommentDAOImpl"%>
<%@page import="com.entity.Comment"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.sql.*"%>
<%@page import="com.DB.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.DB.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="all_component/css/ViewBook.css">
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f4f2f0"	>
	<%@include file="all_component/Navbar.jsp"%>
	
		<c:if test= "${not empty addCart }">
	
		<div id="toast">${addCart}</div>

		<script type="text/javascript">
				showToast();
				function showToast(content)
				{
				    $('#toast').addClass("display");
				    $('#toast').html(content);
				    setTimeout(()=>{
				        $("#toast").removeClass("display");
				    },2000)
				}	
		</script>
		
		<c:remove var="addCart" scope="session"/>
	</c:if>
	
	<%
	int bid=Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
	BookDtls b = dao.getBookById(bid);
	%>
	
	<div class="grid" style="background-color: #ffffff; height: 30px">
		<p style="padding: 3px 18px; font-size: 1.6rem"><a href="index.jsp" class="path">Trang chủ </a> > 
		<%
		if (b.getBookCategory().equals("Sách giáo khoa"))
		{%>
			<a href="all_SGK_book.jsp" class="path"> Sách giáo khoa </a> >
		
		<% 	
		}else if (b.getBookCategory().equals("Sách văn học")){	
		%>
			<a href="all_literary_book.jsp" class="path"> Sách văn học </a> >
		<% 	
		}else if (b.getBookCategory().equals("Cũ")){	
		%>
			<a href="all_literary_book.jsp" class="path"> Sách Cũ </a> >
		<% 
		}else if (b.getBookCategory().equals("Sách nước ngoài")){	
		%>
			<a href="all_foreign_book.jsp" class="path"> Sách nước ngoài </a> >
		<%
		}
		%>
			<a href="view_books.jsp?bid=<%=b.getBookID() %>"  class="path"><%=b.getBookName() %></a>
		</p>
	</div>
	<div class="grid" style="margin-top: 3%; display: flex; background-color: #ffffff; " >
		<div class="row" style="width: 100%; padding: 50px 50px">
			<div class ="Product-img col-6">
				<img src="book/<%=b.getPhotoName() %>" style="width: 80%; height: 400px;">
			</div>
			<div class="Product_detail col-6">
				<%
				if (b.getBookCategory().equals("Cũ")) {
				%>
				<p style="font-size: 2.4rem"><%=b.getBookName() %>(Cũ)
				<p>
				<%
				}else {
				%>
				<p style="font-size: 2.4rem"><%=b.getBookName() %>
				<p>
				<%
				}
				%> 				
				<p class="Author"> Tác giả: <%=b.getAuthor() %></p>
				<%
				if (b.getBookCategory().equals("Cũ"))
				{%>
				<p class="Author"> Người bán: <%=b.getEmail() %></p>
				<% 	
				}%>
				<p class="Category"> Thể loại: <%=b.getBookCategory() %></p>
				<p class="Price"> Giá: <span style="color: #c92127"><%=b.getPrice() %>đ</span></p>
				<p class="Ship"> Chính sách giao hàng: <span style="color: #0099FF">free ship</span> </p>
				<p class="Return" >Đổi trả trong vòng: <span style="color: #0099FF">30 ngày </span></p>	
				<%
				if (us == null) {
				%>
					<a href="login.jsp">
						<button class="Addtocart__btn">Thêm vào giỏ hàng</button>
					</a>
					<a href="login.jsp">
						<button class="BuyBtn">Mua Ngay</button>
					</a>
				<%
				} else {
				%>
				<a href="cart?bid=<%=b.getBookID()%>&&uid=<%=us.getId()%>">
					<button class="Addtocart__btn">Thêm vào giỏ hàng</button>
				</a>
				<a href="Buy?bid=<%=b.getBookID()%>&&uid=<%=us.getId()%>">
					<button class="BuyBtn">Mua Ngay</button>
				</a>
				<%
				}
				%>
			</div>
		</div>
	</div>
	
	<div class="grid" style="margin-top: 5%; background-color: #ffffff">
		<div style="padding: 10px 10px">
			<h2>Thông tin sản phẩm</h2>
			<p class="book_detail">
				<%=b.getBookDetail() %>
			</p>
		</div>
	</div>
	
	<!-- Sách gợi ý theo thể loại -->
				<% 
				BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
				List<BookDtls> list = dao2.getBookByCategory(b.getBookCategory(),b.getBookName());
				int i=0;
				for(BookDtls b2: list) {
					i++;
				}%>
				<%
				if (i!=0) {
				%>	
				<div class="grid" style="margin-top: 3%">
				<div class="container">
				<div class="title">
					<h2 class="title__text">Sách Cùng thể loại</h2>
				</div>
				<div class="row">
				<%
				} 
				%> 

				<%
				for(BookDtls b2: list) {
				%>
				<%
				if (i!=0) {
				%>	
				<div class="col-md-3 book__product">
					<div class="card crd-ho">
						<div class="card-body">
						<a href="view_books.jsp?bid=<%=b2.getBookID() %>" style="text-decoration: none; color: #333;">
							<div class="text-center">
								<img src="book/<%=b2.getPhotoName() %>" alt=""
									style="width: 80%; height: 50%" class="img-thumblin">
							</div>
							<%
							if (b.getBookCategory().equals("Cũ")) {
							%>	
								<p style="font-size: 1.6rem"><%=b2.getBookName() %> (Cũ)
								<p>	
								<p style="font-size: 1.6rem">Người bán: <%=b2.getEmail() %>
								<p>	
							<%
							} else {
							%>
								<p style="font-size: 1.6rem"><%=b2.getBookName() %>
								<p>
							<%
							}
							%> 
							<p style="font-size: 1.6rem"><%=b2.getAuthor() %>
							<p>
							<p style="font-size: 1.6rem; color: #c92127"><%=b2.getPrice() %>đ</p>
							<div class="text-center">
							<%
							if (us == null) {
							%>	
								<a href="login.jsp">
									<button class="Addtocarthome__btn">Thêm vào giỏ hàng</button>
								</a> 
							<%
							} else {
							%> 
								<%
								if (!us.getName().equals("Admin")) {
								%>	
									<a href="cart?bid=<%=b2.getBookID() %>&&uid=<%=us.getId() %>">
										<button class="Addtocarthome__btn">Thêm vào giỏ hàng</button>
									</a> 
								<%
								} else {
								%>
									<a href="">
										<button class="Addtocarthome__btn">Thêm vào giỏ hàng</button>
									</a> 
								<%
								}
								%> 
							<% 
							}
							%>	
							</div>
						</a>
						</div>
					</div>
				</div>
				<%
				} 
				%> 
				<%
				}
				%>
			</div>
			<%
			if (b.getBookCategory().equals("Sách văn học") && i!=0) {
			%>	
			<div class="text-center mt1">
				<a href="all_literary_book.jsp"><button class="Viewall__btn">Xem Thêm</button></a>
			</div>		
			<%
			} else if (b.getBookCategory().equals("Sách giáo khoa") && i!=0) {
			%>
			<div class="text-center mt1">
				<a href="all_SGK_book.jsp"><button class="Viewall__btn">Xem Thêm</button></a>
			</div>		
			<%
			}else if (b.getBookCategory().equals("Cũ") && i!=0) {
			%>
			<div class="text-center mt1">
			<a href="all_SGK_book.jsp"><button class="Viewall__btn">Xem Thêm</button></a>
			</div>		
			<%
			}else if (b.getBookCategory().equals("Sách nước ngoài") && i!=0) {
			%>
			<div class="text-center mt1">
			<a href="all_foreign_book.jsp"><button class="Viewall__btn">Xem Thêm</button></a>
			</div>		
			<%
			}
			%> 
		</div>
	</div>
<!-- 	End of Sách cùng thể loại -->
	
	<!-- Sách cùng tác giả -->
				<% 
				BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
				List<BookDtls> list2 = dao3.getBookByAuthor(b.getAuthor(),b.getBookName());
				int i2=0;
				for(BookDtls b2: list2) {
					i2++;
				}%>
				<%
				if (i2!=0) {
				%>	
				<div class="grid" style="margin-top: 3%">
				<div class="container">
				<div class="title">
					<h2 class="title__text">Sách Cùng tác giả</h2>
				</div>
				<div class="row">
				<%
				} 
				%> 

				<%
				for(BookDtls b2: list2) {
				%>
				<%
				if (i2!=0) {
				%>	
				<div class="col-md-3 book__product">
					<div class="card crd-ho">
						<div class="card-body">
						<a href="view_books.jsp?bid=<%=b2.getBookID() %>" style="text-decoration: none; color: #333;">
							<div class="text-center">
								<img src="book/<%=b2.getPhotoName() %>" alt=""
									style="width: 80%; height: 50%" class="img-thumblin">
							</div>
							<%
							if (b.getBookCategory().equals("Cũ")) {
							%>	
								<p style="font-size: 1.6rem"><%=b2.getBookName() %> (Cũ)
								<p>	
								<p style="font-size: 1.6rem">Người bán: <%=b2.getEmail() %>
								<p>	
							<%
							} else {
							%>
								<p style="font-size: 1.6rem"><%=b2.getBookName() %>
								<p>
							<%
							}
							%> 
							<p style="font-size: 1.6rem"><%=b2.getAuthor() %>
							<p>
							<p style="font-size: 1.6rem; color: #c92127"><%=b2.getPrice() %>đ</p>
							<div class="text-center">
							<%
							if (us == null) {
							%>	
								<a href="login.jsp">
									<button class="Addtocarthome__btn">Thêm vào giỏ hàng</button>
								</a> 
							<%
							} else {
							%> 
								<%
								if (!us.getName().equals("Admin")) {
								%>	
									<a href="cart?bid=<%=b2.getBookID() %>&&uid=<%=us.getId() %>">
										<button class="Addtocarthome__btn">Thêm vào giỏ hàng</button>
									</a> 
								<%
								} else {
								%>
									<a href="">
										<button class="Addtocarthome__btn">Thêm vào giỏ hàng</button>
									</a> 
								<%
								}
								%> 
							<% 
							}
							%>	
							</div>
						</a>
						</div>
					</div>
				</div>
				<%
				} 
				%> 
				<%
				}
				%>
			</div>
		</div>
	</div>
	<!-- End of Sách cùng tác giả -->	
	
	<!-- Sách cũ cùng tên -->
	        <%
			if (!b.getBookCategory().equals("Cũ")) {
			%>	
				<% 
				BookDAOImpl dao4 = new BookDAOImpl(DBConnect.getConn());
				List<BookDtls> list3 = dao4.getBookByOldSameName(b.getBookName());
				int i3=0;
				for(BookDtls b2: list3) {
					i3++;
				}%>
				<%
				if (i3!=0) {
				%>	
				<div class="grid" style="margin-top: 3%">
				<div class="container">
				<div class="title">
					<h2 class="title__text">Sách Cũ</h2>
				</div>
				<div class="row">
				<%
				} 
				%> 

				<%
				for(BookDtls b2: list3) {
				%>
				<%
				if (i3!=0) {
				%>	
					<div class="col-md-3 book__product">
						<div class="card crd-ho">
							<div class="card-body">
							<a href="view_books.jsp?bid=<%=b2.getBookID() %>" style="text-decoration: none; color: #333;">
								<div class="text-center">
									<img src="book/<%=b2.getPhotoName() %>" alt=""
										style="width: 80%; height: 50%" class="img-thumblin">
								</div>
								<%
								if (b2.getBookCategory().equals("Cũ")) {
								%>	
									<p style="font-size: 1.6rem"><%=b2.getBookName() %>(Cũ)
									<p>	
									<p style="font-size: 1.6rem">Người bán: <%=b2.getEmail() %>
									<p>	
								<%
								} else {
								%>
									<p style="font-size: 1.6rem"><%=b2.getBookName() %>
									<p>
								<%
								}
								%> 
								<p style="font-size: 1.6rem"><%=b2.getAuthor() %>
								<p>
								<p style="font-size: 1.6rem; color: #c92127"><%=b2.getPrice() %>đ</p>
								<div class="text-center">
								<%
								if (us == null) {
								%>	
									<a href="login.jsp">
										<button class="Addtocarthome__btn">Thêm vào giỏ hàng</button>
									</a> 
								<%
								} else {
								%> 
									<%
									if (!us.getName().equals("Admin")) {
									%>	
										<a href="cart?bid=<%=b2.getBookID() %>&&uid=<%=us.getId() %>">
											<button class="Addtocarthome__btn">Thêm vào giỏ hàng</button>
										</a> 
									<%
									} else {
									%>
										<a href="">
											<button class="Addtocarthome__btn">Thêm vào giỏ hàng</button>
										</a> 
									<%
									}
									%> 
								<% 
								}
								%>	
								</div>
							</a>
							</div>
						</div>
					</div>
					<%
					} 
					%> 
					<%
					}
					%>
				</div>
				</div>
			</div>
			<%
			}
	        %>
	<!-- End of Sách cũ cùng loại -->
	<%
	if (us != null) {
	%>
	<div class="grid" style="margin-top: 5%">
		<div class="comment">
		<h2 style="padding: 10px 10px">Bình luận</h2>
		</div>
				<div class="pb-cmnt-container">
				    <div class="row">
				        <div class="col-md-12 col-md-offset-3">
				            <div class="panel panel-info">
				                <div class="panel-body">
				                <form action="comment?bid=<%=b.getBookID() %>&&uid=<%=us.getId() %>&&email=<%=us.getEmail() %>" method="post" class="form-inline">
				                    <textarea placeholder="Viết bình luận của bạn tại đây" class="pb-cmnt-textarea" name="commenttext"></textarea>
				                   	<button class="comment_button" type="submit">Đăng bài</button>
				                 </form>
				                </div>
				          </div>
				 </div>
				</div>
		</div>
	</div>
	<% 
	CommentDAOImpl dao5 = new CommentDAOImpl(DBConnect.getConn());
	List<Comment> list4 = dao5.getCommentByBookId(b.getBookID());
	int i4 = 0;
	for(Comment c: list4) {
		i4 = i4 +1;
	}
	%>
	<%
	if (i4 != 0) {
	%>	
	<div class="grid" style="margin-top: 2%">
		<div class="usercomment">
		<h2 style="padding: 10px 10px">Bình luận của người dùng</h2>
	</div>
	<%
	}
	%>
		<% 
		for(Comment c: list4) {
		%>
				<div class="Comment__content" style="width: 100%; background-color: white; padding: 10px 10px 15px 10px">
					<p style="font-size: 2rem; color: #395898"><%=c.getEmail() %><p>
					<div class="Comment__content--text">
						<P><%=c.getComment() %></P>
					</div>
				</div>
		<%
		}
		%>
	</div>	
	<%
	}else {
		%>
		<div class="grid" style="margin-top: 5%">
			<div class="comment">
			<h2 style="padding: 10px 10px">Bình luận</h2>
					</div>
					<div class="pb-cmnt-container">
					    <div class="row">
					        <div class="col-md-12 col-md-offset-3">
					            <div class="panel panel-info">
					                <div class="panel-body">
					                <form action="login.jsp" method="post" class="form-inline">
					                    <textarea placeholder="Viết bình luận của bạn tại đây" class="pb-cmnt-textarea" name="commenttext"></textarea>
					                   	<button class="comment_button" type="submit">Đăng bài</button>
					                 </form>
					                </div>
					          </div>
					 </div>
					</div>
			</div>
		</div>
		<div class="grid" style="margin-top: 2%">
	<%
	CommentDAOImpl dao5 = new CommentDAOImpl(DBConnect.getConn());
	List<Comment> list4 = dao5.getCommentByBookId(b.getBookID());
	int i4 = 0;
	for(Comment c: list4) {
		i4 = i4 +1;
	}
	%>
	<%
	if (i4 != 0) {
	%>	
	<div class="grid" style="margin-top: 2%">
		<div class="usercomment">
		<h2 style="padding: 10px 10px">Bình luận của người dùng</h2>
	</div>
	<%
	}
	%>
		<% 
		for(Comment c: list4) {
		%>
				<div class="Comment__content" style="width: 100%; background-color: white; padding: 10px 10px 15px 10px">
					<p style="font-size: 2rem; color: #395898"><%=c.getEmail() %><p>
					<div class="Comment__content--text">
						<P><%=c.getComment() %></P>
					</div>
				</div>
		<%
		}
		%>
		</div>	
		<%
	}
	%>
		<%@include file="all_component/footer.jsp"%>
</body>	
</html>