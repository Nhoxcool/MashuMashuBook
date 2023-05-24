package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			
			HttpSession session = req.getSession(); 
			
			String email = req.getParameter("email");			//Lấy dữ liệu email và password
			String password = req.getParameter("password");	
			
			if ("admin@gmail.com".equals(email) && "admin".equals(password)) {/* check tài khoản admin ==true thì vể trang Admin, ==false thì về trang User */
				
				User us = new User();
				us.setName("Admin");
				session.setAttribute("user", us); /* set attribute cho Admin */
				resp.sendRedirect("admin/home.jsp");			
			}else {
				
				User us = dao.login(email,password);
				if(us!=null)
				{
					session.setAttribute("user", us); /* kiểm tra tài khoản có tồn tại hay không và set attribute cho người dùng*/
					resp.sendRedirect("index.jsp");
				}else {
				session.setAttribute("failed", "Tài khoản không tồn tại"); 
				resp.sendRedirect("login.jsp");
			
				}
				resp.sendRedirect("Home.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
