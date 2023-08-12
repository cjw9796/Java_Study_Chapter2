import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class StatementTest {

	public static void main(String[] args) {

		Connection con = null; // DB연결된 상태(세션)을 담는 객체
		Statement stm = null; // sql문을 나타내는 객체

		try {
			con = DBcon.getConnection();
			stm = con.createStatement();

			String quary = "INSERT INTO TEST VALUES('ID1','PW1','NAME1')";
			

			int success = stm.executeUpdate(quary);

			if (success > 0) {
				System.out.println("데이터 입력 성공");
			} else {
				System.out.println("데이터 입력 실패");
			}

		} catch (SQLException sql) {
			System.out.println(sql.toString());
		}

	}
}