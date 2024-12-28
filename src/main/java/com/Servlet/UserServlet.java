package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDao;
import com.Database.DBConnect;
import com.User.UserDetails;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException{
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		UserDetails details = new UserDetails();
		details.setName(name);
		details.setEmail(email);
		details.setPassword(password);
		
		UserDao userDao = new UserDao(DBConnect.getConnection());
		boolean user = userDao.addUser(details);
		HttpSession session;
		try {
			
			if (user) {
				session = request.getSession();
				session.setAttribute("reg-success", "Registration Sucessful!");
				response.sendRedirect("register.jsp");
			}else {
				session = request.getSession();
				session.setAttribute("reg-failed", "Registration Unsucessful!");
				response.sendRedirect("register.jsp");
				
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	 

}
