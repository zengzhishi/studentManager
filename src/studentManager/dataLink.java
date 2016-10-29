package studentManager;

import java.sql.Connection;
import java.sql.DriverManager;

public class dataLink {
	
	public Connection getCon(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/studentManager?useUnicode=true&characterEncoding=utf-8";
			String user = "root";//这里请使用自己的数据库账户以及相应的密码
			String password = "948926865";
			Connection conn = DriverManager.getConnection(url,user,password);
			return conn;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
		
	}
	
}
