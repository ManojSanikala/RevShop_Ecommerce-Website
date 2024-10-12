package com.entity;

public class ProductDtls {
	
	private int productId;
	private String productName;
	private String description;
	private String price;
	private String productCategory;
	private String status;
	private String photoName;
	private String email;
	private int id;
	public ProductDtls() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductDtls(String productName, String description, String price, String productCategory, String status,
			String photoName, String email) {
		super();
		this.productName = productName;
		this.description = description;
		this.price = price;
		this.productCategory = productCategory;
		this.status = status;
		this.photoName = photoName;
		this.email = email;
	}
	public int getId() {
        return this.id; // or whatever your logic is
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "ProductDtls [productId=" + productId + ", productName=" + productName + ", description=" + description
				+ ", price=" + price + ", productCategory=" + productCategory + ", status=" + status + ", photoName="
				+ photoName + ", email=" + email + "]";
	}
	
	
	
	

}
