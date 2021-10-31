import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DBMain {
	public static void main(String[] args) throws SQLException {
		/*
		 connection은 껍데기에 불과하다.
 		 build path로 ojdbc.jar을 라이브러리에 추가하는 방법 외에도
		 configure -> convert to maven project를 선택
		 pom.xml이라는 파일이 프로젝트 내에 추가된다.
		 mvnrepository에서 ojdbc maven 경로를 복사해 붙여서 ojdbc8.jar를 로드할 수 있다.
		 */
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Connection con = DriverManager.getConnection(url, "bg", "bg");
		System.out.println("connection complete with maven");
		
//		자바에서 CRUD 중 - Create를 해보자 -> resultSet이 필요 없다. resultSet이 필요한 경우는 select로 데이터를 조회할때만.
//		executeQuery = select (c Read ud)
//		executeUpdate = 나머지 (C r UD)
		Statement st = con.createStatement();
		
		String sql = "insert into db_test values (db_test_seq.nextval, '민수', 23)";
		if(st.executeUpdate(sql) == 1) {
			System.out.println("new item updated");
		} else {
			System.out.println("update failed");
		}
		st.close();
		con.close();
	}
}
