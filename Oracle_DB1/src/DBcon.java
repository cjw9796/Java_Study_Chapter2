import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

// DB연결을 클래스화 

public class DBcon {

	public static Connection dbConn;

	public static Connection getConnection() {

		Connection con = null;

		try {
			String user = "user1";
			String pw = "1234";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";

			// jdbc:oracle:thin
			// 오라클에 접속하겠다고 알려줌

			// 내 ip 주소
			// @localhost

			// 포트 번호 -> 1521
			// 접속할 DB 이름 orcl

			Class.forName("oracle.jdbc.driver.OracleDriver"); // JDBC 드라이버(ojdbc6~8.jar)를 로딩하는 부분이다.

			con = DriverManager.getConnection(url, user, pw); // 데이터베이스 연결

			if (con != null) {
				System.out.println("연결성공");

			}

		} catch (ClassNotFoundException e) {
			// 로딩 실패 classNotFoundException
			System.out.println("데이터베이스 연결 에러!" + e.toString());
		} catch (SQLException e) {
			System.out.println("DB접속 실패 :" + e.toString());
		}

		return con;

	}
}