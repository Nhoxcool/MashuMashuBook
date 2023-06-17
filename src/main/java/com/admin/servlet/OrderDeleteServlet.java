package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DAO.BookOrderImpl;
import com.DB.DBConnect;

@WebServlet("/deleteorder")
@MultipartConfig
public class OrderDeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id =Integer.parseInt(req.getParameter("orderid"));
			
			BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
			boolean f=dao.deleteOrder(id);
			
			HttpSession session = req.getSession();

			if(f)
			{
				session.setAttribute("succMsgdeleteorder", "Bạn đã xóa thành công");
				resp.sendRedirect("admin/orders.jsp");
			}else {
				session.setAttribute("failedMsgdeleteorder", "Xóa không thành công");
				resp.sendRedirect("admin/orders.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
