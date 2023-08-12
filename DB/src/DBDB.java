import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBDB {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("MySQL연동");
		// JDBC 드라이버 클래스 
		// - DB의 드라이버 클래스 네임, 연결 하기 위해서 사용한다. 
		// - Class.forName() 메서드를 이용해서 JDBC 드라이버를 로딩
		
		
		// 5.x 버전
//		Class.forName("com.mysql.jdbc.Driver");
		
		// 8.x
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // Class.forName() 메서드를 이용해서 JDBC 드라이버를 로딩
			String url = "jdbc:mysql://localhost:3306/employees?serverTimezone=UTC"; //DB연결 (로컬호스트 뒤에 DB명)
			String user = "root"; //mysql 워크벤치 아이디
			String pass = "dnrwjdchl357@"; //mysql 워크벤치 비밀번호
			
			// 데이터베이스 실제 연결을 도와주는 클래스
//			Connection con = DriverManager.getConnection(url, user, pass);
			try {
				Connection con = DriverManager.getConnection(url, user, pass);
				
				if(con != null) {
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
		
		
		
	}

	// 데이터베이스 작업에 사용한 객체를 닫는 메서드 
	public static void close(Connection conn) {
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	
	public static void close(Statement conn) {
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	public static void close(PreparedStatement conn) {
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	public static void close(ResultSet rs) {
		if (rs != null) { try { rs.close(); } catch (SQLException e) { e.printStackTrace(); } }
	}
	
}
