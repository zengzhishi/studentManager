package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.userTable;

public class userService {
	private Connection conn;
	private PreparedStatement pstmt;
	
	public userService(){
		conn = new studentManager.dataLink().getCon();
	}
	
	public String valiUser(userTable user){//检索用户并返回用户身份或检索信息
		try{
			pstmt = conn.prepareStatement("select * from userTable where username=? and password=?");			
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getPassword());
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()){
				return rs.getString(3);
			}
			else
				return "none";
		}catch(SQLException e){
			e.printStackTrace();
			return "none";
		}
	}
	
	public boolean changePassword(userTable user, String newPassword){//修改密码
		try{
			pstmt = conn.prepareStatement("select * from userTable where username=? and password=?");
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getPassword());
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				pstmt = conn.prepareStatement("update userTable set password=? , type=? where username=?");
				pstmt.setString(3, rs.getString(1));
				pstmt.setString(1, newPassword);
				pstmt.setString(2, rs.getString(3));
				pstmt.executeUpdate();
				return true;
			}else
				return false;
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean addUser(String id, String userType){//添加新账户
		try{
			pstmt = conn.prepareStatement("select * from userTable where username=?");
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(!rs.next()){
				pstmt = conn.prepareStatement("insert into userTable"
						+ "(username,password,type) "
						+ "values(?,?,?)");
				pstmt.setString(1, id);
				pstmt.setString(2, id);
				pstmt.setString(3, userType);
				pstmt.executeUpdate();
				return true;
			}else
				return false;
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean deleteUser(String id){//移除用户
		try{
			pstmt = conn.prepareStatement("delete from userTable where username=?");
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			return true;
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}
	}
}
