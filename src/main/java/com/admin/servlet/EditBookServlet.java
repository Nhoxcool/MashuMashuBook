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

@WebServlet("/edditbooks")
@MultipartConfig
public class EditBookServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			if(req.getCharacterEncoding()==null)
				req.setCharacterEncoding("UTF-8");
			int id=Integer.parseInt(req.getParameter("id"));
			String bookname=req.getParameter("bname");
			String author=req.getParameter("author");
			String price=req.getParameter("price");
			String status=req.getParameter("bstatus");
			
			BookDtls b = new BookDtls();
			b.setBookID(id);
			b.setBookName(bookname);
			b.setAuthor(author);
			b.setPrice(price);
			b.setStatus(status);
			
			
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			boolean f=dao.updateEditBooks(b);
			
			HttpSession session = req.getSession();

			if(f)
			{
				session.setAttribute("succMsg", "Bạn đã update sách thành công");
				resp.sendRedirect("admin/AllBook.jsp");
			}else {
				session.setAttribute("failedMsg", "Update không thành công");
				resp.sendRedirect("admin/AllBook.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
