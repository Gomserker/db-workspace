package com.bg.main;

import javax.servlet.http.HttpServletRequest;

public class M {

	public static Member getVal(HttpServletRequest req) {
		String name = req.getParameter("n");
		int age = Integer.parseInt(req.getParameter("a"));
		
		Member m = new Member(0, name, age);
		
		return m;
	}
}
