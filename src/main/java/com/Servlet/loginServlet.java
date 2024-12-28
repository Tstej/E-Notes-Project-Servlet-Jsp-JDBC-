package com.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDao;
import com.Database.DBConnect;
import com.User.UserDetails;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		UserDetails details = new UserDetails();
		details.setEmail(email);
		details.setPassword(password);

		UserDao dao = new UserDao(DBConnect.getConnection());
		UserDetails user = dao.login(details);

		if (user != null) {
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("userD", user);
			response.sendRedirect("home.jsp");
		} else {
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("login-failed", "Invalid Username and Password");
			response.sendRedirect("login.jsp");

		}

	}

}
