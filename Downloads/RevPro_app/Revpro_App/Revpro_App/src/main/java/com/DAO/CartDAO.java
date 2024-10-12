package com.DAO;

import java.util.List;

import com.entity.Cart;
import com.entity.ProductDtls;

public interface CartDAO {

	public boolean addCart(Cart c);

	public List<Cart> getProductbyUser(int userId);

	public boolean deleteProduct(int pid, int uid);
}
