package com.DAO;

import java.util.List;
import com.entity.Products;

public interface ProductDAO {
	
	public boolean addProducts(Products b);
	
	public double getProductPrice(int productId);
	
	public List<Products> getAllProducts();
	
	public Products getProductById(int id);
	
	public  boolean updateEditProducts(Products b);
	
	public boolean deleteProducts(int id);
	
	public List<Products> getElectronicProduct();
    

    // Method for Home Products
    public List<Products> getHomeProduct();
    

    // Method for Fashion Products
    public List<Products> getFashionProduct();
    
 // Method for Electronic Products
    public List<Products> getAllElectronicProduct();
    

    // Method for Home Products
    public List<Products> getAllHomeProduct();
    

    

    // Method for Fashion Products
    public List<Products> getAllFashionProduct();
    

  
 public List<Products> getProductBySearch(String ch);


	//public double getProductPrice(int productId);
}
	

