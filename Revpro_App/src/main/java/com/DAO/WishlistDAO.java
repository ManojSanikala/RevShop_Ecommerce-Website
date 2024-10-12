package com.DAO;

import java.util.List;

import com.entity.Wishlist;

public interface WishlistDAO {
	
	public boolean addWishlist(Wishlist w);

	public List<Wishlist> getProductbyUser(int userId);

	public boolean deleteProduct(int pid, int uid);

}
