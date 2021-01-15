package com.care.mvc.common.util;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class EncryptUtil {

	public static String oneWays(String message, String algorism) {

		String encMessage = "";

		try {
			MessageDigest md = MessageDigest.getInstance(algorism);
			byte[] bytes = message.getBytes(Charset.forName("UTF-8"));

			md.update(bytes);

			encMessage = Base64.getEncoder().encodeToString(md.digest());

		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		return encMessage;
	}
}
