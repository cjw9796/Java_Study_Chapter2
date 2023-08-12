import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Oracle_DB1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("테스트");

		Connection con = null; // DB연결된 상태(세션)을 담는 객체

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// JDBC 드라이버(ojdbc6~8.jar)를 로딩하는 부분이다.

			String user = "user1";
			String pw = "1234";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			// jdbc:oracle:thin 오라클에 접속하겠다고 알려줌
			// 내 ip주소
			// @localhost
			// 포트 번호 -> 1521
			// 접속할 DB이름 -> orcl
			// 11버전 : jdbc:oracle:thin:@localhost:1521:xe
			//노트북 jar 경로 C:\Users\jungwookchoi\Desktop\java_jungwook\javapart2\dev\oracledev\app\oracle\product\11.2.0\server\jdbc\lib 에서 ojdbc6 선택  

			con = DriverManager.getConnection(url, user, pw);

			System.out.println("연결 성공!");

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			// JDBC 드라이버 로딩 실패 : ClassNotFoundException
			System.out.println("드라이버 로딩 에러" + e.toString());
		} catch (SQLException e) {
			System.out.println("DB 접속 실패:" + e.toString());
		}

	}

}
