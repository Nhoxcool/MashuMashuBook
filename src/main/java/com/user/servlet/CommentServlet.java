package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CommentDAOImpl;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.Comment;
import com.entity.User;

@WebServlet("/comment")
public class CommentServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			
			if(req.getCharacterEncoding()==null)
				req.setCharacterEncoding("UTF-8");
			int bid =Integer.parseInt(req.getParameter("bid"));
			int uid =Integer.parseInt(req.getParameter("uid"));
			String comment = req.getParameter("commenttext");
			String email =req.getParameter("email");
			
			Comment cm = new Comment();
			cm.setBookid(bid);
			cm.setUserid(uid);;					//Set giá trị mới cho User
			cm.setComment(comment);
			cm.setEmail(email);
			
			HttpSession session = req.getSession();

			CommentDAOImpl dao = new CommentDAOImpl(DBConnect.getConn());
			boolean f = dao.addComment(cm);
			if(f) {
			resp.sendRedirect("view_books.jsp"+"?"+"bid="+bid);
			}else {
			resp.sendRedirect("view_books.jsp"+"?"+"bid="+bid);
			}
	
						
		} catch (Exception e) {
			
		}
	}
}
