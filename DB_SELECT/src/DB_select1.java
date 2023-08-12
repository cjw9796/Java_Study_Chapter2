
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

// MySQL과 기본 연결 
public class DB_select1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("하하하하하");
		// JDBC 드라이버 클래스 
		// - DB의 드라이버 클래스 네임, 연결 하기 위해서 사용한다. 
		// - Class.forName() 메서드를 이용해서 JDBC 드라이버를 로딩
		
		
		// 5.x 버전
//		Class.forName("com.mysql.jdbc.Driver");
		
		// 8.x
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // Class.forName() 메서드를 이용해서 JDBC 드라이버를 로딩
			String url = "jdbc:mysql://localhost:3306/BOOKSTORE?serverTimezone=UTC"; //DB연결 (로컬호스트 뒤에 DB명)
			String user = "root"; //mysql 워크벤치 아이디
			String pass = "dnrwjdchl357@"; //mysql 워크벤치 비밀번호
			
			// 데이터베이스 실제 연결을 도와주는 클래스
//			Connection con = DriverManager.getConnection(url, user, pass);
			try {
				Connection con = DriverManager.getConnection(url, user, pass);
				
				if(con != null) {
					System.out.println("DB연결 성공!");
				}
				
				
				
				// BOOK 테이블 가져오기 
				Statement stmt = con.createStatement(); //DB와 연결된 conn 객체로 부터 Statement 객체 획득.
				
				ResultSet result = stmt.executeQuery("select * from BOOK");
				
				while(result.next()) {
					
					// 컬럼 이름을 이용해서 데이터를 뽑는게 더 안전하다. 
					// getString("컬럼이름")
					int BOOKID = Integer.parseInt(result.getString("BOOKID"));
					String BOOKNAME = result.getString("BOOKNAME");
					String PUBLISHER = result.getString("PUBLISHER");
					int PRICE = Integer.parseInt(result.getString("PRICE"));
					
					System.out.println("BOOKID:" + BOOKID);
					System.out.println("BOOKNAME:" + BOOKNAME);
					System.out.println("PUBLISHER:" + PUBLISHER);
					System.out.println("PRICE :" + PRICE );
					System.out.println();
					
				}
				
				// CUSTOMER 테이블 가져오기 
				Statement stmt2 = con.createStatement();
				
				ResultSet result2 = stmt2.executeQuery("select * from CUSTOMER");
				

				while(result2.next()) {
					
					// 컬럼 이름을 이용해서 데이터를 뽑는게 더 안전하다. 
					// getString("컬럼이름")
					int CUSTID = Integer.parseInt(result2.getString("CUSTID"));
					String NAME = result2.getString("NAME");
					String ADDRESS = result2.getString("ADDRESS");
					String PHONE = result2.getString("PHONE");
					
					System.out.println("CUSTID:" + CUSTID);
					System.out.println("NAME:" + NAME);
					System.out.println("ADDRESS:" + ADDRESS);
					System.out.println("PHONE :" + PHONE );
					System.out.println();
					
				}
				
				//ORDERS 테이블 가져오기 
				Statement stmt3 = con.createStatement();
				
				ResultSet result3 = stmt3.executeQuery("select * from ORDERS");
				
				while(result3.next()) {
					int ORDERID = Integer.parseInt(result3.getString("ORDERID"));
					int CUSTID = Integer.parseInt(result3.getString("CUSTID"));
					int BOOKID = Integer.parseInt(result3.getString("ORDERID"));
					int SALEPRICE = Integer.parseInt(result3.getString("SALEPRICE"));
					String ORDERDATE = result3.getString("ORDERDATE");
					
					System.out.println("ORDERID:" + ORDERID);
					System.out.println("CUSTID:" + CUSTID);
					System.out.println("BOOKID:" + BOOKID);
					System.out.println("SALEPRICE :" + SALEPRICE );
					System.out.println("ORDERDATE :" + ORDERDATE );
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

