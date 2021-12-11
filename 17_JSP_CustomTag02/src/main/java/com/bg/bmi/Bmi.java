package com.bg.bmi;

public class Bmi {

	private String name;
	private double height;
	private double weight;
	private String bmi2;
	private String file;
	private String result;
	
	public Bmi(String name, double height, double weight, String bmi2, String file, String result) {
		super();
		this.name = name;
		this.height = height;
		this.weight = weight;
		this.bmi2 = bmi2;
		this.file = file;
		this.result = result;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getHeight() {
		return height;
	}
	public void setHeight(double height) {
		this.height = height;
	}
	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
		this.weight = weight;
	}
	public String getBmi2() {
		return bmi2;
	}
	public void setBmi2(String bmi2) {
		this.bmi2 = bmi2;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	
	
	
	
	
	
	
	
}
