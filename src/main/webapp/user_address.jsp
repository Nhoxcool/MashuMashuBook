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
<body style="background-color: rgb(189,228,251)">
	<div class="container" style="margin-top: 3%">
		<div class="row" >
			<div class="col-md-4 offset-md-4">
				<div class="card" style="height: 300px; width: 100%">
					<div class="card-body">
						<h2 class="text-center text-success" style="font-size: 2rem">Thêm địa chỉ</h2>
						<form>
								<div class="form-row">
									<div class="form-group col-md-6">
								      <label for="inputEmail4" class="form-control-lg" style="font-size: 1.5rem">Địa Chỉ</label>
								      <input type="text" class="form-control form-control-lg" id="inputEmail4" value="">
									</div>
								    <div class="form-group col-md-6">
								      <label for="inputEmail4" class="form-control-lg" style="font-size: 1.5rem">Thành Phố</label>
								      <input type="text" class="form-control form-control-lg" id="inputEmail4" value="">
									</div>
	
								</div>
								<div class="form-row">
								   <div class="form-group col-md-4">
								      <label for="inputPassword4" class="form-control-lg" style="font-size: 1.5rem">Quận</label>
								      <input type="text" class="form-control form-control-lg" id="inputPassword4" value="">
									</div>
									<div class="form-group col-md-4">
								      <label for="inputEmail4" class="form-control-lg" style="font-size: 1.5rem">Huyện</label>
								      <input type="text" class="form-control form-control-lg" id="inputEmail4" value="">
									</div>
								    <div class="form-group col-md-4">
								      <label for="inputPassword4" class="form-control-lg" style="font-size: 1.5rem">Mã bưu điện</label>
								      <input type="text" class="form-control form-control-lg" id="inputPassword4" value="">
									</div>
								</div>
								<button type="submit" class="AddressButton">Thêm</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 8%"></div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>