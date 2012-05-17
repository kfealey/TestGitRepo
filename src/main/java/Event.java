package main.java;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.Properties;

public class Event {
    private Long id;

    private String title;
    private Date date;

    public Event() {}

    public Long getId() {
        return id;
    }

    private void setId(Long id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    
    public static void main(String[] args) throws ClassNotFoundException{
    	Properties props = new Properties();
    	try{
    		 props.load(new FileInputStream("db.properties")); 
    	}catch(Exception e){
    		System.out.println("Couldn't load file.");
    		e.printStackTrace();
    	}
    	try {
    		String url = props.getProperty("url");
    		String uname = props.getProperty("username");
    		String pwd = props.getProperty("password");
    		Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, uname, pwd);
			/*PreparedStatement insertGame = con.prepareStatement("INSERT INTO games Values(?,?,?,?)");
			insertGame.setInt(1, 0);
			insertGame.setString(2, "The Finger Game3");
			insertGame.setString(3, "2-7");
			insertGame.setString(4, "Hoyb");
			insertGame.executeUpdate();*/
			PreparedStatement selectGames = con.prepareStatement("Select * from games");
			ResultSet rs = selectGames.executeQuery();
			while (rs.next()){
				System.out.println(rs.getString("name"));
			}
			//Statement stmt = con.createStatement();
			/*
			ResultSet rs = stmt.executeQuery("SELECT * FROM games");
			while (rs.next()){
				String rule = rs.getString("name");
//				String who = rs.getString("createdBy");
	//			System.out.println("Rule: " + rule);
		//		System.out.println("Author: " + who);
				System.out.println(rule);
			}
			*/
			//stmt.executeUpdate("INSERT INTO games VALUES(0, \"Flip Cup\", \"2-200\", \"Hoyb\")");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}