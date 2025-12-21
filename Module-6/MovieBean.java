/*
  William Stearns
  12/20/25
  CSD430 Module 6
  This JavaBean handles the JDBC connection to the Stearns_MovieDB.
  It provides methods to retrieve movie IDs for the dropdown and 
  full movie records based on a selected ID.
*/

package com.stearns.csd430;

import java.io.Serializable;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MovieBean implements Serializable {
    private String dbUrl = "jdbc:mysql://localhost:3306/CSD430";
    private String user = "student1";
    private String pass = "pass";

    public MovieBean() {}

    // Method to establish the database connection
    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(dbUrl, user, pass);
    }

    // MODULE 6: Fetches movie IDs for the JSP select menu
    public List<Integer> getMovieIds() {
        List<Integer> ids = new ArrayList<>();
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT movie_id FROM will_movies_data")) {
            while (rs.next()) {
                ids.add(rs.getInt("movie_id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ids;
    }

    // MODULE 6: Fetches a single record based on the user's selection
    public ResultSet getMovieById(int id) throws Exception {
        Connection conn = getConnection();
        String sql = "SELECT * FROM will_movies_data WHERE movie_id = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, id);
        return pstmt.executeQuery();
    }
}