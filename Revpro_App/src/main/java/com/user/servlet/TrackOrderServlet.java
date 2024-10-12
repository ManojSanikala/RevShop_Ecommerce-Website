package com.user.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.entity.Product_Order;
import com.entity.User;
import com.service.OrderService;
import com.service.impl.OrderServiceIMPL;

@WebServlet("/trackOrders")
public class TrackOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private OrderService orderService;

    public TrackOrderServlet() {
        super();
        // Initialize the service
        this.orderService = new OrderServiceIMPL();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userobj") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("userobj");
        List<Product_Order> orderList = orderService.getOrdersByUserEmail(user.getEmail());

        request.setAttribute("orderList", orderList);
        request.getRequestDispatcher("track_orders.jsp").forward(request, response);
    }
}
