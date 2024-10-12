package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart;
import com.entity.Products;

public class CartDAOImpl implements CartDAO {

	private Connection conn;

	public CartDAOImpl(Connection conn) {
		this.conn = conn;
	}

	@Override
	public boolean addCart(Cart c) {
	    boolean f = false;
	    try {
	        // Check if the product already exists in the cart for the user
	        String checkQuery = "SELECT quantity FROM cart WHERE productid=? AND id=?";
	        PreparedStatement checkStmt = conn.prepareStatement(checkQuery);
	        checkStmt.setInt(1, c.getPid());
	        checkStmt.setInt(2, c.getUserId());

	        ResultSet rs = checkStmt.executeQuery();

	        if (rs.next()) {
	            // Product exists, update the quantity and total price
	            int currentQuantity = rs.getInt("quantity");
	            int newQuantity = currentQuantity + c.getQuantity(); // Increment the quantity

	            String updateQuery = "UPDATE cart SET quantity=?, totalPrice=? WHERE productid=? AND id=?";
	            PreparedStatement updateStmt = conn.prepareStatement(updateQuery);
	            updateStmt.setInt(1, newQuantity);
	            double total = newQuantity * c.getPrice();
	            updateStmt.setDouble(2, total); // Update total price
	            updateStmt.setInt(3, c.getPid());
	            updateStmt.setInt(4, c.getUserId());

	            int i = updateStmt.executeUpdate();
	            if (i == 1) {
	                f = true;
	               // System.out.println("Product quantity updated in cart.");
	            } else {
	               // System.out.println("Failed to update product in cart.");
	            }
	        } else {
	            // If the product is not in the cart, insert it as a new row
	            String insertQuery = "INSERT INTO cart(productid, id, productName, price, totalPrice, quantity) VALUES(?,?,?,?,?,?)";
	            PreparedStatement insertStmt = conn.prepareStatement(insertQuery);
	            insertStmt.setInt(1, c.getPid());
	            insertStmt.setInt(2, c.getUserId());
	            insertStmt.setString(3, c.getProductname());
	            insertStmt.setDouble(4, c.getPrice());
	            insertStmt.setDouble(5, c.getPrice() * (c.getQuantity() + 1)); // Initial totalPrice = price * 1
	            insertStmt.setInt(6, c.getQuantity() + 1); // Use the actual passed quantity

	            int i = insertStmt.executeUpdate();
	            if (i == 1) {
	                f = true;
	               // System.out.println("Product added to cart.");
	            } else {
	               // System.out.println("Failed to add product to cart.");
	            }
	        }

	    } catch (Exception e) {
	        e.printStackTrace(); // Print any exception that occurs
	        System.out.println("Error adding product to cart: " + e.getMessage());
	    }
	    return f;
	}



	@Override
	public List<Cart> getProductbyUser(int userId) {
	    List<Cart> list = new ArrayList<Cart>();
	    Cart c = null;
	    
	    try {
	        String sql = "SELECT * FROM cart WHERE id=?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setInt(1, userId);
	        
	        ResultSet rs = ps.executeQuery();
	        
	        while (rs.next()) {
	            c = new Cart();
	            c.setCid(rs.getInt("cid"));
	            c.setPid(rs.getInt("productid"));
	            c.setUserId(rs.getInt("id"));
	            c.setProductname(rs.getString("productname"));
	            c.setPrice(rs.getDouble("price"));
	            c.setQuantity(rs.getInt("quantity"));
	            
	            // Calculate the total price for this specific product
	            double totalPrice = rs.getDouble("price") * rs.getInt("quantity");
	            c.setTotalPrice(totalPrice);
	            
	            list.add(c);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}

	
	@Override
	public Cart getCartProductById(int productId, int userId) {
	    Cart cartItem = null;
	    try {
	        String query = "SELECT * FROM cart WHERE productid=? AND id=?";
	        PreparedStatement pstmt = conn.prepareStatement(query);
	        pstmt.setInt(1, productId);
	        pstmt.setInt(2, userId);
	        ResultSet rs = pstmt.executeQuery();
	        //System.out.println(rs);
	        if (rs.next()) {
	            cartItem = new Cart();
	            cartItem.setCid(rs.getInt("cid"));
	            cartItem.setProductname(rs.getString("productname"));
	            cartItem.setPrice(rs.getDouble("price"));
	            cartItem.setTotalPrice(rs.getDouble("totalPrice"));
	            cartItem.setQuantity(rs.getInt("quantity")); // Fetch quantity
	            cartItem.setPid(productId);
	            cartItem.setUserId(userId);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return cartItem;
	}

	
	public boolean updateCart(Cart cartItem) {
	    String query = "UPDATE cart SET quantity = ?, totalPrice = ? WHERE productid = ? AND id = ?";
	    boolean updated = false;
	    try (PreparedStatement ps = conn.prepareStatement(query)) {
	        ps.setInt(1, cartItem.getQuantity());
	        ps.setDouble(2, cartItem.getPrice() * cartItem.getQuantity());
	        ps.setInt(3, cartItem.getPid());
	        ps.setInt(4, cartItem.getUserId());
	        updated = ps.executeUpdate() > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return updated;
	}



	@Override
	public boolean deleteProduct(int pid, int uid) {

		boolean f = false;
		try {

			String sql = "delete from cart where productid=? and id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, pid);
			ps.setInt(2, uid);
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
	public void removeCartProduct(Cart cartItem) {
	    String query = "DELETE FROM cart WHERE productid = ? AND id = ?";
	    try (PreparedStatement ps = conn.prepareStatement(query)) {
	        ps.setInt(1, cartItem.getPid());
	        ps.setInt(2, cartItem.getUserId());
	        ps.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}


}