package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.model.classInfo;
import com.model.deanInfo;
import com.model.stuGradeInfo;
import com.model.stuInfo;
import com.model.teaInfo;

public class deanService {//�̵�ԱȨ��
	private Connection conn;
	private PreparedStatement pstmt;
	
	public deanService(){
		conn = new studentManager.dataLink().getCon();
	}
	
	public deanInfo showInfo(String deanId){//��ȡ�̵�Ա��Ϣ
		try{
			pstmt = conn.prepareStatement("select * from dean where id=?");
			pstmt.setString(1, deanId);
			pstmt.executeQuery();
			ResultSet rs = pstmt.executeQuery();
			deanInfo d = new deanInfo();
			while(rs.next()){
				d.setId(rs.getString(1));
				d.setName(rs.getString(2));
				d.setDepartment(rs.getString(3));
			}
			return d;
		}catch(SQLException e){
			e.printStackTrace();
			return null;
		}
	}
	public boolean modifyInfo(deanInfo d){//�޸Ľ̵�Ա��Ϣ
		try{
			pstmt = conn.prepareStatement("update dean set id=? , name=? , department=?");
			pstmt.setString(1, d.getId());
			pstmt.setString(2, d.getName());
			pstmt.setString(3, d.getDepartment());
			pstmt.executeUpdate();
			return true;
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}
	}
	
	public classInfo showClass(String classId){//��ʾ�γ���Ϣ
		try{
			pstmt = conn.prepareStatement("select * from classes where id=?");
			pstmt.setString(1, classId);
			pstmt.executeQuery();
			ResultSet rs = pstmt.executeQuery();
			classInfo cla = new classInfo();
			while(rs.next()){
				cla.setId(rs.getString(1));
				cla.setName(rs.getString(2));
				cla.setWeight(rs.getInt(3));
				cla.setTime(rs.getInt(4));
			}
			return cla;
		}catch(SQLException e){
			e.printStackTrace();
			return null;
		}
	}
	public boolean modifyClass(classInfo cla){//�޸�,��ӿγ���Ϣ
		managerService m = new managerService();
		return m.modifyClass(cla);
	}
	public boolean deleteClass(String name){//ɾ���γ���Ϣ
		managerService m = new managerService();
		return m.deleteClass(name);
	}
	
	public List sortGradesByOrder(String classId, int type){//���ɼ����������
		List grades = new ArrayList();
		try{
			if(type == stuGradeInfo.DESC)//���򣬴Ӵ�С
				pstmt = conn.prepareStatement("select * from grade where classid=? order by grade desc");
			else if(type == stuGradeInfo.ASC)//���򣬴�С����
				pstmt = conn.prepareStatement("select * from grade where classid=? order by grade asc");
			pstmt.setString(1, classId);
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
	
	public stuInfo getStuInfo(String stuId){//��ȡ�γ̶�Ӧ��ѧ��
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
	
	public teaInfo getTeaInfo(String teaId){//��ȡ�γ̶�Ӧ��ѧ��
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
	
	public classInfo getclassInfo(String classId){//��ȡ�γ�
		try{
			pstmt = conn.prepareStatement("select * from classes where id=?");
			pstmt.setString(1, classId);
			ResultSet rs = pstmt.executeQuery();
			classInfo cla = new classInfo();
			if(rs.next()){
				cla.setId(rs.getString(1));
				cla.setName(rs.getString(2));
				cla.setWeight(rs.getInt(3));
				cla.setTime(rs.getInt(4));
			}
			return cla;
		}catch(SQLException e){
			e.printStackTrace();
			return null;
		}
	}
	
	public double getAverage(List grades){
		Iterator iter = grades.iterator();	
		int i = 0;
		double count = 0;
		while(iter.hasNext()){
			stuGradeInfo grade = (stuGradeInfo) iter.next();
			count += grade.getGrade();
			i++;
		}
		return count/i;
	}
	
}
