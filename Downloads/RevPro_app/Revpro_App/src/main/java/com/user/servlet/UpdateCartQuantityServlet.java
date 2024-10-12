package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.DAO.CartDAOImpl;
import com.entity.Cart;
import com.DB.DBConnect;

@WebServlet("/update_cart_quantity")
public class UpdateCartQuantityServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Retrieve product ID and user ID from the form submission
        int productId = Integer.parseInt(request.getParameter("pid"));
        int userId = Integer.parseInt(request.getParameter("uid"));
        String action = request.getParameter("action");  // increment or decrement action
        
        CartDAOImpl cartDAO = new CartDAOImpl(DBConnect.getConn());
        Cart cartItem = cartDAO.getCartProductById(productId, userId);
        
        if (cartItem != null) {
            int currentQuantity = cartItem.getQuantity();

            // Handle the increment or decrement action
            if ("increment".equals(action)) {
                currentQuantity++;
            } else if ("decrement".equals(action) && currentQuantity > 0) {
                currentQuantity--;
            }

            // Update the quantity in the cart item
            cartItem.setQuantity(currentQuantity);
            cartDAO.addCart(cartItem);

            // If the quantity is zero after decrement, remove the item from the cart
            if (currentQuantity <= 0) {
                cartDAO.removeCartProduct(cartItem);  // Add this method in your DAO to remove the item
            } else {
                // Update the database with the new quantity
                cartDAO.updateCart(cartItem);
            }
        }
        
        // Redirect back to the cart page
        response.sendRedirect("cart.jsp");
    }
}
