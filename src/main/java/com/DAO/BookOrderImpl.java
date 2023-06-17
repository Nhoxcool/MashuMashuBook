package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDtls;
import com.entity.Book_Order;
import com.mysql.cj.x.protobuf.MysqlxCrud.Order;

public class BookOrderImpl implements BookOrderDAO {

	private Connection conn;
	
	public BookOrderImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public int getOrderNo() {
		int i=1;
		try {
			
			String sql="select * from book_order";
			PreparedStatement ps= conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
 
	public boolean saveOrder(List<Book_Order> blist) {
		boolean f = false;
		try {
			String sql="insert into book_order(oder_id,user_name,email,address,phone,book_name,author,price,payment,photo,orderstatus,bid,bookcategory) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			
			for(Book_Order b:blist)
			{
				ps.setString(1, b.getOrderId());
				ps.setString(2, b.getUserName());
				ps.setString(3, b.getEmail());
				ps.setString(4, b.getFulladd());
				ps.setString(5, b.getPhno());
				ps.setString(6, b.getBookName());
				ps.setString(7, b.getAuthor());
				ps.setString(8, b.getPrice());
				ps.setString(9, b.getPaymentType());
				ps.setString(10,b.getPhotoname());
				ps.setString(11,b.getOrderStatus());
				ps.setInt(12,b.getBid());
				ps.setString(13,b.getBookcategory());
				ps.addBatch();
			}
			
			int[] count= ps.executeBatch();
			conn.commit();
			f = true;
			conn.setAutoCommit(true);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return f;
	}

	public List<Book_Order> getBook(String email) {
		List<Book_Order> list = new ArrayList<Book_Order>();
		Book_Order order = null;
		try {
			String sql ="select * from book_order where email=?";
			 PreparedStatement ps = conn.prepareStatement(sql);
			 ps.setString(1, email);
			 ResultSet rs = ps.executeQuery();
			 while(rs.next())
			 {
				 order = new Book_Order();
				 order.setId(rs.getInt(1));
				 order.setOrderId(rs.getString(2));
				 order.setUserName(rs.getString(3));
				 order.setEmail(rs.getString(4));
				 order.setFulladd(rs.getString(5));
				 order.setPhno(rs.getString(6));
				 order.setBookName(rs.getString(7));
				 order.setAuthor(rs.getString(8));
				 order.setPrice(rs.getString(9));
				 order.setPaymentType(rs.getString(10));
				 order.setPhotoname(rs.getString(11));
				 order.setOrderStatus(rs.getString(12));
				 order.setBid(rs.getInt(13));
				 order.setBookcategory(rs.getString(14));
				 list.add(order);				 
			 }
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public List<Book_Order> getAllBookOrder() {
		List<Book_Order> list=new ArrayList<Book_Order>();
		
		Book_Order order = null;	
		try {
			String sql = "select * from book_order";
			PreparedStatement ps= conn.prepareStatement(sql);			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				order= new Book_Order();
				order.setId(rs.getInt(1));
				order.setOrderId(rs.getString(2));
				order.setUserName(rs.getString(3));
				order.setEmail(rs.getString(4));
				order.setFulladd(rs.getString(5));
				order.setPhno(rs.getString(6));
				order.setBookName(rs.getString(7));
				order.setAuthor(rs.getString(8));
				order.setPrice(rs.getString(9));
				order.setPaymentType(rs.getString(10));
				order.setPhotoname(rs.getString(11));
				order.setOrderStatus(rs.getString(12));
				order.setBid(rs.getInt(13));
				order.setBookcategory(rs.getString(14));
				list.add(order);
			}
			
		} catch (Exception e) {

		}
		
		return list;
	}
		
	public List<Book_Order> getTopBookOrder() {
		List<Book_Order> list=new ArrayList<Book_Order>();
		
		Book_Order order = null;	
		try {
			String sql = "select book_name,author,price,count(book_name) from book_order group by book_name,author,price order by count(book_name) DESC limit 0,4;";
			PreparedStatement ps= conn.prepareStatement(sql);			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				order= new Book_Order();
				order.setBookName(rs.getString(1));
				order.setAuthor(rs.getString(2));
				order.setPrice(rs.getString(3));
				list.add(order);
			}
			
		} catch (Exception e) {

		}
		
		return list;
	}

	
	
	
	public Book_Order getOrderbyId(int orderid) {		
			Book_Order order=null;
			try {
				String sql ="select * from book_order where id=?";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setInt(1,orderid);
				ResultSet rs = ps.executeQuery();
				while(rs.next())
				{
					order= new Book_Order();
					order.setId(rs.getInt(1));
					order.setOrderId(rs.getString(2));
					order.setUserName(rs.getString(3));
					order.setEmail(rs.getString(4));
					order.setFulladd(rs.getString(5));
					order.setPhno(rs.getString(6));
					order.setBookName(rs.getString(7));
					order.setAuthor(rs.getString(8));
					order.setPrice(rs.getString(9));
					order.setPaymentType(rs.getString(10));
					order.setPhotoname(rs.getString(11));
					order.setOrderStatus(rs.getString(12));
					order.setBid(rs.getInt(13));
					order.setBookcategory(rs.getString(14));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return order;
		}

	public boolean updateEditOrderStatus(Book_Order order) {
		boolean f=false;
		try {
			String sql ="update book_order set orderstatus=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,order.getOrderStatus());
			ps.setInt(2,order.getId());
			
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	public boolean deleteOrder(int id) {
		boolean f = false;
		try {
			String sql = "delete from book_order where id=?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setInt(1,id);
			int i = ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	
}
