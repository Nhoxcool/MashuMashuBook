package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDtls;
import com.entity.Cart;

public class CartDAOImpl implements CartDAO {
	private Connection conn;
	
	public CartDAOImpl(Connection conn) {
		this.conn = conn;
	}
	
	public boolean addCart(Cart c) {
		boolean f = false;
		
		try {
			String sql = "insert into cart(bid,uid,bookName,author,price,total_price,photo,bookcategory) values(?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, c.getBookid());
			ps.setInt(2, c.getUserid());
			ps.setString(3, c.getBookName());
			ps.setString(4, c.getAuthor());
			ps.setDouble(5, c.getPrice());
			ps.setDouble(6, c.getTotalPrice());
			ps.setString(7, c.getPhotoname());
			ps.setString(8, c.getBookCategory());
			int i=ps.executeUpdate();
			if(i==1) {
				f = true;
			}
			
		} catch (Exception e) {
			
		}
		
		return f;
	}

	public List<Cart> getBookByUser(int userId) {
		List<Cart> list = new ArrayList<Cart>();
		Cart c = null;
		double totalPrice = 0;
		try {
			String sql = "select * from cart where uid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				c=new Cart();
				c.setCartid(rs.getInt(1));
				c.setBookid(rs.getInt(2));
				c.setUserid(rs.getInt(3));
				c.setBookName(rs.getString(4));
				c.setAuthor(rs.getString(5));
				c.setPrice(rs.getDouble(6));
				totalPrice = totalPrice + rs.getDouble(7);
				c.setPhotoname(rs.getString(8));
				c.setBookCategory(rs.getString(9));
				c.setTotalPrice(totalPrice);
				list.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public boolean deleteBook(int bid, int uid, int cartid) {
		boolean f = false;
		
		try {
			String sql = "delete from cart where bid=? and uid=? and cartid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, bid);
			ps.setInt(2, uid);
			ps.setInt(3, cartid);
			int i = ps.executeUpdate();
			if(i == 1)
			{
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	public boolean deleteAllBook(int userId) {
		boolean f = false;
		
		try {
			String sql = "delete from cart where uid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			int i = ps.executeUpdate();
			if(i == 1)
			{
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	
}
