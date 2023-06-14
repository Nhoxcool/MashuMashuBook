<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: rgb(189,228,251)">
<%@include file="all_component/Navbar.jsp"%>

					<%
					us = null;
					%>
					<div class="grid">
						<div class="row">
							<div class="register__form" style="width: 40%; font-size:2.2rem; border-radius: 10px ;margin: 12% auto; background-color: var(--white-color)">
							<h2 style="text-align: center; padding-top: 10px; font-size: 2.5rem">Đăng nhập</h2>
							
							<c:if test="${not empty succMsg }">
								<p class="text-center text-success">${succMsg}</p>
								<c:remove var="succMsg" scope="session"/>
							</c:if>
							
							<c:if test="${not empty failedMsg }">
								<p class="text-center text-danger">${failedMsg}</p>
								<c:remove var="failedMsg" scope="session"/>
							</c:if>	
							
							<c:if test="${not empty failed }">
								<h5 class="text-center text-danger">${failed}</h5>
								<c:remove var="failed" scope="session"/>
							</c:if>
								
								<form action="login" method="post">
								  <div class="mb-1">
								    <label for="exampleInputEmail1" class="form-label">Nhập email</label>
								    <input type="text" class="form-control form-control-lg" id="exampleInputEmail1" required="required" name="email">
								  </div>						 
								  <div class="mb-3">
								    <label for="exampleInputPassword1" class="form-label">Mật Khẩu</label>
								    <input type="password" class="form-control form-control-lg" id="exampleInputPassword1" required="required" name="password">
								  </div>
								  <div class="mb-3 form-check">
								    <input type="checkbox" class="form-check-input " id="exampleCheck1">
								    <label class="form-check-label" for="exampleCheck1">Nhớ mật khẩu</label>
								  </div>
								  <div class="text-center">
									  <button type="submit" class="Submit__btn2" style="margin-bottom: 15px"> Đăng Nhập</button>
									  <a href="register.jsp" style="display: block; padding-bottom: 10px">Tạo tài khoản</a>							  
								  </div> 
							  </form>
							</div>
						</div>
					</div>
</body>
</html>