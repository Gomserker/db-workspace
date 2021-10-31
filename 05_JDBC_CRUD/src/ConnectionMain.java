import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionMain {
	public static void main(String[] args) throws SQLException {
		
//		DB 연결하기
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		
		
//		연결시도 -> 주소 -> 연결할 db 메이커(oracle, mysql 등) 판단
//		자동으로 맞는 driver를 찾아준다.
		
		Connection con = DriverManager.getConnection(url, "bg", "bg");
		System.out.println("연결 성공");
		
		
		con.close();
		
	}
}
