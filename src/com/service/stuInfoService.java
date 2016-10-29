package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.classInfo;
import com.model.stuGradeInfo;
import com.model.stuInfo;
import com.model.teaInfo;

public class stuInfoService {
	private Connection conn;
	private PreparedStatement pstmt;
	
	public stuInfoService(){
		conn = new studentManager.dataLink().getCon();
	}
	
	public stuInfo showInfo(String stuId){//获取学生信息
		try{
			pstmt = conn.prepareStatement("select * from studentinfo where id=?");
			pstmt.setString(1, stuId);
			pstmt.executeQuery();
			ResultSet rs = pstmt.executeQuery();
			stuInfo stu = new stuInfo();
			while(rs.next()){
				stu.setId(rs.getString(1));
				stu.setName(rs.getString(2));
				stu.setSex(rs.getByte(3));
				stu.setDate(rs.getDate(4).toString());
				stu.setDepartment(rs.getString(5));
				stu.setSpecialty(rs.getString(6));
			}
			return stu;
		}catch(SQLException e){
			e.printStackTrace();
			return null;
		}
	}
	
	public boolean modifyInfo(stuInfo stu){//更新学生信息
		try{
			pstmt = conn.prepareStatement("update studentinfo set id=? , name=? , sex=? , date=? , department=? , specialty=?");
			pstmt.setString(1, stu.getId());
			pstmt.setString(2, stu.getName());
			pstmt.setByte(3, stu.getSex());
			pstmt.setString(4, stu.getDate());
			pstmt.setString(5, stu.getDepartment());
			pstmt.setString(6, stu.getSpecialty());
			pstmt.executeUpdate();
			return true;
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}
	}
	
	public List showGrade(String stuId){//查询学生成绩，返回学生的成绩列表
		List grades = new ArrayList();
		try{
			pstmt = conn.prepareStatement("select * from grade where studentid=?");
			pstmt.setString(1, stuId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				stuGradeInfo grade = new stuGradeInfo();
				grade.setId(rs.getString(1));
				grade.setClassid(rs.getString(2));
				grade.setTeacherid(rs.getString(3));
				grade.setStudentid(rs.getString(4));
				grade.setGrade(rs.getInt(5));
				grades.add(grade);
			}
			return grades;
		}catch(SQLException e){
			e.printStackTrace();
			return null;
		}
	}
	
	public classInfo getClassInfo(String classId){//获取课程信息
		try{
			pstmt = conn.prepareStatement("select * from classes where id=?");
			pstmt.setString(1, classId);
			ResultSet rs = pstmt.executeQuery();
			classInfo c = new classInfo();
			if(rs.next()){
				c.setId(rs.getString(1));
				c.setName(rs.getString(2));
				c.setWeight(rs.getInt(3));
				c.setTime(rs.getInt(4));
			}
			return c;
		}catch(SQLException e){
			e.printStackTrace();
			return null;
		}
	}
	
	public teaInfo getTeaInfo(String teaId){//获取学生成绩对应得老师
		try{
			pstmt = conn.prepareStatement("select * from teachers where id=?");
			pstmt.setString(1, teaId);
			ResultSet rs = pstmt.executeQuery();
			teaInfo t = new teaInfo();
			if(rs.next()){
				t.setId(rs.getString(1));
				t.setName(rs.getString(2));
				t.setDepartment(rs.getString(3));
			}
			return t;
		}catch(SQLException e){
			e.printStackTrace();
			return null;
		}
	}
}
