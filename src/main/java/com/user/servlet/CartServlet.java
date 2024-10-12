package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.ProductDAOImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.Products;

// Servlet to handle adding a product to the shopping cart
@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Extract product ID (pid), user ID (uid), and action from the request parameters
            int pid = Integer.parseInt(req.getParameter("pid"));
            int uid = Integer.parseInt(req.getParameter("uid"));
            String action = req.getParameter("action");

            // Create an instance of ProductDAOImpl to retrieve product details
            ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
            Products b = dao.getProductById(pid); // Get product details by product ID

            // Create a new Cart object to represent the item being added to the cart
            Cart c = new Cart();
            c.setPid(pid); // Set product ID in the cart
            c.setUserId(uid); // Set user ID in the cart
            c.setProductname(b.getProductName()); // Set product name in the cart
            c.setPrice(Double.parseDouble(b.getPrice())); // Set product price in the cart
            c.setTotalPrice(Double.parseDouble(b.getPrice())); // Set total price (initially same as product price)

            // Create an instance of CartDAOImpl to add the cart item to the database
            CartDAOImpl dao2 = new CartDAOImpl(DBConnect.getConn());
            boolean f = dao2.addCart(c); // Attempt to add the cart item and store the result (success/failure)
            //System.out.println(f); // Print the result to the console for debugging

            // Get the current session object
            HttpSession session = req.getSession();

            // Set appropriate session attributes based on whether the cart addition was successful
            if (f) {
                session.setAttribute("addCart", "Product Added to cart");
                resp.sendRedirect("cart.jsp"); // Redirect to index.jsp on success
            } else {
                session.setAttribute("failed", "Something went wrong!");
                resp.sendRedirect("index.jsp"); // Redirect to index.jsp on failure
            }

        } catch (Exception e) {
            e.printStackTrace(); // Print any exceptions to the console
        }
    }
}