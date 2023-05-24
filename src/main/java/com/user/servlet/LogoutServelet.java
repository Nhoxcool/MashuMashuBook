package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
@MultipartConfig
public class LogoutServelet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();
			session.removeAttribute("user");
			
			HttpSession session2 = req.getSession();
			session.setAttribute("succMsg", "Đăng xuất thành công");
			resp.sendRedirect("login.jsp");
			
		} catch (Exception e) {
			
		}
	}
	
}
