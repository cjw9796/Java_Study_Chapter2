import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class PreparedStatementTest {

	public static void main(String[] args) {

		Connection con = null; // DB연결된 상태(세션)을 담는 객체
		PreparedStatement pstm = null; // sql문을 나타내는 객체
		ResultSet rs = null; // 쿼리문을 날린 것에 대한 반환값을 담는 객체

		// 쿼리문을 전송할 수 있는 인터페이스 2가지
		// 공통점
		// 둘다 쿼리를 전송기능을 가지고 있다.
		// try ~ catch문으로 throw를 처리해야된다. 예외처리!
		// String객체를 전달한다.
		// Statement 정적인 쿼리문을 처리할 수 있다.
		// 쿼리문에 값이 미리 입력 되어있어야한다.

		// Statement 컴파일이 될 때마다 서버에가서 컴파일을 계속해서
		// 정보를 가지고 온다.

		try {
			// sql 문장을 만들고 만약 문장이 질의어(select문)라면
			// 그 결과를 담는 resultset객체를 준비한 후 실행한다.

			// SQL 쿼리 실행
			String quary = "SELECT * FROM CAFE";

			con = DBcon.getConnection();
			pstm = con.prepareStatement(quary);
			rs = pstm.executeQuery();

			// 결과 처리
			while (rs.next()) {

				// 결과 값 추출
				String CAFEID = rs.getString("CAFEID");
				String CAFENAME = rs.getString("CAFENAME");
				String CORPORATION = rs.getString("CORPORATION");
				int PRICE = Integer.parseInt(rs.getString("PRICE"));

				// 필요한 작업 수행
				System.out.print(CAFEID);
				System.out.print(CAFENAME);
				System.out.print(PRICE);
				System.out.print(CORPORATION);
				System.out.println();

			}

		} catch (SQLException e) {
			System.out.println("select  문에서 예외가 발생할 수 있다.");
		} finally {
			// 연결 및 자원 해제
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstm != null) {
					pstm.close();
				}
				if (con != null) {
					con.close();
				}

			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}

	}
}