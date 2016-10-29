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

public class teacherService {
	private Connection conn;
	private PreparedStatement pstmt;
	
	public teacherService(){
		conn = new studentManager.dataLink().getCon();
	}
	
	public teaInfo showInfo(String teaId){//获取老师信息
		try{
			pstmt = conn.prepareStatement("select * from teachers where id=?");
			pstmt.setString(1, teaId);
			ResultSet rs = pstmt.executeQuery();
			teaInfo tea = new teaInfo();
			while(rs.next()){
				tea.setId(rs.getString(1));
				tea.setName(rs.getString(2));
				tea.setDepartment(rs.getString(3));
			}
			return tea;
		}catch(SQLException e){
			e.printStackTrace();
			return null;
		}
	}
	
	public boolean modifyInfo(teaInfo tea){//修改老师个人信息
		try{
			pstmt = conn.prepareStatement("update teachers set id=? , name=? , department=?");
			pstmt.setString(1, tea.getId());
			pstmt.setString(2, tea.getName());
			pstmt.setString(3, tea.getDepartment());
			pstmt.executeUpdate();
			return true;
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean modifyGrade(stuGradeInfo g){//成绩登记
		try{
			pstmt = conn.prepareStatement("select * from grade where id=?");
			pstmt.setString(1, g.getId());
			boolean exit = pstmt.execute();
			if(exit){
				pstmt = conn.prepareStatement("update grade set id=? , classid=? , teacherid=? , studentid=? , grade=?");
				pstmt.setString(1, g.getId());
				pstmt.setString(2, g.getClassid());
				pstmt.setString(3, g.getTeacherid());
				pstmt.setString(4, g.getStudentid());
				pstmt.setInt(5, g.getGrade());
				pstmt.executeUpdate();
			}else{
				pstmt = conn.prepareStatement("insert into grade"
						+ "(id,classid,teacherid,studentid,grade)"
						+ "?,?,?,?,?,?");
				pstmt.setString(1, g.getId());
				pstmt.setString(2, g.getClassid());
				pstmt.setString(3, g.getTeacherid());
				pstmt.setString(4, g.getStudentid());
				pstmt.setInt(5, g.getGrade());
				pstmt.executeUpdate();
			}
			return true;
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}
	}
	
	public List showGrade(String teaId){//查询老师的学生成绩列表
		List grades = new ArrayList();
		try{
			pstmt = conn.prepareStatement("select * from grade where teacherid=?");
			pstmt.setString(1, teaId);
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
	
	public stuInfo getStuInfo(String stuId){//获取老师对应得学生
		try{
			pstmt = conn.prepareStatement("select * from studentinfo where id=?");
			pstmt.setString(1, stuId);
			ResultSet rs = pstmt.executeQuery();
			stuInfo s = new stuInfo();
			if(rs.next()){
				s.setId(rs.getString(1));
				s.setName(rs.getString(2));
				s.setSex(rs.getByte(3));
				s.setDate(rs.getDate(4).toString());
				s.setDepartment(rs.getString(5));
				s.setSpecialty(rs.getString(6));
			}
			return s;
		}catch(SQLException e){
			e.printStackTrace();
			return null;
		}
	}
}
