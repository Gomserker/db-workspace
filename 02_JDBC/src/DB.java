import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DB {
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		
//	1. 드라이버 로드하기 -> 왜 주석처리하는데 연결이 되죠? -> 버전업이 되면서 Connection이 드라이버를 알아서 추가해 준다. -> 결국 생략해도 됨. -> 근데 왜 씀?
//		-> Connection이 못 잡을때가 있음. 그래서 뭐 편한대로 하는데 난 그냥 쓸랍니다.
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
//	2. 연결 객체 얻기
		String url = "jdbc:oracle:thin:@localhost:152asdfser1:xe";
		Connection con = DriverManager.getConnection(url, "id", "pw");
//		System.out.println("Connection Compelete");
		
//	3. 실행 도구 생성
		Statement st = con.createStatement();
		
//	4. 결과를 얻기
		String sql = "select * from db_test";
		ResultSet rs = st.executeQuery(sql);
//		db_test 테이블 전체가 rs에 들어가 있음.
		
		if(rs.next()) {
			String name = rs.getString("d_name");
			System.out.println(name);
			
			int age = rs.getInt("d_age");
			System.out.println(age);
		}
		
//		java로 db를 제어할땐 반드시 close() 메소드로 닫아줘야한다.
//		꼭 반드시 무조건 사용한 역순으로 닫아줘야한다.
		rs.close();
		st.close();
		con.close();
		
	}
}
