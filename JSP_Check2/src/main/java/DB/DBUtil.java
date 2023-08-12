package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
	
	// mysql에 연결하는 connection을 리턴하는 메서드 
	public static Connection getMysqlConnection() {
		
		//라이브러리 8버전 가져오기 추가 
		
		//드라이버 만들어서 가지고 오고 url 연결 해서 연결 성공!
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // Class.forName() 메서드를 이용해서 JDBC 드라이버를 로딩
			String url = "jdbc:mysql://localhost:3306/employees?serverTimezone=UTC"; //DB연결 (로컬호스트 뒤에 DB명)
			String user = "root"; //mysql 워크벤치 아이디
			String pass = "1234"; //mysql 워크벤치 비밀번호
			
			// 데이터베이스 실제 연결을 도와주는 클래스
//			Connection con = DriverManager.getConnection(url, user, pass);
			try {
				Connection conn = DriverManager.getConnection(url, user, pass);
				
				if(conn != null) {
					System.out.println("DB연결 성공!");
				}
				
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("연결 에러");
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("드라이버 로딩 에러");
			e.printStackTrace();
		}
		
		//return conn;
		
	
	}
	
	public static void close(Connection conn) {
		if(conn!= null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	

}
