package com.sinosoft.exam.tools;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class StringProcessor {
	
	public static String getMD5(String str) {
		String ret = null;
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(str.getBytes());
			ret = new BigInteger(1, md.digest()).toString(16);
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return ret;
	}
	
	public static boolean isNullOrEmpty(String str) {
		if(null == str || "".equals(str.trim())) {
			return true;
		}else {
			return false;
		}
	}
	
}

