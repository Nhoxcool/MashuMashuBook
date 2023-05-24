package com.DAO;
import java.sql.Connection;

import com.entity.BookDtls;
import com.entity.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAOImpl implements UserDao{
	
	private Connection conn;

	public UserDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean userRegister(User us) { /* insert dữ liệu tài khoản đăng nhập */
		boolean f=false;
		
		try {
			String sql = "insert into user(name,email,phno,password) value(?,?,?,?)";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1,us.getName());
			ps.setString(2,us.getEmail());
			ps.setString(3,us.getPhno());
			ps.setString(4,us.getPassword());
			
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

	public User login(String email, String password) { 
	User us = null;	
		try {
			String sql="select * from user where email =? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) //Nếu có dữ liệu trong Query
			{
				us = new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPassword(rs.getString(5));
				us.setDiachi(rs.getString(6));
				us.setQuan(rs.getString(7));
				us.setCity(rs.getString(8));
				us.setHuyen(rs.getString(9));
				us.setPincode(rs.getString(10));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return us;
	}
	
	
	public List<User> getAllUser() {
		List<User> list=new ArrayList<User>();
		User b = null;
		
		
		try {
			String sql = "select * from user";
			PreparedStatement ps= conn.prepareStatement(sql);			//Lấy hết sách có trong Database
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				b= new User();
				b.setId(rs.getInt(1));
				b.setName(rs.getString(2));
				b.setEmail(rs.getString(3));				
				b.setPhno(rs.getString(4));
				b.setPassword(rs.getString(5));
				b.setDiachi(rs.getString(6));
				b.setQuan(rs.getString(7));
				b.setCity(rs.getString(8));
				b.setHuyen(rs.getString(9));
				list.add(b);
			}
			
		} catch (Exception e) {

		}
		
		return list;
	}

	public boolean checkPassword(int id, String password) {
		
		boolean f=false;
		try {
			String sql ="select * from user where id=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	public boolean updateProfile(User us) {
		boolean f=false;
		try {
			String sql ="update user set name=?, email=?, password=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPassword());
			ps.setInt(4, us.getId());
			
			int i = ps.executeUpdate();
			if (i==1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
		
		
	}
	
	
	
	
}
