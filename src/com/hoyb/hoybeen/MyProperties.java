package com.hoyb.hoybeen;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class MyProperties {
	
	public static Properties dbProps;
	private static String propLoc = "C:\\Workspaces\\Personal\\Development\\Finger\\WebContent\\";
	private static String PROP_FILE = propLoc + "db.properties";
		
	public static void loadDatabaseProps(){
		try{
			 dbProps = new Properties();
			 dbProps.load(new FileInputStream(PROP_FILE)); 
		}catch(IOException e){
			System.err.println("Couldn't load file: " + PROP_FILE + ".");
			e.printStackTrace();
		}
		
	}
}
