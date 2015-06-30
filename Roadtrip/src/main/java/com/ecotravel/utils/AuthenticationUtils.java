package com.ecotravel.utils;

import java.security.MessageDigest;

import javax.xml.bind.DatatypeConverter;

public class AuthenticationUtils {

	public static String getHashedPassword(String password) {
		try {
			MessageDigest mda = MessageDigest.getInstance("SHA-512");
			password = DatatypeConverter.printHexBinary(mda.digest(password.getBytes()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return password;
	}
}
