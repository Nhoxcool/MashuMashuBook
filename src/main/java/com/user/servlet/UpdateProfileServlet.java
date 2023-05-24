package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;
@WebServlet("/update_profile")
@MultipartConfig
public class UpdateProfileServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			if(req.getCharacterEncoding()==null)
				req.setCharacterEncoding("UTF-8");
			int id=Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("fullname");
			String email=req.getParameter("email");
			String phno=req.getParameter("phno");
			String password=req.getParameter("password");
			String password2=req.getParameter("password2");
			
			UserDAOImpl dao =new UserDAOImpl(DBConnect.getConn());
			User us = new User();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPassword(password2);
			
			HttpSession session=req.getSession();
			
			boolean f = dao.checkPassword(id, password);
			
			if(f)
			{
				boolean f2 = dao.updateProfile(us);
				if(f2)
				{
					session.setAttribute("SuccMsg", "Sửa thông tin thành công");
					resp.sendRedirect("Edit_profile.jsp");
				}else {
					session.setAttribute("failedMsg", "Sửa thông tin không thành công");
					resp.sendRedirect("Edit_profile.jsp");
				}
			}else {
				session.setAttribute("failedMsg", "Mật khẩu sai");
				resp.sendRedirect("Edit_profile.jsp");
			}
	
			
		} catch (Exception e) {
			
		}
	}
	
}
