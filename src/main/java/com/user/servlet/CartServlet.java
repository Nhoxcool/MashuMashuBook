package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import com.entity.Cart;
import com.mysql.cj.Session;

@WebServlet("/cart")
public class CartServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int bid =Integer.parseInt(req.getParameter("bid"));
			int uid =Integer.parseInt(req.getParameter("uid"));
			
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			BookDtls  b=dao.getBookById(bid);
			
			Cart c = new Cart();
			c.setBookid(bid);
			c.setUserid(uid);
			c.setBookName(b.getBookName());
			c.setAuthor(b.getAuthor());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalPrice(Double.parseDouble(b.getPrice()));
			c.setPhotoname(b.getPhotoName());
			
			CartDAOImpl dao2 = new CartDAOImpl(DBConnect.getConn());
			boolean  f = dao2.addCart(c);
			
			HttpSession session =req.getSession();
			
			if(f)
			{
				session.setAttribute("addCart", "Sách đã thêm vào giỏ hàng thành công");
				resp.sendRedirect("view_books.jsp"+"?"+"bid="+bid);
			}else {
				session.setAttribute("addCart", "Sách đã thêm vào giỏ hàng thất bại");
				resp.sendRedirect("view_books.jsp"+"?"+"bid="+bid);
			}
			
		} catch (Exception e) {
			
		}
	}

	
}
