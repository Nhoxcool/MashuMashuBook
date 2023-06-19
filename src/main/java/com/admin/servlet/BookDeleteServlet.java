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
import com.DB.DBConnect;
import com.entity.BookDtls;

@WebServlet("/delete")
@MultipartConfig
public class BookDeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id =Integer.parseInt(req.getParameter("id"));
			
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			BookDtls book = dao.getBookById(id);
			boolean f=dao.deleteBooks(id);
			
			HttpSession session = req.getSession();

			if(f)
			{
				if(book.getBookCategory().equals("Cũ"))
				{
					session.setAttribute("succMsg", "Bạn đã xóa thành công");
					resp.sendRedirect("admin/AllOldBook.jsp");
				} else {
				session.setAttribute("succMsg", "Bạn đã xóa thành công");
				resp.sendRedirect("admin/AllBook.jsp");
				}
			}else {
				session.setAttribute("failedMsg", "Xóa không thành công");
				resp.sendRedirect("admin/AllBook.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
