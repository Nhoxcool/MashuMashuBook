<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sửa địa chỉ</title>
<script src="https://kit.fontawesome.com/852351e3ff.js" crossorigin="anonymous"></script>
<%@include file="all_component/allCss.jsp"%>
	<%@include file="all_component/Navbar.jsp"%>
<body>
	<div class="container" style="margin-top: 3%">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Thêm địa chỉ</h3>
						<form>
								<div class="form-row">
									<div class="form-group col-md-6">
								      <label for="inputEmail4" class="form-control-lg">Địa Chỉ</label>
								      <input type="text" class="form-control form-control-lg" id="inputEmail4" value="">
									</div>
								    <div class="form-group col-md-6">
								      <label for="inputEmail4" class="form-control-lg">Thành Phố</label>
								      <input type="text" class="form-control form-control-lg" id="inputEmail4" value="">
									</div>
	
								</div>
								<div class="form-row">
								   <div class="form-group col-md-4">
								      <label for="inputPassword4" class="form-control-lg">Quận</label>
								      <input type="text" class="form-control form-control-lg" id="inputPassword4" value="">
									</div>
									<div class="form-group col-md-4">
								      <label for="inputEmail4" class="form-control-lg">Huyện</label>
								      <input type="text" class="form-control form-control-lg" id="inputEmail4" value="">
									</div>
								    <div class="form-group col-md-4">
								      <label for="inputPassword4" class="form-control-lg">Mã bưu điện</label>
								      <input type="text" class="form-control form-control-lg" id="inputPassword4" value="">
									</div>
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