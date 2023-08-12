
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class dbtest2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("MySQL 연결");
		// JDBC 드라이버 클래스 
		// - DB의 드라이버 클래스 네임, 연결 하기 위해서 사용한다. 
		// - Class.forName() 메서드를 이용해서 JDBC 드라이버를 로딩
		
		
		// 5.x 버전
//		Class.forName("com.mysql.jdbc.Driver");
		
		// 8.x 버전
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // Class.forName() 메서드를 이용해서 JDBC 드라이버를 로딩
			String url = "jdbc:mysql://localhost:3306/BURGERS?serverTimezone=UTC";   //DB연결
			String user = "root";  //mysql 워크벤치 아이디
			String pass = "dnrwjdchl357@"; //mysql 워크벤치 비밀번호
			
			// 데이터베이스 실제 연결을 도와주는 클래스
//			Connection con = DriverManager.getConnection(url, user, pass);
			try {
				Connection con = DriverManager.getConnection(url, user, pass);
				
				if(con != null) {
					System.out.println("DB연결 성공!");
				}
				
				
//				//DB와 연결된 conn 객체로 부터 Statement 객체 획득.
//				//내가 데이터베이스에게 질의를 할 수 있다. 
//				Statement stmt = con.createStatement();
//				
//				//query만들기 
//				//문자열로 넘어갑니다.
//				StringBuilder sb = new StringBuilder();
//				String sql = sb.append("create table if not exists student(")
//						.append("id int,").append("grade int").append("name varchar(30)").append("address varchar(30)").append("phone varchar(30)")
//						.append(");").toString();
//				
//				System.out.println(sql);
//				
//				//query문 날리기!
//				stmt.execute(sql);
						
				Statement stmt = con.createStatement(); //DB와 연결된 con 객체로 부터 Statement 객체 획득.
				
				//조회 select 
				// 쿼리문이 데이터를 가지고 온다. 객체 형식으로 
				// next() 다음 데이터가 있으면 true, 없으면 false 
				ResultSet result = stmt.executeQuery("select * from BURGER");
				
				while(result.next()) {
					
					// 컬럼 이름을 이용해서 데이터를 뽑는게 더 안전하다. 
					// getString("컬럼이름")
					int id = Integer.parseInt(result.getString("id"));
					String name = result.getString("name");
					int price = Integer.parseInt(result.getString("price"));
					int kcal = Integer.parseInt(result.getString("kcal"));
					
					System.out.println("번호:" + id);
					System.out.println("메뉴명:" + name);
					System.out.println("가격:" + price);
					System.out.println("칼로리:" + kcal);
					System.out.println();
					
					
					
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
