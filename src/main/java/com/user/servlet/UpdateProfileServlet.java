package com.user.servlet;

import java.io.IOException;
import java.util.regex.Pattern;

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
			Pattern pUpper = Pattern.compile("^.*[A-Z]+.*$");
			Pattern pLower = Pattern.compile("^.*[a-z]+.*$");
			Pattern pDigit = Pattern.compile("^.*[0-9]+.*$");
			Pattern pSpecial = Pattern.compile("^.*[#?!@$%^&*-]+.*$");
			Pattern pLength = Pattern.compile("^.{8,}$");
			if(f)
			{
				if (pUpper.matcher(password2).find())
				{
					if(pLower.matcher(password2).find()) 
					{
						if(pDigit.matcher(password2).find()) 
						{
							if(pSpecial.matcher(password2).find())
							{
								if(pLength.matcher(password2).find()) 
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
									session.setAttribute("failedMsg", "Mật khẩu không đúng định dạng!(Mật khẩu phải dài ít nhất 8 ký tự)");
									resp.sendRedirect("Edit_profile.jsp");
								}

							} else {
								session.setAttribute("failedMsg", "Mật khẩu không đúng định dạng!(Mật khẩu bao gồm ít nhất 1 ký tự đặc biệt)");
								resp.sendRedirect("Edit_profile.jsp");
							}
						}else {
							session.setAttribute("failedMsg", "Mật khẩu không đúng định dạng!(Mật khẩu bao gồm ít nhất 1 chữ số)");
							resp.sendRedirect("Edit_profile.jsp");
						}
					}else {
						session.setAttribute("failedMsg", "Mật khẩu không đúng định dạng!(Mật khẩu bao gồm ít nhất 1 chữ cái viết thường)");
						resp.sendRedirect("Edit_profile.jsp");
					}

				}else {
					session.setAttribute("failedMsg", "Mật khẩu không đúng định dạng!(Mật khẩu bao gồm ít nhất 1 chữ cái viết Hoa)");
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
