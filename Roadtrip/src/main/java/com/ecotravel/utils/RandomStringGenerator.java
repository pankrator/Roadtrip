package com.ecotravel.utils;

import java.security.SecureRandom;
import java.util.Random;

public class RandomStringGenerator {
	public static String generateRandomString() {
		Random RANDOM = new SecureRandom();
		int PASSWORD_LENGTH = 8;

		String letters = "abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ23456789+@";

		String newPassword = "";
		for (int i = 0; i < PASSWORD_LENGTH; i++) {
			int index = (int) (RANDOM.nextDouble() * letters.length());
			newPassword += letters.substring(index, index + 1);
		}
		return newPassword;
	}
}
