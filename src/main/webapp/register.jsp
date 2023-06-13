<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: rgb(189,228,251)">
<%@include file="all_component/Navbar.jsp"%>
					<div class="grid">
						<div class="row">
							<div class="register__form" style="width: 40%; font-size:2.2rem; border-radius: 10px ;margin: 5% auto; background-color: var(--white-color)">
							<h2 style="text-align: center; padding-top: 10px; font-size: 2.5rem">Đăng ký</h2>
							<c:if test="${not empty succMsg }">
								<p class="text-center text-success">${succMsg}</p>
								<c:remove var="succMsg" scope="session"/>
							</c:if>
							
							<c:if test="${not empty failedMsg }">
								<h5 class="text-center text-danger">${failedMsg}</h5>
								<c:remove var="failed" scope="session"/>
							</c:if>							
								
								<form action="register" method="post"> <!-- Setup method Post cho form -->
								  <div class="mb-1">
								    <label for="exampleInputEmail1" class="form-label">Nhập tên tài khoản</label>
								    <input type="text" class="form-control form-control-lg" id="exampleInputEmail1" required="required" name="fullname">
								  </div>						 
								  <div class="mb-3">
								    <label for="exampleInputEmail1" class="form-label">Địa chỉ mail</label>
								    <input type="email" class="form-control form-control-lg" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="email">
								  </div >
								  <div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Số điện thoại</label>
								    <input type="number" class="form-control form-control-lg" id="exampleInputEmail1" required="required" name="phno">
								  </div>	
								  <div class="mb-3">
								    <label for="exampleInputPassword1" class="form-label">Mật khẩu</label>
								    <input type="password" class="form-control form-control-lg" id="exampleInputPassword1" required="required" name="password">
								  </div>
								  <div class="mb-3">
								    <label for="exampleInputPassword1" class="form-label">Nhập lại mật khẩu</label>
								    <input type="password" class="form-control form-control-lg" id="exampleInputPassword1" required="required" name="repassword">
								  </div>
								  <div class="mb-3 form-check">
								    <input type="checkbox" class="form-check-input " id="exampleCheck1"  name="check">
								    <label class="form-check-label" for="exampleCheck1" >tôi đồng ý với điều khoản trên</label>
								  </div>
								  <button type="submit" class="Submit__btn" style="margin-bottom: 15px"> Đăng ký</button>							  
								  </form>
							</div>
						</div>
					</div>
					
			<%@include file="all_component/footer.jsp"%>						
</body>
</html>