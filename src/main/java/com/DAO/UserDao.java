package com.DAO;

import java.util.List;

import com.entity.BookDtls;
import com.entity.User;

public interface UserDao {
	public boolean userRegister(User us); 
	
	public User login(String email,String password);
	
	public List<User> getAllUser();
	
	public boolean checkPassword(int id, String password);
	
	public boolean updateProfile(User us);
}
