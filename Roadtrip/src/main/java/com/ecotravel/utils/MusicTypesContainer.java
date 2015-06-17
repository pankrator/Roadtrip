package com.ecotravel.utils;

import java.io.IOException;

import javax.servlet.jsp.JspWriter;

public class MusicTypesContainer {
	private static String[] musicTypes = {
		"Everything", 
		"Blues", 
		"Commercial", 
		"Folk",
		"House", 
		"Jazz", 
		"Metal", 
		"Pop", 
		"Pop folk", 
		"Rap", 
		"Rock", 
		"Techno"
	};

	public MusicTypesContainer() {}

	public static void printMusicTypes(JspWriter out) throws IOException { 
		for(int i=0; i < musicTypes.length; i++)
			out.print("<option>" + musicTypes[i] + "</option>");
	}
}
