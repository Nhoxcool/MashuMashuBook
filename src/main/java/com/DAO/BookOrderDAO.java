package com.DAO;

import java.util.List;

import com.entity.BookDtls;
import com.entity.Book_Order;
import com.mysql.cj.x.protobuf.MysqlxCrud.Order;

public interface BookOrderDAO {
	public int getOrderNo();
	
	public boolean saveOrder(List<Book_Order> b);
	
	public List<Book_Order> getBook(String email);

	public List<Book_Order> getAllBookOrder();
	
	public List<Book_Order> getTopBookOrder();
	
	public Book_Order getOrderbyId(int orderid);
	
	public boolean deleteOrder(int id);
	
	public boolean updateEditOrderStatus(Book_Order order);
}
