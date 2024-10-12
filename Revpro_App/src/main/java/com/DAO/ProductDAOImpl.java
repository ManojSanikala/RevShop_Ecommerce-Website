package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.ProductDtls;

public class ProductDAOImpl implements ProductDAO {

	private Connection conn;

	public ProductDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addProducts(ProductDtls b) {
		boolean f = false;
		try {
			String sql = "insert into product_dtls(productname,description,price,productCategory,status,photo,email) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getProductName());
			ps.setString(2, b.getDescription());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getProductCategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhotoName());
			ps.setString(7, b.getEmail());

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
	public List<ProductDtls> getAllProducts() {

		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b = null;

		try {
			String sql = "select * from product_dtls";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new ProductDtls();
				b.setProductId(rs.getInt(1));
				b.setProductName(rs.getString(2));
				b.setDescription(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setProductCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public ProductDtls getProductById(int id) {

		ProductDtls b = null;

		try {
			String sql = "select * from product_dtls where productId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new ProductDtls();
				b.setProductId(rs.getInt(1));
				b.setProductName(rs.getString(2));
				b.setDescription(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setProductCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return b;
	}

	@Override
	public boolean updateEditProducts(ProductDtls b) {

		boolean f = false;

		try {
			String sql = "update product_dtls set productname=?,description=?,price=?,status=?where productId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getProductName());
			ps.setString(2, b.getDescription());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getProductId());

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
	public boolean deleteProducts(int id) {
		boolean f = false;
		try {
			String sql = "delete from product_dtls where productId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
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
	public List<ProductDtls> getMilkProduct() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();

		ProductDtls b = null;

		try {
			String sql = "select * from product_dtls where productCategory=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Milk");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new ProductDtls();
				b.setProductId(rs.getInt(1));
				b.setProductName(rs.getString(2));
				b.setDescription(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setProductCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<ProductDtls> getPaneerProduct() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();

		ProductDtls b = null;

		try {
			String sql = "select * from product_dtls where productCategory=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Paneer");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new ProductDtls();
				b.setProductId(rs.getInt(1));
				b.setProductName(rs.getString(2));
				b.setDescription(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setProductCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<ProductDtls> getGheeProduct() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();

		ProductDtls b = null;

		try {
			String sql = "select * from product_dtls where productCategory=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Ghee");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new ProductDtls();
				b.setProductId(rs.getInt(1));
				b.setProductName(rs.getString(2));
				b.setDescription(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setProductCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<ProductDtls> getCurdProduct() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();

		ProductDtls b = null;

		try {
			String sql = "select * from product_dtls where productCategory=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Curd");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new ProductDtls();
				b.setProductId(rs.getInt(1));
				b.setProductName(rs.getString(2));
				b.setDescription(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setProductCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<ProductDtls> getIceCreamProduct() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();

		ProductDtls b = null;

		try {
			String sql = "select * from product_dtls where productCategory=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "ice-creams");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new ProductDtls();
				b.setProductId(rs.getInt(1));
				b.setProductName(rs.getString(2));
				b.setDescription(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setProductCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<ProductDtls> getMilkShakeProduct() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();

		ProductDtls b = null;

		try {
			String sql = "select * from product_dtls where productCategory=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "milk-shake");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new ProductDtls();
				b.setProductId(rs.getInt(1));
				b.setProductName(rs.getString(2));
				b.setDescription(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setProductCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<ProductDtls> getLassiProduct() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();

		ProductDtls b = null;

		try {
			String sql = "select * from product_dtls where productCategory=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Lassi");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new ProductDtls();
				b.setProductId(rs.getInt(1));
				b.setProductName(rs.getString(2));
				b.setDescription(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setProductCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<ProductDtls> getIceBarProduct() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();

		ProductDtls b = null;

		try {
			String sql = "select * from product_dtls where productCategory=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "ice-bars");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new ProductDtls();
				b.setProductId(rs.getInt(1));
				b.setProductName(rs.getString(2));
				b.setDescription(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setProductCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<ProductDtls> getCheeseProduct() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();

		ProductDtls b = null;

		try {
			String sql = "select * from product_dtls where productCategory=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Cheese");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new ProductDtls();
				b.setProductId(rs.getInt(1));
				b.setProductName(rs.getString(2));
				b.setDescription(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setProductCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<ProductDtls> getOtherProduct() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();

		ProductDtls b = null;

		try {
			String sql = "select * from product_dtls where productCategory=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "others");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new ProductDtls();
				b.setProductId(rs.getInt(1));
				b.setProductName(rs.getString(2));
				b.setDescription(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setProductCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<ProductDtls> getAllMilkProduct() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();

		ProductDtls b = null;

		try {
			String sql = "select * from product_dtls where productCategory=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Milk");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new ProductDtls();
				b.setProductId(rs.getInt(1));
				b.setProductName(rs.getString(2));
				b.setDescription(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setProductCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<ProductDtls> getAllPaneerProduct() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();

		ProductDtls b = null;

		try {
			String sql = "select * from product_dtls where productCategory=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Paneer");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new ProductDtls();
				b.setProductId(rs.getInt(1));
				b.setProductName(rs.getString(2));
				b.setDescription(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setProductCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<ProductDtls> getAllGheeProduct() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();

		ProductDtls b = null;

		try {
			String sql = "select * from product_dtls where productCategory=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Ghee");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new ProductDtls();
				b.setProductId(rs.getInt(1));
				b.setProductName(rs.getString(2));
				b.setDescription(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setProductCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<ProductDtls> getAllCurdProduct() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();

		ProductDtls b = null;

		try {
			String sql = "select * from product_dtls where productCategory=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Curd");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new ProductDtls();
				b.setProductId(rs.getInt(1));
				b.setProductName(rs.getString(2));
				b.setDescription(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setProductCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<ProductDtls> getAllIceCreamProduct() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();

		ProductDtls b = null;

		try {
			String sql = "select * from product_dtls where productCategory=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "ice-creams");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new ProductDtls();
				b.setProductId(rs.getInt(1));
				b.setProductName(rs.getString(2));
				b.setDescription(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setProductCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<ProductDtls> getAllMilkShakeProduct() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();

		ProductDtls b = null;

		try {
			String sql = "select * from product_dtls where productCategory=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "milk-shake");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new ProductDtls();
				b.setProductId(rs.getInt(1));
				b.setProductName(rs.getString(2));
				b.setDescription(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setProductCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<ProductDtls> getAllLassiProduct() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();

		ProductDtls b = null;

		try {
			String sql = "select * from product_dtls where productCategory=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Lassi");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new ProductDtls();
				b.setProductId(rs.getInt(1));
				b.setProductName(rs.getString(2));
				b.setDescription(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setProductCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<ProductDtls> getAllIceBarProduct() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();

		ProductDtls b = null;

		try {
			String sql = "select * from product_dtls where productCategory=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "ice-bars");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new ProductDtls();
				b.setProductId(rs.getInt(1));
				b.setProductName(rs.getString(2));
				b.setDescription(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setProductCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<ProductDtls> getAllCheeseProduct() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();

		ProductDtls b = null;

		try {
			String sql = "select * from product_dtls where productCategory=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Cheese");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new ProductDtls();
				b.setProductId(rs.getInt(1));
				b.setProductName(rs.getString(2));
				b.setDescription(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setProductCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<ProductDtls> getAllOtherProduct() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();

		ProductDtls b = null;

		try {
			String sql = "select * from product_dtls where productCategory=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "others");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new ProductDtls();
				b.setProductId(rs.getInt(1));
				b.setProductName(rs.getString(2));
				b.setDescription(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setProductCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<ProductDtls> getProductBySearch(String ch) {
		List<ProductDtls> list = new ArrayList<ProductDtls>();

		ProductDtls b = null;

		try {
			String sql = "select * from product_dtls where productname like ? or productCategory like ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new ProductDtls();
				b.setProductId(rs.getInt(1));
				b.setProductName(rs.getString(2));
				b.setDescription(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setProductCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
}