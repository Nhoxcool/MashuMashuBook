package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DB.DBConnect;

@WebServlet("/remove_book")
@MultipartConfig
public class RemoveBookCart extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 
		int bid=Integer.parseInt(req.getParameter("bid"));
		int uid=Integer.parseInt(req.getParameter("uid"));
		int cartid=Integer.parseInt(req.getParameter("cartid"));
		CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
		boolean f = dao.deleteBook(bid,uid,cartid);
		HttpSession session = req.getSession();
		
		if(f)
		{
			session.setAttribute("SuccMsg", "Sách đã được xóa khỏi giỏ hàng");
			resp.sendRedirect("checkout.jsp");
		}else {
			session.setAttribute("failedMsg", "Xóa sách không thành công");
			resp.sendRedirect("checkout.jsp");
		}
	}
	
}
