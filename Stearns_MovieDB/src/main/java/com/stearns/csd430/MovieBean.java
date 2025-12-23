/*
  William Stearns
  12/21/25
  CSD430 Project
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
    
    // MODULE 7: Adds a new movie and returns the generated ID for highlighting
    public int addMovieAndGetId(String title, String director, int year, String genre, double rating) {
        String sql = "INSERT INTO will_movies_data (title, director, release_year, genre, rating) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            pstmt.setString(1, title);
            pstmt.setString(2, director);
            pstmt.setInt(3, year);
            pstmt.setString(4, genre);
            pstmt.setDouble(5, rating);
            
            pstmt.executeUpdate();
            
            try (ResultSet rs = pstmt.getGeneratedKeys()) {
                if (rs.next()) {
                    return rs.getInt(1); 
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; 
    }

    // MODULE 7: Retrieves all records to display in the success table
    public ResultSet getAllMovies() throws Exception {
        Connection conn = getConnection();
        String sql = "SELECT * FROM will_movies_data ORDER BY movie_id ASC";
        Statement stmt = conn.createStatement();
        return stmt.executeQuery(sql);
    }
    
 // MODULE 8: Part 3 Update Operation
    public boolean updateMovie(int id, String title, String director, int year, String genre, double rating) {
        String sql = "UPDATE will_movies_data SET title=?, director=?, release_year=?, genre=?, rating=? WHERE movie_id=?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, title);
            pstmt.setString(2, director);
            pstmt.setInt(3, year);
            pstmt.setString(4, genre);
            pstmt.setDouble(5, rating);
            pstmt.setInt(6, id);
            return pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
 // MODULE 9: Delete Operation
    public boolean deleteMovie(int id) {
        String sql = "DELETE FROM will_movies_data WHERE movie_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            int rowsDeleted = pstmt.executeUpdate();
            return rowsDeleted > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}