package com.entity;

public class Products {
	
	private int productId;
	private String productName;
	private String description;
	private String price;  // Consider changing this to BigDecimal or float/double for proper price handling
	private String productCategory;
	private int stock;  // Changed from String to int
	private String photo;
	private String email;
	private User id;

	public Products() {
		super();
		// Default constructor
	}

	// Constructor with parameters
	public Products(String productName, String description, String price, String productCategory, int stock,  // stock as int
			String photo, String email) {
		super();
		this.productName = productName;
		this.description = description;
		this.price = price;
		this.productCategory = productCategory;
		this.stock = stock;  // stock as int
		this.photo = photo;
		this.email = email;
	}

	// Setters and Getters
	public void setId(User id) {
		this.id = id;
	}

	public User getId() {
		return this.id;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String d) {
		this.price = d;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public int getStock() {  // Changed to int
		return stock;
	}

	public void setStock(int stock) {  // Changed to int
		this.stock = stock;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Products [productId=" + productId + ", productName=" + productName + ", description=" + description
				+ ", price=" + price + ", productCategory=" + productCategory + ", stock=" + stock + ", photo="
				+ photo+ ", email=" + email + "]";
	}
}
