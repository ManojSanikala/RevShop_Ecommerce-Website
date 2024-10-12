package com.service.impl;

import java.util.List;
import com.DAO.ProductOrderImpl;
import com.DB.DBConnect;
import com.entity.Product_Order;
import com.service.OrderService;

public class OrderServiceIMPL implements OrderService {

    private ProductOrderImpl orderDAO;

    public OrderServiceIMPL() {
        this.orderDAO = new ProductOrderImpl(DBConnect.getConn());
    }

    @Override
    public List<Product_Order> getOrdersByUserEmail(String email) {
        return orderDAO.getProduct(email);
    }

    @Override
    public boolean saveOrders(List<Product_Order> orders) {
        return orderDAO.saveOrder(orders);
    }
}
