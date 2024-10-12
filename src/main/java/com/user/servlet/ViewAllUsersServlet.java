package com.user.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/view_all_users")
public class ViewAllUsersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
        List<User> userList = dao.getAllUsers();
        System.out.println(userList);
        
        // Add the list of users to request attributes
        request.setAttribute("userList", userList);
        
        // Forward the request to the JSP page
        request.getRequestDispatcher("view_all_users.jsp").forward(request, response);
    }
}
