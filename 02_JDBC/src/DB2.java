import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DB2 {
	public static void main(String[] args) throws SQLException {
		
//		껍데기 con, st, rs
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		
		//연결
		Connection con = DriverManager.getConnection(url, "bg", "bg");
		
		//실행도구
		Statement st = con.createStatement();
		
		//결과 얻기 변수명.executeQuery("사용하고 싶은 sql 명령어");
		String sql = "select * from db_test";
		ResultSet rs = st.executeQuery(sql);
		
		rs.next();
		rs.next();
		String name = rs.getString("d_name");
		System.out.println(name);
		
		int age = rs.getInt("d_age");
		System.out.println(age);
	}
}
