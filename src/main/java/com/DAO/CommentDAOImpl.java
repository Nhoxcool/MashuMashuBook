package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDtls;
import com.entity.Cart;
import com.entity.Comment;

public class CommentDAOImpl implements CommentDAO{

	private Connection conn;
	
	public CommentDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}	
	
	public boolean addComment(Comment cm) {
		boolean f = false;
		
		try {
			String sql = "insert into comment(bid,uid,comment,email) values(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, cm.getBookid());
			ps.setInt(2, cm.getUserid());
			ps.setString(3, cm.getComment());
			ps.setString(4,cm.getEmail());
			int i=ps.executeUpdate();
			if(i==1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	public List<Comment> getCommentByBookId(int bid) {
		List<Comment> list = new ArrayList<Comment>();
		Comment cm=null;
		try {
			String sql ="select * from comment where bid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,bid);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				cm=new Comment();
				cm.setCommentid(rs.getInt(1));
				cm.setBookid(rs.getInt(2));
				cm.setUserid(rs.getInt(3));
				cm.setComment(rs.getString(4));
				cm.setEmail(rs.getString(5));
				list.add(cm);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
}
