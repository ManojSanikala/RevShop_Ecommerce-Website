package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Wishlist;

public class WishlistDAOImpl  implements WishlistDAO {
	
	private Connection conn;

	public WishlistDAOImpl(Connection conn) {
		this.conn = conn;
	}

	@Override
	public boolean addWishlist(Wishlist w) {

		boolean f = false;
		try {

			String sql = "insert into wishlist(pid,uid,productName,price) values(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, w.getPid());
			ps.setInt(2, w.getUserId());
			ps.setString(3, w.getProductname());
			ps.setDouble(4, w.getPrice());

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
	public List<Wishlist> getProductbyUser(int userId) {
		List<Wishlist> list = new ArrayList<Wishlist>();
		Wishlist w = null;
		try {

			String sql = "select * from wishlist where uId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				w = new Wishlist();
				w.setCid(rs.getInt(1));
				w.setPid(rs.getInt(2));
				w.setUserId(rs.getInt(3));
				w.setProductname(rs.getString(4));
				w.setPrice(rs.getDouble(5));

				list.add(w);
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

			String sql = "delete from wishlist where pid=? and uid=?";
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

