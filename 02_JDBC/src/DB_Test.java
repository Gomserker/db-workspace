import java.sql.*;

public class DB_Test {

	public static void main(String[] args) throws SQLException {
		//껍데기 con, st, rs
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String sql = "select*from db_test";
		//연결
		Connection con = DriverManager.getConnection(url, "bg", "bg");
System.out.println("성공");
	}
}