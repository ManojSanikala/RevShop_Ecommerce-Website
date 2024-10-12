package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.ProductDAOImpl;
import com.DB.DBConnect;
import com.entity.Products;

@WebServlet("/add_products")
@MultipartConfig
public class ProductsAdd extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Fetching form parameters
            String productName = req.getParameter("pname");
            String description = req.getParameter("description");
            String price = req.getParameter("price");
            String categories = req.getParameter("categories");
            int stock = Integer.parseInt(req.getParameter("stock")); // Parse stock as an integer
            Part part = req.getPart("pimg");
            String fileName = part.getSubmittedFileName();
            
            // Create ProductDtls object (notice stock is now int)
            Products b = new Products(productName, description, price, categories, stock, fileName, "admin");
            
            // Product DAO for database operations
            ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
            boolean f = dao.addProducts(b);
            
            HttpSession session = req.getSession();
            if(f) {
                // File saving logic
                String path = getServletContext().getRealPath("") + "products";
                File file = new File(path);
                part.write(path + File.separator + fileName);
                
                session.setAttribute("succMsg", "Product Added Successfully");
                resp.sendRedirect("admin/add_products.jsp");
            } else {
                session.setAttribute("failedMsg", "Something went wrong");
                resp.sendRedirect("admin/add_products.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
