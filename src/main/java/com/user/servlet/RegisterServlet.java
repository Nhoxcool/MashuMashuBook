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

@WebServlet("/register")

public class RegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			
			if(req.getCharacterEncoding()==null)
				req.setCharacterEncoding("UTF-8");
			String name = req.getParameter("fullname");				/*lấy giá trị từ form đăng ký*/
			String email = req.getParameter("email");				
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
			String repassword = req.getParameter("repassword");
			String check = req.getParameter("check");
			
			
			User us = new User();
			us.setName(name);
			us.setEmail(email);					//Set giá trị mới cho User
			us.setPhno(phno);				
			us.setPassword(password);
			
			HttpSession session = req.getSession();
			
			if(check!=null) //check dữ liệu nhập vào
			{
					UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
					boolean f = dao.userRegister(us);
					if (password.equals(repassword))
					{
						if(f) {
							session.setAttribute("succMsg", "Đăng ký thành công");
							resp.sendRedirect("register.jsp");
						}else {
							session.setAttribute("failedMsg", "Sever bị lỗi! Vui lòng thử lại");
							resp.sendRedirect("register.jsp");;
						}
					}
					else{
					session.setAttribute("failedMsg", "Mật khẩu không trùng khớp");
					resp.sendRedirect("register.jsp");
					}
			}
			else 
			{
					session.setAttribute("failedMsg", "Vui lòng đồng ý với điều khoản của chúng tôi");
					resp.sendRedirect("register.jsp");
			}
						
		} catch (Exception e) {
			
		}
	}

	
}
