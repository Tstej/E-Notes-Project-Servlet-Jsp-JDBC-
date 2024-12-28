package com.DAO;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.User.UserDetails;

public class UserDao {

	private Connection connection;

	public UserDao(Connection connection) {
		super();
		this.connection = connection;
	}

//	Add User Method
	public boolean addUser(UserDetails userDetails) {
		try {
			String query = "INSERT INTO user(name, email, password) VALUES(?, ?, ?)";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, userDetails.getName());
			preparedStatement.setString(2, userDetails.getEmail());
			preparedStatement.setString(3, userDetails.getPassword());

			int i = preparedStatement.executeUpdate();
			if (i == 1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

// Login Method
	public UserDetails login(UserDetails userDetails) {
		UserDetails user = null;
		try {
			String query = "SELECT * FROM user WHERE email = ? AND password = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, userDetails.getEmail());
			preparedStatement.setString(2, userDetails.getPassword());
			ResultSet resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				user = new UserDetails();
				user.setId(resultSet.getInt("id"));
				user.setName(resultSet.getString("name"));
				user.setEmail(resultSet.getString("email"));
				user.setPassword("password");
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return user;

	}

}
