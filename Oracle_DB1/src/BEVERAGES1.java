import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class BEVERAGES1 {

	public static void main(String[] args) {

		Connection con = null; // DB연결된 상태(세션)을 담는 객체
		PreparedStatement pstm = null; // sql문을 나타내는 객체
		ResultSet rs = null; // 쿼리문을 날린 것에 대한 반환값을 담는 객체

		try {
			// sql 문장을 만들고 만약 문장이 질의어(select문)라면
			// 그 결과를 담는 resultset객체를 준비한 후 실행한다.

			con = DBcon.getConnection();

			// SQL 쿼리 실행
			// BEVERAGES테이블
			String quary = "SELECT * FROM BEVERAGES";
			pstm = con.prepareStatement(quary);
			rs = pstm.executeQuery();

			// 결과 처리
			System.out.println("BEVERAGES 테이블");
			while (rs.next()) {

				// 결과 값 추출
				String NAME = rs.getString("NAME");
				int PRICE = Integer.parseInt(rs.getString("PRICE"));
				String BTYPE = rs.getString("BTYPE");

				// 필요한 작업 수행
				System.out.print(NAME);
				System.out.print(PRICE);
				System.out.print(BTYPE);
				System.out.println();
			}

			// ORDER_DETAILS테이블
			String quary2 = "SELECT * FROM ORDER_DETAILS";
			pstm = con.prepareStatement(quary2);
			rs = pstm.executeQuery();

			System.out.println("ORDER_DETAILS 테이블");
			while (rs.next()) {

				// 결과 값 추출
		
				int ORDER_ID = Integer.parseInt(rs.getString("ORDER_ID"));
				int BEVERAGE_ID = Integer.parseInt(rs.getString("BEVERAGE_ID"));
				int COUNT = Integer.parseInt(rs.getString("COUNT"));

				// 필요한 작업 수행
				System.out.print(ORDER_ID + ",");
				System.out.print(BEVERAGE_ID + ",");
				System.out.print(COUNT );
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