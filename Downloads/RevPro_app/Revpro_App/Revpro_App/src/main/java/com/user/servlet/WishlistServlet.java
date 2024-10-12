package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.DAO.ProductDAOImpl;
import com.DAO.WishlistDAOImpl;
import com.DB.DBConnect;
import com.entity.ProductDtls;
import com.entity.Wishlist;

@WebServlet("/wishlist")
public class WishlistServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			int pid = Integer.parseInt(req.getParameter("pid"));
			int uid = Integer.parseInt(req.getParameter("uid"));

			ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
			ProductDtls b = dao.getProductById(pid);

			Wishlist w = new Wishlist();
			w.setPid(pid);
			w.setUserId(uid);
			w.setProductname(b.getProductName());
			w.setPrice(Double.parseDouble(b.getPrice()));
			w.setTotalPrice(Double.parseDouble(b.getPrice()));

			WishlistDAOImpl dao2 = new WishlistDAOImpl(DBConnect.getConn());
			boolean f = dao2.addWishlist(w);

			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("addWishlist", "Product Added to wishlist");
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
