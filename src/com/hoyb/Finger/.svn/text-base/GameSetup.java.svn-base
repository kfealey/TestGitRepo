package com.hoyb.Finger;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class GameSetup {
	/* 
	 * For Testing
	 */
	public GameSetup(){
		getGames();
	}
	public static void main(String[] args){
		GameSetup blah = new GameSetup();
	}
	/*
	 * End Testing
	 */
	public static ArrayList<String> getGames(){
		ArrayList<String> allGames = new ArrayList<String>();
		MyProperties.loadDatabaseProps();
		try {
			Connection gamesConnection = getDatabaseConnection();
			PreparedStatement selectGames = gamesConnection.prepareStatement("Select * from games");
			ResultSet rs = selectGames.executeQuery();
			while (rs.next()){
				allGames.add(rs.getString("name"));
			}
		} catch (SQLException e) {
			System.err.println("SQL Problem in GameSetup.getGames()");
			e.printStackTrace();
		}
    	return allGames;
	}
	
	public static void printArrayList(ArrayList<String> arr){
		for(int i = 0; i < arr.size(); i++){
			System.out.println(arr.get(i));
		}
	}
	private static Connection getDatabaseConnection() throws SQLException{
		String url = MyProperties.dbProps.getProperty("url");
		String uname = MyProperties.dbProps.getProperty("username");
		String pwd = MyProperties.dbProps.getProperty("password");
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.err.println("Unable to find MYSQL JDBC Driver.");
			e.printStackTrace();
		}
		Connection con = DriverManager.getConnection(url, uname, pwd);
		return con;
	}
	

}
