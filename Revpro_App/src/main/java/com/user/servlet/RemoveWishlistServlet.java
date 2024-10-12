package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.WishlistDAOImpl;
import com.DB.DBConnect;

@WebServlet("/remove_wishlist")
public class RemoveWishlistServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int pid=Integer.parseInt(req.getParameter("pid"));
		int uid=Integer.parseInt(req.getParameter("uid"));
		
		WishlistDAOImpl dao=new WishlistDAOImpl(DBConnect.getConn());
		boolean f=dao.deleteProduct(pid,uid);
		
		HttpSession session=req.getSession();
		
		if(f) {
			session.setAttribute("succMsg","Product Removed From Cart");
			resp.sendRedirect("wishlist.jsp");
		}else {
			session.setAttribute("failedMsg","Something went wrong");
			resp.sendRedirect("wishlist.jsp");
		}
	}
}
