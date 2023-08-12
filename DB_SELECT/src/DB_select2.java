
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

// MySQL과 기본 연결 
public class DB_select2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("MySQL SELECT");
	

		// 8.x
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // Class.forName() 메서드를 이용해서 JDBC 드라이버를 로딩
			String url = "jdbc:mysql://localhost:3306/BOOKSTORE?serverTimezone=UTC"; // DB연결 (로컬호스트 뒤에 DB명)
			String user = "root"; // mysql 워크벤치 아이디
			String pass = "dnrwjdchl357@"; // mysql 워크벤치 비밀번호

			// 데이터베이스 실제 연결을 도와주는 클래스
//			Connection con = DriverManager.getConnection(url, user, pass);
			try {
				Connection con = DriverManager.getConnection(url, user, pass);

				if (con != null) {
					System.out.println("DB연결 성공!");
				}

				// BOOK 테이블 가져오기
				Statement stmt = con.createStatement(); // DB와 연결된 con 객체로 부터 Statement 객체 획득.

				ResultSet result = stmt.executeQuery("select * from BOOK");

				while (result.next()) {

					// 컬럼 이름을 이용해서 데이터를 뽑는게 더 안전하다.
					// getString("컬럼이름")
					int BOOKID = Integer.parseInt(result.getString("BOOKID"));
					String BOOKNAME = result.getString("BOOKNAME");
					String PUBLISHER = result.getString("PUBLISHER");
					int PRICE = Integer.parseInt(result.getString("PRICE"));

					System.out.println("BOOKID:" + BOOKID);
					System.out.println("BOOKNAME:" + BOOKNAME);
					System.out.println("PUBLISHER:" + PUBLISHER);
					System.out.println("PRICE :" + PRICE);
					System.out.println();

				}

				// CUSTOMER 테이블 가져오기
				Statement stmt2 = con.createStatement();

				ResultSet result2 = stmt2.executeQuery("select * from CUSTOMER");

				while (result2.next()) {

					// 컬럼 이름을 이용해서 데이터를 뽑는게 더 안전하다.
					// getString("컬럼이름")
					int CUSTID = Integer.parseInt(result2.getString("CUSTID"));
					String NAME = result2.getString("NAME");
					String ADDRESS = result2.getString("ADDRESS");
					String PHONE = result2.getString("PHONE");

					System.out.println("CUSTID:" + CUSTID);
					System.out.println("NAME:" + NAME);
					System.out.println("ADDRESS:" + ADDRESS);
					System.out.println("PHONE :" + PHONE);
					System.out.println();

				}

				// ORDERS 테이블 가져오기
				Statement stmt3 = con.createStatement();

				ResultSet result3 = stmt3.executeQuery("select * from ORDERS");

				while (result3.next()) {
					int ORDERID = Integer.parseInt(result3.getString("ORDERID"));
					int CUSTID = Integer.parseInt(result3.getString("CUSTID"));
					int BOOKID = Integer.parseInt(result3.getString("ORDERID"));
					int SALEPRICE = Integer.parseInt(result3.getString("SALEPRICE"));
					String ORDERDATE = result3.getString("ORDERDATE");

					System.out.println("ORDERID:" + ORDERID);
					System.out.println("CUSTID:" + CUSTID);
					System.out.println("BOOKID:" + BOOKID);
					System.out.println("SALEPRICE :" + SALEPRICE);
					System.out.println("ORDERDATE :" + ORDERDATE);
					System.out.println();
				}

				// [문제 SET1] 마당서점의 고객이 요구하는 다음 질문에 대해 SQL문을 작성하시오.
				// 1. 도서번호가 1인 도서의 이름
				ResultSet result4 = stmt.executeQuery(" select * from BOOK where BOOKID =1");
				System.out.println("1번 문제 실행결과");
				while (result4.next()) {

					int BOOKID = Integer.parseInt(result4.getString("BOOKID"));
					String BOOKNAME = result4.getString("BOOKNAME");

					System.out.println("도서번호가 1인 도서의 이름");
					System.out.println("BOOKID:" + BOOKID);
					System.out.println("BOOKNAME:" + BOOKNAME);
					System.out.println();
				}

				// 2. 가격이 20,000 이상인 도서의 이름

				ResultSet result5 = stmt.executeQuery(" select BOOKNAME from BOOK where PRICE >= 20000");
				System.out.println("2번 문제 실행결과");
				while (result5.next()) {
					String BOOKNAME = result5.getString("BOOKNAME");

					System.out.println("BOOKNAME:" + BOOKNAME);
					System.out.println();
				}

				// 3. 박지성의 총 구매액(박지성의 고객번호는 1번으로 놓고 작성)

				ResultSet result6 = stmt
						.executeQuery(" select SUM(SALEPRICE) AS TOTAL_PRICE " + "from ORDERS " + "where CUSTID = 1");

				System.out.println("3번 문제 실행결과");

				while (result6.next()) {
					int TOTAL_PRICE = Integer.parseInt(result6.getString("TOTAL_PRICE"));

					System.out.println("박지성의 총 구매액 :" + TOTAL_PRICE);
					System.out.println();
				}

				// 4. 박지성이 구매한 도서의 수 (박지성의 고객번호는 1번으로 놓고 작성)

				ResultSet result7 = stmt.executeQuery("SELECT COUNT(BOOKID) AS TOTAL_BUY FROM ORDERS WHERE CUSTID = 1");
				System.out.println("4번 문제 실행결과");
				while (result7.next()) {

					int TOTAL_BUY = Integer.parseInt(result7.getString("TOTAL_BUY"));

					System.out.println("박지성이 구매한 도서의 수:" + TOTAL_BUY);
					System.out.println();
				}

				// [문제 SET2] 마당서점의 운영자와 경영자가 요구하는 다음 질문에 대해 SQL문을 작성하시오.

				// 1. 마당서점 도서의 총 개수

				ResultSet result8 = stmt.executeQuery("SELECT COUNT(BOOKID) AS TOTAL_COUNT FROM BOOK");
				System.out.println("2-1번 문제 실행결과");
				while (result8.next()) {

					int TOTAL_COUNT = Integer.parseInt(result8.getString("TOTAL_COUNT"));

					System.out.println("마당서점 도서의 총 개수 :" + TOTAL_COUNT);
					System.out.println();
				}

				// 2. 마당서점에 도서를 출고하는 출판사의 총 개수

				ResultSet result9 = stmt.executeQuery("SELECT COUNT(PUBLISHER) AS TOTAL_PUBLISHER FROM BOOK");
				System.out.println("2-2번 문제 실행결과");
				while (result9.next()) {
					int TOTAL_PUBLISHER = Integer.parseInt(result9.getString("TOTAL_PUBLISHER"));

					System.out.println("마당서점에 도서를 출고하는 출판사의 총 개수  :" + TOTAL_PUBLISHER);
					System.out.println();
				}

				// 3. 모든 고객의 이름, 주소

				ResultSet result10 = stmt.executeQuery("SELECT NAME, ADDRESS FROM CUSTOMER");
				System.out.println("2-3번 문제 실행결과");
				while (result10.next()) {

					String NAME = result10.getString("NAME");
					String ADDRESS = result10.getString("ADDRESS");

					System.out.print(NAME + "  ");
					System.out.print(ADDRESS);
					System.out.println();
				}

				// 4. 2014년 7월 4일 ~ 7월 7일 사이에 주문받은 도서의 주문번호

				ResultSet result11 = stmt.executeQuery(
						"SELECT ORDERID" + " FROM ORDERS" + " WHERE ORDERDATE BETWEEN '2020-07-04' AND '2020-07-07' ");
				System.out.println("2-4번 문제 실행결과");
				System.out.println("2014년 7월 4일 ~ 7월 7일 사이에 주문받은 도서의 주문번호");
				while (result11.next()) {
					int ORDERID = Integer.parseInt(result11.getString("ORDERID"));

					System.out.println("주문번호:" + ORDERID);
					System.out.println();
				}

				// 5. 2014년 7월 4일 ~ 7월 7일 사이에 주문받은 도서를 제외한 도서의 주문번호

				ResultSet result12 = stmt.executeQuery(
						"select orderid from orders where orderdate NOT between '2020-07-04' and '2020-07-07'");
				System.out.println("2-5번 문제 실행결과");
				while (result12.next()) {
					int ORDERID = Integer.parseInt(result12.getString("ORDERID"));

					System.out.println("주문번호:" + ORDERID);

					System.out.println();

				}

				// 6. 성이 '김'씨인 고객의 이름과 주소

				ResultSet result13 = stmt.executeQuery("SELECT NAME, ADDRESS FROM CUSTOMER WHERE NAME LIKE '김%'");
				System.out.println("2-6번 문제 실행결과");
				while (result13.next()) {
					String NAME = result13.getString("NAME");
					String ADDRESS = result13.getString("ADDRESS");

					System.out.print(NAME + " ");
					System.out.println(ADDRESS);
					System.out.println();
				}

				// 7. 성이 '김'씨이고 이름이 '아'로 끝나는 고객의 이름과 주소

				ResultSet result14 = stmt
						.executeQuery("SELECT NAME, ADDRESS FROM CUSTOMER WHERE NAME LIKE '김%' AND NAME LIKE '%아'");
				System.out.println("2-7번 문제 실행결과");
				while (result14.next()) {
					String NAME = result14.getString("NAME");
					String ADDRESS = result14.getString("ADDRESS");

					System.out.print(NAME + " ");
					System.out.println(ADDRESS);
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
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	public static void close(Statement conn) {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	public static void close(PreparedStatement conn) {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	public static void close(ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
