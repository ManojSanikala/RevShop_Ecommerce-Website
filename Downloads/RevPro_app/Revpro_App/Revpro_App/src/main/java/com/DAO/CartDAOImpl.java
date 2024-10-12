package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart;
import com.entity.ProductDtls;

public class CartDAOImpl implements CartDAO {

	private Connection conn;

	public CartDAOImpl(Connection conn) {
		this.conn = conn;
	}

	@Override
	public boolean addCart(Cart c) {

		boolean f = false;
		try {

			String sql = "insert into cart(pid,uid,productName,price,total_price) values(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, c.getPid());
			ps.setInt(2, c.getUserId());
			ps.setString(3, c.getProductname());
			ps.setDouble(4, c.getPrice());
			ps.setDouble(5, c.getTotalPrice());

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
	public List<Cart> getProductbyUser(int userId) {
		List<Cart> list = new ArrayList<Cart>();
		Cart c = null;
		double totalPrice = 0;
		try {

			String sql = "select * from cart where uId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				c = new Cart();
				c.setCid(rs.getInt(1));
				c.setPid(rs.getInt(2));
				c.setUserId(rs.getInt(3));
				c.setProductname(rs.getString(4));
				c.setPrice(rs.getDouble(5));

				totalPrice = totalPrice + rs.getDouble(6);
				c.setTotalPrice(totalPrice);

				list.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean deleteProduct(int pid, int uid) {

		boolean f = false;
		try {

			String sql = "delete from cart where pid=? and uid=?";
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

}
