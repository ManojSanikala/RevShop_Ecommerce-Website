package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Products;

public class ProductDAOImpl implements ProductDAO {

    private Connection conn;

    public ProductDAOImpl(Connection conn) {
        super();
        this.conn = conn;
    }

    public ProductDAOImpl() {
        // Default constructor
    }

    @Override
    public boolean addProducts(Products b) {
        boolean f = false;
        try {
            String sql = "insert into products(productname, description, price, productCategory, stock, photo, email) values(?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, b.getProductName());
            ps.setString(2, b.getDescription());
            ps.setString(3, b.getPrice());
            ps.setString(4, b.getProductCategory());
            ps.setInt(5, b.getStock());  // Stock is now int
            ps.setString(6, b.getPhoto());
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
    public List<Products> getAllProducts() {
        List<Products> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM products"; // Ensure the table name and columns are correct
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Products p = new Products();
                p.setProductId(rs.getInt("productId"));
                p.setProductName(rs.getString("productName"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getString("price"));
                p.setProductCategory(rs.getString("productCategory"));
                p.setStock(rs.getInt("stock"));
                p.setPhoto(rs.getString("photo")); // Ensure this column matches your DB
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
      

    @Override
    public Products getProductById(int id) {
        Products b = null;

        try {
            String sql = "SELECT * FROM products WHERE productId=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                b = new Products();
                b.setProductId(rs.getInt(1));
                b.setProductName(rs.getString(2));
                b.setDescription(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setProductCategory(rs.getString(5));
                b.setStock(rs.getInt(6));  // Assuming stock is an integer
                b.setPhoto(rs.getString(7));
                b.setEmail(rs.getString(8));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return b;
    }


    @Override
    public boolean updateEditProducts(Products b) {
        boolean f = false;

        try {
            String sql = "update products set productname=?, description=?, price=?, stock=? where productId=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, b.getProductName());
            ps.setString(2, b.getDescription());
            ps.setString(3, b.getPrice());
            ps.setInt(4, b.getStock());  // Stock is now int
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
            String sql = "DELETE FROM products WHERE productId=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            int i = ps.executeUpdate();
            if (i == 1) {  // Check if one row was affected
                f = true;  // Set f to true if deletion was successful
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f; // Return the status of the deletion
    }


    @Override
    public List<Products> getElectronicProduct() {
        List<Products> productList = new ArrayList<>();
        try {
            String query = "SELECT * FROM products WHERE productcategory = 'Electronics'";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Products p = new Products();
                p.setProductId(rs.getInt("productId"));
                p.setProductName(rs.getString("productName"));
                p.setPhoto(rs.getString("photo"));
                p.setPrice(rs.getString("price"));

                System.out.println("Product: " + p.getProductName()); // Debugging
                productList.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return productList;
    }


    @Override
    public List<Products> getHomeProduct() {
    	List<Products> productList = new ArrayList<>();
        try {
            String query = "SELECT * FROM products WHERE productcategory = 'home'";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Products p = new Products();
                p.setProductId(rs.getInt("productId"));
                p.setProductName(rs.getString("productName"));
                p.setPhoto(rs.getString("photo"));
                p.setPrice(rs.getString("price"));

                System.out.println("Product: " + p.getProductName()); // Debugging
                productList.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return productList;
    }

    @Override
    public List<Products> getFashionProduct() {
    	List<Products> productList = new ArrayList<>();
        try {
            String query = "SELECT * FROM products WHERE productcategory = 'fashion'";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Products p = new Products();
                p.setProductId(rs.getInt("productId"));
                p.setProductName(rs.getString("productName"));
                p.setPhoto(rs.getString("photo"));
                p.setPrice(rs.getString("price"));

                System.out.println("Product: " + p.getProductName()); // Debugging
                productList.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return productList;
    }

    
    private List<Products> getProductsByCategory(String category) {
        List<Products> list = new ArrayList<>();
        Products b = null;

        try {
            String sql = "select * from products where productCategory=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, category);

            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                b = new Products();
                b.setProductId(rs.getInt(1));
                b.setProductName(rs.getString(2));
                b.setDescription(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setProductCategory(rs.getString(5));
                b.setStock(rs.getInt(6));  // Stock is now int
                b.setPhoto(rs.getString(7));
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
    public List<Products> getProductBySearch(String ch) {
        List<Products> list = new ArrayList<>();
        Products b = null;

        try {
            String sql = "select * from products where productname like ? or productCategory like ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + ch + "%");
            ps.setString(2, "%" + ch + "%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                b = new Products();
                b.setProductId(rs.getInt(1));
                b.setProductName(rs.getString(2));
                b.setDescription(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setProductCategory(rs.getString(5));
                b.setStock(rs.getInt(6));  // Stock is now int
                b.setPhoto(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public double getProductPrice(int productId) {
        double price = 0;
        try {
            String query = "SELECT price FROM products WHERE productId = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, productId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                price = rs.getDouble("price");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return price;
    }
    @Override
    public List<Products> getAllElectronicProduct() {
        List<Products> list = new ArrayList<>();
        
        try {
            String sql = "SELECT * FROM products WHERE productCategory=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "electronics");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Products product = new Products();
                product.setProductId(rs.getInt("productId"));
                product.setProductName(rs.getString("productName"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getString("price")); // Change this to double
                product.setProductCategory(rs.getString("productCategory"));
                product.setStock(rs.getInt("stock"));  // Ensure this matches your database schema
                product.setPhoto(rs.getString("photo"));
                product.setEmail(rs.getString("email"));
                list.add(product);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<Products> getAllHomeProduct() {
        List<Products> list = new ArrayList<Products>();
        Products product = null;

        try {
            String sql = "SELECT * FROM products WHERE productCategory=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "home");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                product = new Products();
                product.setProductId(rs.getInt(1));
                product.setProductName(rs.getString(2));
                product.setDescription(rs.getString(3));
                product.setPrice(rs.getString(4));
                product.setProductCategory(rs.getString(5));
                product.setStock(rs.getInt(6));  // Updated to int
                product.setPhoto(rs.getString(7));
                product.setEmail(rs.getString(8));
                list.add(product);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<Products> getAllFashionProduct() {
        List<Products> list = new ArrayList<Products>();
        Products product = null;

        try {
            String sql = "SELECT * FROM products WHERE productCategory=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "fashion");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                product = new Products();
                product.setProductId(rs.getInt(1));
                product.setProductName(rs.getString(2));
                product.setDescription(rs.getString(3));
                product.setPrice(rs.getString(4));
                product.setProductCategory(rs.getString(5));
                product.setStock(rs.getInt(6));  // Updated to int
                product.setPhoto(rs.getString(7));
                product.setEmail(rs.getString(8));
                list.add(product);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    

   

}
