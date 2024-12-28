package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.PostDao;
import com.Database.DBConnect;
import com.User.Post;

@WebServlet("/AddNotesServlet")
public class AddNotesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int uid = Integer.parseInt(request.getParameter("uid"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		PostDao postDao = new PostDao(DBConnect.getConnection());
		boolean notes = postDao.addNotes(title, content, uid);
		if(notes) {
			System.out.println("Data Inserted Successfully");
			response.sendRedirect("showNotes.jsp");
		}else {
			System.out.println("Data Not Inserted!");
		}
		
	}

}
