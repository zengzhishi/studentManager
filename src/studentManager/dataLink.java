package studentManager;

import java.sql.Connection;
import java.sql.DriverManager;

public class dataLink {
	
	public Connection getCon(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/studentManager?useUnicode=true&characterEncoding=utf-8";
			String user = "root";//������ʹ���Լ������ݿ��˻��Լ���Ӧ������
			String password = "948926865";
			Connection conn = DriverManager.getConnection(url,user,password);
			return conn;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
		
	}
	
}
