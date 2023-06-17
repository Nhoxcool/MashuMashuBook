package com.user.servlet;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookOrderImpl;
import com.DB.DBConnect;
import com.entity.Book_Order;

@WebServlet("/cancelorderbooks")
@MultipartConfig
public class CancelOrderServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			if(req.getCharacterEncoding()==null)
				req.setCharacterEncoding("UTF-8");
			int orderid=Integer.parseInt(req.getParameter("orderid"));
			String orderstatus="Đã Hủy";
			
			Book_Order b = new Book_Order();
			b.setId(orderid);
			b.setOrderStatus(orderstatus);
			
			
			BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
			boolean f=dao.updateEditOrderStatus(b);
			HttpSession session = req.getSession();

			if(f)
			{
				session.setAttribute("succMsgcancelorder", "Bạn đã hủy đơn hàng thành công");
				resp.sendRedirect("order.jsp");
			}else {
				session.setAttribute("failedMsgcancelorder", "Hủy đơn hàng không thành công");
				resp.sendRedirect("order.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
