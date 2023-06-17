package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookOrderDAO;
import com.DAO.BookOrderImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import com.entity.Book_Order;
import com.entity.Cart;
@WebServlet("/order")
@MultipartConfig
public class OrderServlet extends HttpServlet {

	/**
	 *
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			HttpSession session = req.getSession();
			
			if(req.getCharacterEncoding()==null)
				req.setCharacterEncoding("UTF-8");
			int id=Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("username");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String diachi = req.getParameter("address");
			String city = req.getParameter("city");
			String quan = req.getParameter("quan");
			String huyen = req.getParameter("huyen");
			String pincode = req.getParameter("pincode");
			String paymentType = req.getParameter("payment");
			String orderstatus = "Đang xử lí";
			
			String fullAdd= diachi+","+quan+","+huyen+","+city;
			
			
			CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
			
			List<Cart> list = dao.getBookByUser(id);

			if(list.isEmpty())
			{
				session.setAttribute("failedMsg", "Vui lòng thêm sản phẩm");
				resp.sendRedirect("checkout.jsp");
			}else {
				BookOrderImpl dao2 = new BookOrderImpl(DBConnect.getConn());

				Book_Order order = null;
							
				ArrayList<Book_Order> orderslist = new ArrayList<Book_Order>();
				Random r = new Random();
				for(Cart c: list)
				{
					order = new Book_Order();
					order.setOrderId("BOOK-ORD-00"+r.nextInt(1000));
					order.setUserName(name);
					order.setEmail(email);
					order.setPhno(phno);
					order.setFulladd(fullAdd);
					order.setBookName(c.getBookName());
					order.setAuthor(c.getAuthor());
					order.setPrice(c.getPrice()+"");
					order.setPaymentType(paymentType);
					order.setPhotoname(c.getPhotoname());
					order.setOrderStatus(orderstatus);
					orderslist.add(order);
				}
				
				if("noselect".equals(paymentType))
				{
					session.setAttribute("failedMsg", "Vui lòng chọn hình thức thanh toán");
					resp.sendRedirect("checkout.jsp");
				}else {
					boolean f = dao2.saveOrder(orderslist);
					
					if(f) {
						
						boolean f2 = dao.deleteAllBook(id);
						if(f2)
						{
							resp.sendRedirect("order_success.jsp");
						}else {
							resp.sendRedirect("order_success.jsp");
						}
					} else {
						session.setAttribute("failedMsg", "Bạn đặt hàng không thành công");
						resp.sendRedirect("checkout.jsp");
					}
				}
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
