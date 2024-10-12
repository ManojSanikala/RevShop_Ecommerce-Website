package com.DAO;

import java.util.List;

import com.entity.Cart;
import com.entity.Products;

public interface CartDAO {

	public boolean addCart(Cart c);

	public List<Cart> getProductbyUser(int userId);
	public Cart getCartProductById(int productId, int userId);
	
	public boolean updateCart(Cart cart);

	public boolean deleteProduct(int pid, int uid);

	public void removeCartProduct(Cart cartItem);
}
