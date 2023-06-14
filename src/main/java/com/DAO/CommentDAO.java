package com.DAO;

import java.util.List;

import com.entity.Cart;
import com.entity.Comment;

public interface CommentDAO {
	public boolean addComment(Comment cm);
	
	public List<Comment> getCommentByBookId(int bid);
}
