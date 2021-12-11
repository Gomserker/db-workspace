package com.bg.bmi;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class M {

	public static void calc(HttpServletRequest request) {
		try {
		
		MultipartRequest mr;
		String path = request.getSession().getServletContext().getRealPath("img");
		mr = new MultipartRequest(request, path, 30 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
		System.out.println(path);
		String file = mr.getFilesystemName("pic");		
		String name = mr.getParameter("name");
		double height = Double.parseDouble(mr.getParameter("height"));
		double weight = Double.parseDouble(mr.getParameter("weight"));
		
		
		
		
		height /= 100;
		double bmi = weight / (height * height);
		
		String result = "비만";

		if (bmi < 20) {
			result = "저체중";
		} else if (bmi < 25) {
			result = "정상";
		} else if (bmi < 30){
			result = "과체중";
		}

		String bmi2 = String.format("%.2f", bmi);
		
		System.out.println(name);
		System.out.println(height);
		System.out.println(weight);
		System.out.println(bmi2);
		System.out.println(result);
		System.out.println(file);
		
		
		Bmi bb = new Bmi(name, height, weight, bmi2, file, result);
		request.setAttribute("bmi", bb);
		} catch (IOException e) {
			e.printStackTrace();
		}
		//빈에 result랑 bmi 넣는거 까먹어서 따로 어트리뷰트로 셋했습니다.
		
		//얘도 나중에 사진 넣어야 하는거 듣고 추가했는데 500에러 터지네요...
		
		
	}

}
