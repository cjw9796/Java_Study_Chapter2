package enrolment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SubjectDAO {

	private SubjectDAO() {}
	private static SubjectDAO instance = new SubjectDAO();
	
	public static SubjectDAO getInstance() {
		return instance;
	}
	
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
		
	// 연동하는 메서드!	
	private Connection getConnection() {
		String dbURL = "jdbc:mysql://localhost:3306/enrolment01?serverTimezone=UTC";
		String dbID = "root";
		String dbPassword = "dnrwjdchl357@";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	
	//08_subjectInfo.jsp에 사용되는 메서드 
	public ArrayList<SubjectDTO> getAllSubject(){
		ArrayList<SubjectDTO> s = new ArrayList();
		
		SubjectDTO sto = null;
		
		try {
			conn = getConnection();
			
			//1. 조회하기 subject01 모두 가져오기 
			String sql = "SELECT * FROM SUBJECT01";
			
			//2. rs 저장하기 
			pstmt =  conn.prepareStatement(sql);
			rs = pstmt.executeQuery();	//전송
			
			//3. 데이터가 있다면 rs에서 꺼내서 sto에 저장하기 
			while(rs.next()) {
				sto = new SubjectDTO();
				sto.setSubjectNum(rs.getInt(1));
				sto.setSubjectName(rs.getString(2));
				sto.setProfessorName(rs.getString(3));
				sto.setHakjom(rs.getInt(4));
				sto.setMajor(rs.getString(5));
				sto.setRoom(rs.getString(6));
				sto.setSubjectPurpos(rs.getString(7));
				sto.setSubjectGoal(rs.getString(8));
				sto.setSubjectTest(rs.getString(9));
				sto.setGrade(rs.getInt(10));
				sto.setStudentCount(rs.getInt(11));
				
				//4. s 리스트에 추가한다.
				//리스트 추가
				s.add(sto);
			}
			
		}catch(Exception e) {
			System.out.println(e.toString());
		}finally {
			
			if(conn != null) {
				try {
					rs.close();
					conn.close();
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}		
		
		return s;
	}
	
	//(08_subjectSelectInfo.jsp)하나의 과목을 선택하면 강의계획서 보여주는 메서드 
	public SubjectDTO getOneSubject(int subjectNum) {
		SubjectDTO sto = new SubjectDTO();
		
		
		try {
			conn = getConnection();
			
			//subjectNum 해당하는 내용 가져오기
			String sql = "SELECT * FROM SUBJECT01 WHERE SUBJECTNUM=?";
			
			//2. rs 저장하기 
			pstmt =  conn.prepareStatement(sql);
			pstmt.setInt(1, subjectNum);
			rs = pstmt.executeQuery();	//전송
			
			//3. 데이터가 있다면 rs에서 꺼내서 sto에 저장하기 
			if(rs.next()) {
				sto.setSubjectNum(rs.getInt(1));
				sto.setSubjectName(rs.getString(2));
				sto.setProfessorName(rs.getString(3));
				sto.setHakjom(rs.getInt(4));
				sto.setMajor(rs.getString(5));
				sto.setRoom(rs.getString(6));
				sto.setSubjectPurpos(rs.getString(7));
				sto.setSubjectGoal(rs.getString(8));
				sto.setSubjectTest(rs.getString(9));
				sto.setGrade(rs.getInt(10));
				sto.setStudentCount(rs.getInt(11));
			}}catch(Exception e) {
				System.out.println(e.toString());
			}finally {
				
				if(conn != null) {
					try {
						rs.close();
						conn.close();
						pstmt.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		
			
			
		return sto;
		
	}
	
	
}
