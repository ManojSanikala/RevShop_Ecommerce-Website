package com.DAO;

import java.util.List;

import com.entity.User;

public interface UserDAO {
	public boolean userRegister(User us);
	
	public User login(String email,String password);

	List<User> getAllUsers();
	
	// New method to edit/update user details
    public boolean editUser(User us);

	public User getUserById(int id);
	

}
