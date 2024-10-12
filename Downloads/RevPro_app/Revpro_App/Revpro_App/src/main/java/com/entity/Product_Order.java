package com.entity;

public class Product_Order {
	
		private int id;
		private String orderId;
		private String userName;
		private String email;
		private String phoneNo;
		private String fulladd;
		private String productName;
		private String price;
		private String paymentType;
		private String status;
		
		public Product_Order() {
			super();
			// TODO Auto-generated constructor stub
		}

		public String getOrderId() {
			return orderId;
		}

		public void setOrderId(String orderId) {
			this.orderId = orderId;
		}

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getUserName() {
			return userName;
		}

		public void setUserName(String userName) {
			this.userName = userName;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getPhoneNo() {
			return phoneNo;
		}

		public void setPhoneNo(String phoneNo) {
			this.phoneNo = phoneNo;
		}

		public String getFulladd() {
			return fulladd;
		}

		public void setFulladd(String fulladd) {
			this.fulladd = fulladd;
		}
		
		public String getProductName() {
			return productName;
		}

		public void setProductName(String productName) {
			this.productName = productName;
		}

		public String getPrice() {
			return price;
		}

		public void setPrice(String price) {
			this.price = price;
		}

		public String getPaymentType() {
			return paymentType;
		}

		public void setPaymentType(String paymentType) {
			this.paymentType = paymentType;
		}
		
		public String getStatus() {
	        return status;
	    }

	    public void setStatus(String status) {
	        this.status = status;
	    }


		@Override
		public String toString() {
			return "Product_Order [id=" + id + ", orderId=" + orderId + ", userName=" + userName + ", email=" + email
					+ ", phoneNo=" + phoneNo + ", fulladd=" + fulladd + ", productName=" + productName + ", price="
					+ price + ", paymentType=" + paymentType + "]";
		}

		
		
}