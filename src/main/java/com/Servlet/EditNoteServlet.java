package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.PostDao;
import com.Database.DBConnect;

@WebServlet("/EditNoteServlet")
public class EditNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			Integer noteId = Integer.parseInt(request.getParameter("noteId"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			PostDao postDao = new PostDao(DBConnect.getConnection());
			boolean updatePost = postDao.updatePost(noteId, title, content);
			
			if(updatePost) {
				System.out.println("Post Updated Successfully..!");
				HttpSession  httpSession = request.getSession();
				 httpSession.setAttribute("updateMsg", "Notes Updates Successfully..!");
				 response.sendRedirect("showNotes.jsp");
			}else {
				System.out.println("Post Not Updated..!");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
