package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.User;

public class UserDAOImpl implements UserDAO {

	private Connection conn;

	public UserDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean userRegister(User us) {
		boolean f = false;
		try {
			String sql = "insert into users(name,email,phno,password) values(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhno());
			ps.setString(4, us.getPassword());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public User login(String email, String password) {
		User us = null;

		try {

			String sql = "select * from users where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				us = new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhno(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setAddress(rs.getString(6));
				us.setLandmark(rs.getString(7));
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return us;
	}

	// Method to retrieve all users from the database
	@Override
	public List<User> getAllUsers() {
		List<User> userList = new ArrayList<>();

		try {
			String sql = "SELECT * FROM users";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPhno(rs.getString("phno"));
				user.setPassword(rs.getString("password"));
				user.setState(rs.getString("role"));
				// user.setCreated_at(rs.getTimestamp("created_at").toLocalDateTime());

				userList.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return userList;
	}
	
	@Override
    public User getUserById(int id) {
        User user = null;
        String sql = "SELECT * FROM users WHERE id = ?";
        
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return user;
    }


	@Override
	public boolean editUser(User us) {
		boolean isUpdated = false;
		String sql = "UPDATE users SET name=?, email=?, password=? WHERE id=?";

		try (PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPassword());
			ps.setInt(4, us.getId()); // Assuming user ID is the primary key

			int rowsAffected = ps.executeUpdate();
			if (rowsAffected > 0) {
				isUpdated = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isUpdated;
	}
}
