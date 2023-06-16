<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chỉnh Sửa Thông Tin</title>
<script src="https://kit.fontawesome.com/852351e3ff.js" crossorigin="anonymous"></script>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: rgb(189,228,251)">
<%@include file="all_component/Navbar.jsp"%>
		<div class="grid">
		<div class="row" style= "margin-top: 3%;">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h2 class ="text-center" style="font-size: 2rem">Chỉnh sửa thông tin</h2>
								<c:if test="${not empty SuccMsg }">
									<p class="text-center text-success" style="font-size: 2rem;">${SuccMsg}</p>
									<c:remove var="SuccMsg" scope="session"/>
								</c:if>
								
								<c:if test="${not empty failedMsg }">
									<p class="text-center text-danger" style="font-size: 2rem;">${failedMsg}</p>
									<c:remove var="failedMsg" scope="session"/>
								</c:if>											
						<form action="update_profile" method="post" enctype="multipart/form-data">
								<input type="hidden" value="${user.id}" name="id">							
							  <div class="mb-1">
								    <label for="exampleInputEmail1" class="form-label form-control-lg" style="font-size: 2rem">Nhập tên tài khoản</label>
								    <input type="text" class="form-control form-control-lg" id="exampleInputEmail1" required="required" name="fullname" value="${user.name}">
								  </div>						 
								  <div class="mb-3">
								    <label for="exampleInputEmail1" class="form-label form-control-lg" style="font-size: 2rem">Địa chỉ mail</label>
								    <input type="email" class="form-control form-control-lg" id="exampleInputEmail1"  required="required" name="email" value="${user.email}">
								  </div >
								  <div class="mb-3">
									<label for="exampleInputEmail1" class="form-label form-control-lg" style="font-size: 2rem">Mật khẩu cũ</label>
								    <input type="password" class="form-control form-control-lg" id="exampleInputEmail1" required="required" name="password">
								  </div>	
								  <div class="mb-3">
								    <label for="exampleInputPassword1" class="form-label form-control-lg" style="font-size: 2rem">Mật khẩu mới</label>
								    <input type="password" class="form-control form-control-lg" id="exampleInputPassword1" required="required" name="password2">
								  </div>							
							<button type="submit" class="ChangeACCButton">Sửa</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>