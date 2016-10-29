package com.model;

public class stuGradeInfo {
	public static final int GRADEID = 0;
	public static final int CLASSID = 1;
	public static final int TEACHERID = 2;
	public static final int STUDENTID = 3;
	
	public static final int ASC=0;
	public static final int DESC=1;
	
	private String id;
	private String classid;
	private String teacherid;
	private String studentid;
	private int grade;
	public String getId() {
		return id;
	} 
	public void setId(String id) {
		this.id = id;
	}
	public String getClassid() {
		return classid;
	}
	public void setClassid(String classid) {
		this.classid = classid;
	}
	public String getTeacherid() {
		return teacherid;
	}
	public void setTeacherid(String teacherid) {
		this.teacherid = teacherid;
	}
	public String getStudentid() {
		return studentid;
	}
	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
}
