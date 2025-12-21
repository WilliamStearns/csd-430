package com.stearns.beans;

import java.io.Serializable;

/**
 * William Stearns
 * December 19, 2025
 * CSD430 Module 4
 * JavaBean to hold book data. Implements Serializable.
 */
public class Book implements Serializable {
    private static final long serialVersionUID = 1L;

    // 5 Fields as required
    private String title;
    private String author;
    private String genre;
    private int yearPublished;
    private String isbn;

    // No-argument constructor
    public Book() {}

    // Getters and Setters
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getAuthor() { return author; }
    public void setAuthor(String author) { this.author = author; }

    public String getGenre() { return genre; }
    public void setGenre(String genre) { this.genre = genre; }

    public int getYearPublished() { return yearPublished; }
    public void setYearPublished(int yearPublished) { this.yearPublished = yearPublished; }

    public String getIsbn() { return isbn; }
    public void setIsbn(String isbn) { this.isbn = isbn; }
}