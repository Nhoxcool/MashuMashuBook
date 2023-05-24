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
		<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class ="text-center">Chỉnh sửa thông tin</h4>
								<c:if test="${not empty succMsg }">
									<p class="text-center text-success">${succMsg}</p>
									<c:remove var="succMsg" scope="session"/>
								</c:if>
								
								<c:if test="${not empty failedMsg }">
									<p class="text-center text-danger">${failedMsg}</p>
									<c:remove var="failedMsg" scope="session"/>
								</c:if>											
						<form action="update_profile" method="post" enctype="multipart/form-data">
								<input type="hidden" value="${user.id}" name="id">							
							  <div class="mb-1">
								    <label for="exampleInputEmail1" class="form-label form-control-lg">Nhập tên tài khoản</label>
								    <input type="text" class="form-control form-control-lg" id="exampleInputEmail1" required="required" name="fullname" value="${user.name}">
								  </div>						 
								  <div class="mb-3">
								    <label for="exampleInputEmail1" class="form-label form-control-lg">Địa chỉ mail</label>
								    <input type="email" class="form-control form-control-lg" id="exampleInputEmail1"  required="required" name="email" value="${user.email}">
								  </div >
								  <div class="mb-3">
									<label for="exampleInputEmail1" class="form-label form-control-lg">mật khẩu cũ</label>
								    <input type="password" class="form-control form-control-lg" id="exampleInputEmail1" required="required" name="password">
								  </div>	
								  <div class="mb-3">
								    <label for="exampleInputPassword1" class="form-label form-control-lg">mật khẩu mới</label>
								    <input type="password" class="form-control form-control-lg" id="exampleInputPassword1" required="required" name="password2">
								  </div>							
							<button type="submit" class="btn btn-primary" style="width: 100px; margin-left: 40%">Sửa</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>




	<%@include file="all_component/footer.jsp"%>
</body>
</html>