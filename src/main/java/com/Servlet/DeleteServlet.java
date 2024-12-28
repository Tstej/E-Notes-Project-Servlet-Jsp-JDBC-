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

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Integer noteId = Integer.parseInt(request.getParameter("note_id"));
		
		PostDao postDao = new PostDao(DBConnect.getConnection());
		
		boolean deleteNote = postDao.deleteNote(noteId);
		HttpSession httpSession = null;
		if(deleteNote) {
			httpSession = request.getSession();
			httpSession.setAttribute("deletMsg", "Note Deleted Successfully..!");
			response.sendRedirect("showNotes.jsp");
		}else {
			httpSession = request.getSession();
			httpSession.setAttribute("errorMsg", "Something Went Wrong..!");
			response.sendRedirect("showNotes.jsp");
		}
		
	}

}
