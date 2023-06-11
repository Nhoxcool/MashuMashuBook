package com.DAO;

import java.util.List;

import com.entity.BookDtls;

public interface BookDAO {
	
	public boolean addBooks(BookDtls b);
	
	public List<BookDtls> getAllBooks();
	
	public BookDtls getBookById(int id);
	
	public boolean updateEditBooks(BookDtls b);
	
	public boolean deleteBooks(int id);
	
	public List<BookDtls> getSGKBook();
	
	public List<BookDtls> getRecentBooks();
	
	public List<BookDtls> getOldBooks();
	
	public List<BookDtls> getForeignBook();
	
	public List<BookDtls> getliteraryBooks();
	
	public List<BookDtls> getAllRecentBooks();
	
	public List<BookDtls> getAllSGKBook();
	
	public List<BookDtls> getAllliteraryBooks();
	
	public List<BookDtls> getAllOldBooks();
	
	public List<BookDtls> getAllForeignBook();
	
	public List<BookDtls> getBookByOld (String email,String Category);
	
	public boolean DeleteOldBook(String email,String Category, int id);
	
	public List<BookDtls> getBookBySearch(String search);
}
