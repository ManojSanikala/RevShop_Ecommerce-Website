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
import com.entity.ProductDtls;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			int pid = Integer.parseInt(req.getParameter("pid"));
			int uid = Integer.parseInt(req.getParameter("uid"));

			ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
			ProductDtls b = dao.getProductById(pid);

			Cart c = new Cart();
			c.setPid(pid);
			c.setUserId(uid);
			c.setProductname(b.getProductName());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalPrice(Double.parseDouble(b.getPrice()));

			CartDAOImpl dao2 = new CartDAOImpl(DBConnect.getConn());
			boolean f = dao2.addCart(c);

			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("addCart", "Product Added to cart");
				resp.sendRedirect("index.jsp");
			} else {
				session.setAttribute("failed", "Something went wrong!");
				resp.sendRedirect("index.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
