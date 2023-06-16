package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDtls;

public class BookDAOImpl implements BookDAO{
	
	private Connection conn;

	public BookDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addBooks(BookDtls b) {
		boolean f=false;
		try {
			String sql ="insert into book_detail(bookname,author,price,bookCategory,bookDetail,status,photo,email) values(?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getBookCategory());
			ps.setString(5, b.getBookDetail());
			ps.setString(6, b.getStatus());
			ps.setString(7, b.getPhotoName());
			ps.setString(8, b.getEmail());
			
			int i = ps.executeUpdate();
			
			if(i == 1)
			{
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}
	
	public List<BookDtls> getAllBooks() {
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b = null;
		
		
		try {
			String sql = "select * from book_detail";
			PreparedStatement ps= conn.prepareStatement(sql);			//Lấy hết sách có trong Database
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				b= new BookDtls();
				b.setBookID(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));				
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setBookDetail(rs.getString(6));
				b.setStatus(rs.getString(7));
				b.setPhotoName(rs.getString(8));
				b.setEmail(rs.getString(9));
				list.add(b);
			}
			
		} catch (Exception e) {

		}
		
		return list;
	}

	public BookDtls getBookById(int id) {
		
		BookDtls b=null;
		try {
			String sql ="select * from book_detail where bookid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,id);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				b=new BookDtls();
				b.setBookID(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));				
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setBookDetail(rs.getString(6));
				b.setStatus(rs.getString(7));
				b.setPhotoName(rs.getString(8));
				b.setEmail(rs.getString(9));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	public boolean updateEditBooks(BookDtls b) {
		boolean f=false;
		try {
			String sql ="update book_detail set bookname=?,author=?, price=?, status=? where bookid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2,b.getAuthor());
			ps.setString(3,b.getPrice());
			ps.setString(4,b.getStatus());
			ps.setInt(5,b.getBookID());
			
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	} 
	
	public boolean deleteBooks(int id) {
		boolean f = false;
		try {
			String sql = "delete from book_detail where bookid=?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setInt(1,id);
			int i = ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	public List<BookDtls> getSGKBook() {
		
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		try {
			String sql = "select * from book_detail where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,"Sách giáo khoa");
			ps.setString(2,"Active");
			ResultSet rs = ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4)
			{
				b = new BookDtls();
				b.setBookID(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));				
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setBookDetail(rs.getString(6));
				b.setStatus(rs.getString(7));
				b.setPhotoName(rs.getString(8));
				b.setEmail(rs.getString(9));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<BookDtls> getRecentBooks() {
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		try {
			String sql = "select * from book_detail where status=? and bookCategory!=? ORDER BY RAND()";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,"Active");
			ps.setString(2,"Cũ");
			ResultSet rs = ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4)
			{
				b = new BookDtls();
				b.setBookID(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));				
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setBookDetail(rs.getString(6));
				b.setStatus(rs.getString(7));
				b.setPhotoName(rs.getString(8));
				b.setEmail(rs.getString(9));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<BookDtls> getOldBooks() {
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		try {
			String sql = "select * from book_detail where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,"Cũ");
			ps.setString(2,"Active");
			ResultSet rs = ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4)
			{
				b = new BookDtls();
				b.setBookID(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));				
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setBookDetail(rs.getString(6));
				b.setStatus(rs.getString(7));
				b.setPhotoName(rs.getString(8));
				b.setEmail(rs.getString(9));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<BookDtls> getliteraryBooks() {
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		try {
			String sql = "select * from book_detail where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,"Sách văn học");
			ps.setString(2,"Active");
			ResultSet rs = ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4)
			{
				b = new BookDtls();
				b.setBookID(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));				
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setBookDetail(rs.getString(6));
				b.setStatus(rs.getString(7));
				b.setPhotoName(rs.getString(8));
				b.setEmail(rs.getString(9));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<BookDtls> getAllRecentBooks() {
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		try {
			String sql = "select * from book_detail where status=? and bookCategory!=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,"Active");
			ps.setString(2,"Cũ");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				b = new BookDtls();
				b.setBookID(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));				
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setBookDetail(rs.getString(6));
				b.setStatus(rs.getString(7));
				b.setPhotoName(rs.getString(8));
				b.setEmail(rs.getString(9));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<BookDtls> getAllSGKBook() {
		
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		try {
			String sql = "select * from book_detail where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,"Sách giáo khoa");
			ps.setString(2,"Active");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				b = new BookDtls();
				b.setBookID(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));				
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setBookDetail(rs.getString(6));
				b.setStatus(rs.getString(7));
				b.setPhotoName(rs.getString(8));
				b.setEmail(rs.getString(9));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<BookDtls> getAllliteraryBooks() {
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		try {
			String sql = "select * from book_detail where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,"Sách văn học");
			ps.setString(2,"Active");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				b = new BookDtls();
				b.setBookID(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));				
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setBookDetail(rs.getString(6));
				b.setStatus(rs.getString(7));
				b.setPhotoName(rs.getString(8));
				b.setEmail(rs.getString(9));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<BookDtls> getAllOldBooks() {
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		try {
			String sql = "select * from book_detail where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,"Cũ");
			ps.setString(2,"Active");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				b = new BookDtls();
				b.setBookID(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));				
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setBookDetail(rs.getString(6));
				b.setStatus(rs.getString(7));
				b.setPhotoName(rs.getString(8));
				b.setEmail(rs.getString(9));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<BookDtls> getBookByOld(String email, String Category) {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b=null;
		try {
			String sql ="select * from book_detail where bookCategory=? and email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, Category);
			ps.setString(2, email);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				b=new BookDtls();
				b.setBookID(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));				
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setBookDetail(rs.getString(6));
				b.setStatus(rs.getString(7));
				b.setPhotoName(rs.getString(8));
				b.setEmail(rs.getString(9));
				list.add(b);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

	public boolean DeleteOldBook(String email, String Category, int id) {
		boolean f=false;
		try {
			String sql = "delete from book_detail where bookCategory=? and email=? and bookid=?";
			PreparedStatement ps = conn.prepareStatement(sql);	
			ps.setString(1, Category);
			ps.setString(2, email);
			ps.setInt(3, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<BookDtls> getBookBySearch(String search) {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b=null;
		try {
			String sql ="select * from book_detail where  status=? and bookname like ? or status=? and author like ? or status=? and bookCategory like ? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ps.setString(2, "%"+ search+"%");
			ps.setString(3, "Active");
			ps.setString(4, "%"+ search+"%");
			ps.setString(5, "Active");
			ps.setString(6, "%"+ search+"%");
			
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				b=new BookDtls();
				b.setBookID(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));				
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setBookDetail(rs.getString(6));
				b.setStatus(rs.getString(7));
				b.setPhotoName(rs.getString(8));
				b.setEmail(rs.getString(9));
				list.add(b);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

	public List<BookDtls> getForeignBook() {
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		try {
			String sql = "select * from book_detail where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,"Sách nước ngoài");
			ps.setString(2,"Active");
			ResultSet rs = ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4)
			{
				b = new BookDtls();
				b.setBookID(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));				
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setBookDetail(rs.getString(6));
				b.setStatus(rs.getString(7));
				b.setPhotoName(rs.getString(8));
				b.setEmail(rs.getString(9));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<BookDtls> getAllForeignBook() {
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		try {
			String sql = "select * from book_detail where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,"Sách nước ngoài");
			ps.setString(2,"Active");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				b = new BookDtls();
				b.setBookID(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));				
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setBookDetail(rs.getString(6));
				b.setStatus(rs.getString(7));
				b.setPhotoName(rs.getString(8));
				b.setEmail(rs.getString(9));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<BookDtls> getBookByCategory(String Category, String bookname) {
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		try {
			String sql ="select * from book_detail where bookCategory=? and bookname!= ? ORDER BY RAND()";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,Category);
			ps.setString(2,bookname);
			ResultSet rs = ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4)
			{
				b=new BookDtls();
				b.setBookID(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));				
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setBookDetail(rs.getString(6));
				b.setStatus(rs.getString(7));
				b.setPhotoName(rs.getString(8));
				b.setEmail(rs.getString(9));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<BookDtls> getBookByAuthor(String author, String bookname) {
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		try {
			String sql ="select * from book_detail where author=? and bookname!= ?  and  bookCategory!=? ORDER BY RAND()";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,author);
			ps.setString(2,bookname);
			ps.setString(3,"Cũ");
			ResultSet rs = ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4)
			{
				b=new BookDtls();
				b.setBookID(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));				
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setBookDetail(rs.getString(6));
				b.setStatus(rs.getString(7));
				b.setPhotoName(rs.getString(8));
				b.setEmail(rs.getString(9));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<BookDtls> getBookByOldSameName(String bookname) {
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		try {
			String sql ="select * from book_detail where bookCategory=? and bookname=? ORDER BY RAND()";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,"Cũ");
			ps.setString(2,bookname);
			ResultSet rs = ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4)
			{
				b=new BookDtls();
				b.setBookID(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));				
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setBookDetail(rs.getString(6));
				b.setStatus(rs.getString(7));
				b.setPhotoName(rs.getString(8));
				b.setEmail(rs.getString(9));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	
	
	
	
	
}
