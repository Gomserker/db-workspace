package com.bg.unit;

import javax.servlet.http.HttpServletRequest;

public class M {
	
		
	
	public static void calc(HttpServletRequest request) {
		try {
		request.setCharacterEncoding("utf-8");
		int num = Integer.parseInt(request.getParameter("num"));
		String unit = request.getParameter("unit");
		String danwi2 = "mi/h";
		String cn = "d";
		double result = num /1.6;
		if(unit.equals("cm")){
			result = num / 2.54;
			 danwi2 = "inch";
			 cn = "a";
		} else if(unit.equals("§³")){
			danwi2 = "Æò";
			 cn = "b";
		}else if(unit.equals("¡É")){
			danwi2 = "¢µ";
			 cn = "c";
		}
		
		String result2 = String.format("%.1f", result);
		
		
		Danwi d = new Danwi(num, unit, danwi2, cn, result2);
		request.setAttribute("danwi", d);
	} catch (Exception e) {
		e.printStackTrace();
	}
	}
}
