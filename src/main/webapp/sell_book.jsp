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
<body style="background-color: #f4f2f0">
	<c:if test="${empty user}">
		<c:redirect url="login.jsp"/>
	</c:if>
		<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class ="text-center">Bán Sách Cũ</h4>
						<form action="add_old_book" method="post" enctype="multipart/form-data">
						
							<input type="hidden" value="${user.email}" name="user">
													
							<div class="form-group form-control-lg">
								<label for="exampleInputBookname" >Tên Sách*</label>
								<input name="bname" type="text" class="form-control form-control-lg" id="exampleInpuBookname" >
							</div>
							<div class="form-group form-control-lg">
								<label for="exampleInputAuthor">Tên Tác Giả</label>
								<input name="author" type="text" class="form-control form-control-lg" id="exampleInputAuthor" >
							</div>
							<div class="form-group form-control-lg">
								<label for="exampleInputPrice">Price*</label>
								<input name="price" type="Number" class="form-control form-control-lg" id="exampleInputPrice" >
							</div>
							<div class="form-group form-control-lg">
								<label for="exampleFromControlFile1">Upload Hình Ảnh</label>
								<input name="bimg" type="file" class="form-control-file" id="exampleFormControlFile1">
							</div>
							
							<button type="submit" class="btn btn-primary" style="width: 100px; margin-left: 40%">Thêm</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>




	<%@include file="all_component/footer.jsp"%>
</body>
</html>