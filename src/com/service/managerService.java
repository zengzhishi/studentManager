package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.classInfo;
import com.model.deanInfo;
import com.model.stuGradeInfo;
import com.model.stuInfo;
import com.model.teaInfo;

public class managerService {//管理员可以进行学生，老师，课程和成绩的增删操作
	private Connection conn;
	private PreparedStatement pstmt;
	userService user = new userService();
	
	public managerService(){
		conn = new studentManager.dataLink().getCon();
	}
	
	public boolean modifyStu(stuInfo stu){//添加,修改学生信息    used
		boolean check = true;
		try{
			pstmt = conn.prepareStatement("select * from studentinfo where id=?");
			pstmt.setString(1, stu.getId());
			ResultSet rs = pstmt.executeQuery();
			int i;
			if(rs.next()){
				pstmt = conn.prepareStatement("update studentinfo set name=? , sex=? ,"
						+ " date=? , department=? , specialty=? where id=?");
				pstmt.setString(6, stu.getId());
				pstmt.setString(1, stu.getName());
				pstmt.setByte(2, stu.getSex());
				pstmt.setString(3, stu.getDate());
				pstmt.setString(4, stu.getDepartment());
				pstmt.setString(5, stu.getSpecialty());
				i = pstmt.executeUpdate();
			}else{
				//调用insert语句在数据库中的表单studentinfo中插入信息
				pstmt = conn.prepareStatement("insert into studentinfo"
						+ "(id,name,sex,date,department,specialty) "
						+ "values(?,?,?,?,?,?)");				
				pstmt.setString(1, stu.getId());
				pstmt.setString(2, stu.getName());
				pstmt.setByte(3, stu.getSex());
				pstmt.setString(4, stu.getDate());
				pstmt.setString(5, stu.getDepartment());
				pstmt.setString(6, stu.getSpecialty());
				i = pstmt.executeUpdate();
				boolean addResult = user.addUser(stu.getId(), "student");
				if(!addResult){
					i = 0;
					deleteStu(stu.getId());
				}
			}
			if(i == 0) check = false;
		}catch(SQLException e){
			e.printStackTrace();
			check = false;
		}
		return check;
	}
	public List queryAllStu() {//获取全部学生
		List stus = new ArrayList();
		try {
			pstmt = conn.prepareStatement("select * from studentinfo");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				stuInfo stu = new stuInfo();
				stu.setId(rs.getString(1));
				stu.setName(rs.getString(2));
				stu.setSex(rs.getByte(3));
				if (rs.getDate(4) != null)
					stu.setDate(rs.getDate(4).toString());
				stu.setDepartment(rs.getString(5));
				stu.setSpecialty(rs.getString(6));
				stus.add(stu);
			}
			return stus;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	public boolean deleteStu(String stuId){//删除学生信息
		try{
			pstmt = conn.prepareStatement("delete from  studentinfo where id=?");
			pstmt.setString(1, stuId);
			pstmt.executeUpdate();
			deleteGrade(stuId,stuGradeInfo.STUDENTID);
			user.deleteUser(stuId);
			return true;
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean modifyTeacher(teaInfo tea){//添加,修改老师信息  used
		boolean check = true;
		try{
			pstmt = conn.prepareStatement("select * from teachers where id=?");
			pstmt.setString(1, tea.getId());
			ResultSet rs = pstmt.executeQuery();
			int i;
			if(rs.next()){
				pstmt = conn.prepareStatement("update teachers set name=? , department=? where id=?");
				pstmt.setString(3, tea.getId());
				pstmt.setString(1, tea.getName());
				pstmt.setString(2, tea.getDepartment());
				i = pstmt.executeUpdate();
			}else{
				pstmt = conn.prepareStatement("insert into teachers"
						+ "(id,name,department) "
						+ "values(?,?,?)");				
				pstmt.setString(1, tea.getId());
				pstmt.setString(2, tea.getName());
				pstmt.setString(3, tea.getDepartment());
				i = pstmt.executeUpdate();
				boolean addResult = user.addUser(tea.getId(), "teacher");
				if(!addResult){
					i = 0;
					deleteStu(tea.getId());
				}
			}
			if(i == 0) check = false;
		}catch(SQLException e){
			e.printStackTrace();
			check = false;
		}
		return check;
	}
	public List queryAllTea() {//获取全部老师
		List teas = new ArrayList();
		try {
			pstmt = conn.prepareStatement("select * from teachers");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				teaInfo tea = new teaInfo();
				tea.setId(rs.getString(1));
				tea.setName(rs.getString(2));
				tea.setDepartment(rs.getString(3));
				teas.add(tea);
			}
			return teas;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	public boolean deleteTeacher(String teaId){//删除老师
		try {
			pstmt = conn.prepareStatement("delete from  teachers where id=?");
			pstmt.setString(1, teaId);
			pstmt.executeUpdate();
			deleteGrade(teaId,stuGradeInfo.TEACHERID);
			user.deleteUser(teaId);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean modifyClass(classInfo cla){//添加,修改课程  used
		boolean check = true;
		try{
			pstmt = conn.prepareStatement("select * from classes where id=?");
			pstmt.setString(1, cla.getId());
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				pstmt = conn.prepareStatement("update classes set name=? , weight=? , time=? where id=?");
				pstmt.setString(4, cla.getId());
				pstmt.setString(1, cla.getName());
				pstmt.setInt(2, cla.getWeight());
				pstmt.setInt(3, cla.getTime());
			}else{
				pstmt = conn.prepareStatement("insert into classes"
						+ "(id,name,weight,time) "
						+ "values(?,?,?,?)");				
				pstmt.setString(1, cla.getId());
				pstmt.setString(2, cla.getName());
				pstmt.setInt(3, cla.getWeight());
				pstmt.setInt(4, cla.getTime());
			}
			int i = pstmt.executeUpdate();
			if(i == 0) check = false;
		}catch(SQLException e){
			e.printStackTrace();
			check = false;
		}
		return check;
	}
	public List queryAllclass() {//获取全部课程
		List classes = new ArrayList();
		try {
			pstmt = conn.prepareStatement("select * from classes");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				classInfo cla = new classInfo();
				cla.setId(rs.getString(1));
				cla.setName(rs.getString(2));
				cla.setWeight(rs.getInt(3));
				cla.setTime(rs.getInt(4));
				classes.add(cla);
			}
			return classes;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	public boolean deleteClass(String classId){//删除课程
		try{
			pstmt = conn.prepareStatement("delete from classes where id=?");
			pstmt.setString(1, classId);
			pstmt.executeUpdate();
			deleteGrade(classId, stuGradeInfo.CLASSID);
			return true;
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean modifyDean(deanInfo d){//修改教务员   used
		boolean check = true;
		try{
			pstmt = conn.prepareStatement("select * from dean where id=?");
			pstmt.setString(1, d.getId());
			ResultSet rs = pstmt.executeQuery();
			int i;
			if(rs.next()){
				pstmt = conn.prepareStatement("update dean set name=? , department=? where id=?");
				pstmt.setString(3, d.getId());
				pstmt.setString(1, d.getName());
				pstmt.setString(2, d.getDepartment());
				i = pstmt.executeUpdate();
			}else{
				pstmt = conn.prepareStatement("insert into dean"
						+ "(id,name,department) "
						+ "values(?,?,?)");				
				pstmt.setString(1, d.getId());
				pstmt.setString(2, d.getName());
				pstmt.setString(3, d.getDepartment());
				i = pstmt.executeUpdate();
				boolean addResult = user.addUser(d.getId(), "dean");
				if(!addResult){
					i = 0;
					deleteStu(d.getId());
				}
			}
			if(i == 0) check = false;
		}catch(SQLException e){
			e.printStackTrace();
			check = false;
		}
		return check;
	}
	public List queryAllDean() {//获取全部教务员
		List deans = new ArrayList();
		try {
			pstmt = conn.prepareStatement("select * from dean");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				deanInfo dean = new deanInfo();
				dean.setId(rs.getString(1));
				dean.setName(rs.getString(2));
				dean.setDepartment(rs.getString(3));
				deans.add(dean);
			}
			return deans;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	public boolean deleteDean(String deanId){//删除教务员
		try{
			pstmt = conn.prepareStatement("delete from dean where id=?");
			pstmt.setString(1, deanId);
			pstmt.executeUpdate();
			return true;
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}
	}
	
	public String checkExist(stuGradeInfo grade){//检查相应的课程号，老师号，学生号是否存在
		boolean check = true;
		ResultSet rs;
		try{
			pstmt = conn.prepareStatement("select * from classes where id=?");
			pstmt.setString(1, grade.getClassid());
			rs = pstmt.executeQuery();
			if(!rs.next()) return "Can't find class";
			pstmt = conn.prepareStatement("select * from teachers where id=?");
			pstmt.setString(1, grade.getTeacherid());
			rs = pstmt.executeQuery();
			if(!rs.next()) return "Can't find teacher";
			pstmt = conn.prepareStatement("select * from studentinfo where id=?");
			pstmt.setString(1, grade.getStudentid());
			rs = pstmt.executeQuery();
			if(!rs.next()) return "Can't find student";
			return "can";
		}catch(SQLException e){
			e.printStackTrace();
			return "error";
		}
	}
	public boolean modifyGrade(stuGradeInfo grade){//添加，修改成绩   used
		boolean check = true;
		try{
			pstmt = conn.prepareStatement("select * from grade where id=?");
			pstmt.setString(1, grade.getId());
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				pstmt = conn.prepareStatement("update grade set classid=? , teacherid=? , studentid=? , grade=? where id=?");
				pstmt.setString(5, grade.getId());
				pstmt.setString(1, grade.getClassid());
				pstmt.setString(2, grade.getTeacherid());
				pstmt.setString(3, grade.getStudentid());
				pstmt.setInt(4, grade.getGrade());
			}else{
				pstmt = conn.prepareStatement("insert into grade"
						+ "(id,classid,teacherid,studentid,grade) "
						+ "values(?,?,?,?,?)");				
				pstmt.setString(1, grade.getId());
				pstmt.setString(2, grade.getClassid());
				pstmt.setString(3, grade.getTeacherid());
				pstmt.setString(4, grade.getStudentid());
				pstmt.setInt(5, grade.getGrade());
			}
			int i = pstmt.executeUpdate();
			if(i == 0) check = false;
		}catch(SQLException e){
			e.printStackTrace();
			check = false;
		}
		return check;
	}
	public boolean deleteGrade(String Id,int type){//删除成绩
		try{
			if(type == stuGradeInfo.GRADEID)
				pstmt = conn.prepareStatement("delete from grade where id=?");
			else if(type == stuGradeInfo.CLASSID)
				pstmt = conn.prepareStatement("delete from grade where classid=?");
			else if(type == stuGradeInfo.TEACHERID)
				pstmt = conn.prepareStatement("delete from grade where teacherid=?");
			else if(type == stuGradeInfo.STUDENTID)
				pstmt = conn.prepareStatement("delete from grade where studentid=?");
			else return false;
			
			pstmt.setString(1, Id);
			pstmt.executeUpdate();
			return true;
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}
	}
	public boolean deleteGrade(String Id){//按成绩号删除成绩
		try{
			pstmt = conn.prepareStatement("delete from grade where id=?");			
			pstmt.setString(1, Id);
			pstmt.executeUpdate();
			return true;
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}
	}
	public stuGradeInfo getGrade(String id,int type){
		try{
			if(type == stuGradeInfo.GRADEID)
				pstmt = conn.prepareStatement("select * from grade where id=?");
			else if(type == stuGradeInfo.CLASSID)
				pstmt = conn.prepareStatement("select * from grade where classid=?");
			else if(type == stuGradeInfo.TEACHERID)
				pstmt = conn.prepareStatement("select * from grade where teacherid=?");
			else if(type == stuGradeInfo.STUDENTID)
				pstmt = conn.prepareStatement("select * from grade where studentid=?");
			else return null;
			
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				stuGradeInfo g = new stuGradeInfo();
				g.setId(rs.getString(1));
				g.setClassid(rs.getString(2));
				g.setTeacherid(rs.getString(3));
				g.setStudentid(rs.getString(4));
				g.setGrade(rs.getInt(5));
				return g;
			}else return null;
		}catch(SQLException e){
			e.printStackTrace();
			return null;
		}
	}
	
	
	
}
