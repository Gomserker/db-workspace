import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBMain {
	public static void main(String[] args) throws SQLException {
		//DB 관련 작업을 하려면
//		껍데기 3개를 반드시 기억할것
//		connection, statement, resultSet
//		뭘 하든 CRUD, DB에 연결하는 것이 1순위
		
//		1.연결
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "bg";
		String pw = "bg";
				
		Connection con = DriverManager.getConnection(url, id, pw);
//		프로젝트를 새로 만들때마다 ojdbc를 빌드패스에 넣었는지 확인할것. connection이 하는게 뭐냐 대체!
		System.out.println("connection complete");
		
//		실행 도구 만들기 -> executeQuery 등을 실행할 때 쓰는것
		Statement st = con.createStatement();
		
		String query = "select * from db_test";
		ResultSet rs = st.executeQuery(query);
		
//		테이블 상에서 커서 이동, 그런데 전체조회는 어떻게함? -> 반복문을 사용!
		while(rs.next()) {
			System.out.println(rs.getString("d_name"));
			System.out.println(rs.getInt("d_age"));
			System.out.println("---------------------------");
		}
		rs.close();
		st.close();
		con.close();
	}
}
