package com.user.servlet;

import static org.mockito.Mockito.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.DAO.UserDAOImpl;
import com.entity.User;

public class LoginServletTest {

    private LoginServlet servlet;

    @Mock
    private HttpServletRequest request;

    @Mock
    private HttpServletResponse response;

    @Mock
    private HttpSession session;

    @Mock
    private UserDAOImpl userDAO;

    @Mock
    private User user;

    @Before
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);
        servlet = new LoginServlet();
        when(request.getSession()).thenReturn(session);
    }

    @Test
    public void testAdminLogin() throws Exception {
        when(request.getParameter("email")).thenReturn("admin@gmail.com");
        when(request.getParameter("password")).thenReturn("admin");

        servlet.doPost(request, response);

        verify(session).setAttribute(eq("userobj"), any(User.class));
        verify(response).sendRedirect("admin/adminHome.jsp");
    }

    @Test
    public void testSuccessfulUserLogin() throws Exception {
        when(request.getParameter("email")).thenReturn("user@example.com");
        when(request.getParameter("password")).thenReturn("userpass");
        when(userDAO.login("user@example.com", "userpass")).thenReturn(user);

        servlet.doPost(request, response);

        verify(session).setAttribute("userobj", user);
        verify(response).sendRedirect("index.jsp");
    }

    @Test
    public void testFailedLogin() throws Exception {
        when(request.getParameter("email")).thenReturn("user@example.com");
        when(request.getParameter("password")).thenReturn("wrongpass");
        when(userDAO.login("user@example.com", "wrongpass")).thenReturn(null);

        servlet.doPost(request, response);

        verify(session).setAttribute("failedMsg", "Email & Password Invalid");
        verify(response).sendRedirect("login.jsp");
    }
}
