package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.User.Post;

public class PostDao {
	private Connection connection;

	public PostDao(Connection connection) {
		super();
		this.connection = connection;
	}

	public boolean addNotes(String t, String c, int u) {

		try {
			String query = "INSERT INTO post(title,content,uid) VALUES(?, ?, ?)";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, t);
			preparedStatement.setString(2, c);
			;
			preparedStatement.setInt(3, u);

			int i = preparedStatement.executeUpdate();
			if (i == 1) {
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public List<Post> getData(int id) {
		List<Post> list = new ArrayList<Post>();
		Post post = null;
		try {
			String query = "SELECT * FROM post WHERE uid = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, id);

			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				post = new Post();
				post.setId(resultSet.getInt(1));
				post.setTitle(resultSet.getString(2));
				post.setContent(resultSet.getString(3));
				post.setPdate(resultSet.getTimestamp(4));

				list.add(post);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Post getDataById(int noteId) {
		Post post = null;

		try {
			String query = "SELECT * FROM post WHERE id=?";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, noteId);

			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				post = new Post();
				post.setId(resultSet.getInt(1));
				post.setTitle(resultSet.getString(2));
				post.setContent(resultSet.getString(3));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return post;

	}
	
	
	public boolean updatePost(int nid, String t, String c) {
		try {
			String query = "UPDATE post SET title=?, content=? WHERE id=?";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, t);
			preparedStatement.setString(2, c);
			preparedStatement.setInt(3, nid);
			
			int update = preparedStatement.executeUpdate();
			if(update == 1) {
				return true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
		
	}
	
	public boolean deleteNote(int nid) {
		try {
			String query = "DELETE FROM post WHERE id=?";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, nid);
			
			int delete = preparedStatement.executeUpdate();
			if(delete == 1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
		
	}
	

}
