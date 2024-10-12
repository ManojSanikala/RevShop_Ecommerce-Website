package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Products;
import com.entity.Product_Order;
import com.entity.*;
public class ProductOrderImpl implements ProductOrderDAO {
	
	private  Connection conn;

	public ProductOrderImpl(Connection conn) {
		super();
		this.conn = conn;
	}
	Products pd = new Products();

	@Override
	public boolean saveOrder(List<Product_Order> blist) {
	    boolean f = false;
	    try {
	        // Modify the SQL query to include the user_id from the users table using a subquery
	        String sql = "INSERT INTO product_order(orderid, user_id, username, email, fulladd, phoneno, productname, price, paymenttype) " +
	                     "VALUES (?, (SELECT u.id FROM users u WHERE u.email = ?), ?, ?, ?, ?, ?, ?, ?)";

	        conn.setAutoCommit(false); // Start transaction
	        PreparedStatement ps = conn.prepareStatement(sql);

	        // Loop through the list of Product_Order objects
	        for (Product_Order b : blist) {
	            // Ensure the email corresponds to a user in the users table
	            String userEmail = b.getEmail();
	            if (userEmail == null || userEmail.isEmpty()) {
	                throw new Exception("Email is null or empty. Cannot insert record without a valid email.");
	            }

	            ps.setString(1, b.getOrderId());    // Order ID
	            ps.setString(2, b.getEmail());      // Email (used in subquery to fetch user_id)
	            ps.setString(3, b.getUserName());   // Username
	            ps.setString(4, b.getEmail());      // User's email
	            ps.setString(5, b.getFulladd());    // Full address
	            ps.setString(6, b.getPhoneNo());    // Phone number
	            ps.setString(7, b.getProductName()); // Product name
	            ps.setString(8, b.getPrice());       // Price
	            ps.setString(9, b.getPaymentType()); // Payment type

	            // Add the query to the batch
	            ps.addBatch();
	        }

	        // Execute the batch insertion
	        int[] count = ps.executeBatch();
	        conn.commit(); // Commit the transaction
	        f = true;     // If everything was successful, set flag to true
	        conn.setAutoCommit(true); // Reset auto-commit behavior

	    } catch (Exception e) {
	        try {
	            // Rollback in case of any errors
	            conn.rollback();
	        } catch (Exception rollbackEx) {
	            rollbackEx.printStackTrace();
	        }
	        e.printStackTrace();
	    }
	    return f;
	}


	@Override
	public List<Product_Order> getProduct(String email) {
		List<Product_Order> list=new ArrayList<Product_Order>();
		Product_Order o=null;
		User u = new User();
		
		 try {
			 
			 String sql="select * from product_order where email=?";
			 PreparedStatement ps= conn.prepareStatement(sql);
			 ps.setString(1, email);
			 ResultSet rs=ps.executeQuery();
			 while(rs.next()) {
				 o=new Product_Order();
				// o.setId(rs.getInt(1));
				 o.setOrderId(rs.getString(1));
				 o.setUserName(rs.getString(2));
				 o.setEmail(rs.getString(3));
				 o.setFulladd(rs.getString(4));
				 o.setPhoneNo(rs.getString(5));
				 o.setProductName(rs.getString(6));
				 o.setPrice(rs.getString(7));
				 o.setPaymentType(rs.getString(8));
				 list.add(0, o);
			 } 
		 }catch (Exception e) {
			 e.printStackTrace();
		 }
		return list;
	}

	@Override
	public List<Product_Order> getAllOrders() {
		List<Product_Order> list=new ArrayList<Product_Order>();
		Product_Order o=null;
		
		 try {
			 
			 String sql="select * from product_order";
			 PreparedStatement ps= conn.prepareStatement(sql);
			 ResultSet rs=ps.executeQuery();
			 while(rs.next()) {
				 o=new Product_Order();
				 //o.setId(rs.getUser(1));
				 o.setOrderId(rs.getString(1));
				 o.setUserName(rs.getString(2));
				 o.setEmail(rs.getString(3));
				 o.setFulladd(rs.getString(4));
				 o.setPhoneNo(rs.getString(5));
				 o.setProductName(rs.getString(6));
				 o.setPrice(rs.getString(7));
				 o.setPaymentType(rs.getString(8));
				 list.add(0, o);
			 } 
		 }catch (Exception e) {
			 e.printStackTrace();
		 }
		return list;
	}

	
	}
	
	

