package com.DAO;

import java.util.List;

import com.entity.ProductDtls;

public interface ProductDAO {
	
	public boolean addProducts(ProductDtls b);
	
	
	public List<ProductDtls> getAllProducts();
	
	public ProductDtls getProductById(int id);
	
	public  boolean updateEditProducts(ProductDtls b);
	
	public boolean deleteProducts(int id);
	
	public List<ProductDtls> getMilkProduct();
    

    // Method for Paneer Products
    public List<ProductDtls> getPaneerProduct();
    

    // Method for Ghee Products
    public List<ProductDtls> getGheeProduct();
    

    // Method for Curd Products
    public List<ProductDtls> getCurdProduct();
    

    // Method for Ice Creams Products
    public List<ProductDtls> getIceCreamProduct();
    

    // Method for Milk Shake Products
    public List<ProductDtls> getMilkShakeProduct();

    // Method for Lassi Products
    public List<ProductDtls> getLassiProduct();
    

    // Method for Ice Bars Products
    public List<ProductDtls> getIceBarProduct();
    

    // Method for Cheese Products
    public List<ProductDtls> getCheeseProduct();
  

    // Method for Other Products
    public List<ProductDtls> getOtherProduct();
    
 // Method for Milk Products
    public List<ProductDtls> getAllMilkProduct();
    

    // Method for Paneer Products
    public List<ProductDtls> getAllPaneerProduct();
    

    // Method for Ghee Products
    public List<ProductDtls> getAllGheeProduct();
    

    // Method for Curd Products
    public List<ProductDtls> getAllCurdProduct();
    

    // Method for Ice Creams Products
    public List<ProductDtls> getAllIceCreamProduct();
    

    // Method for Milk Shake Products
    public List<ProductDtls> getAllMilkShakeProduct();

    // Method for Lassi Products
    public List<ProductDtls> getAllLassiProduct();
    

    // Method for Ice Bars Products
    public List<ProductDtls> getAllIceBarProduct();
    

    // Method for Cheese Products
    public List<ProductDtls> getAllCheeseProduct();
  

    // Method for Other Products
    public List<ProductDtls> getAllOtherProduct();
    
    public List<ProductDtls> getProductBySearch(String ch);
}
	

